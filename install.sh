#!/bin/bash
# Usage install.sh [instanceName] [password] [namespace]

die () {
    echo >&3 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "Usage install.sh [instanceName] [password] [Namespace]"

DIR=$(dirname $0)
if [ "$DIR" = "." ]; then
DIR=$(pwd)
fi

instanceName=$1
password=$2
NameSpace=IRISAPP

# Installer source (Installer.*.cls)
DirInstall=$DIR
# Source dir to install by source installer
DirSrc=$DIR/src


echo "+-------------------------------------------------+"
echo "|              Now it's show time !               |"
echo "|         iris session going in action            |"
echo "+-------------------------------------------------+"
irissession $instanceName -U USER <<EOF
sys
$2
WRITE "[ OK ] Start a terminal session for the instance $instanceName"


ZN "USER"
WRITE "[ OK ] Set USER namespace as current namespace"

SET tSc = \$SYSTEM.OBJ.ImportDir("$DirInstall", "Installer.cls", "cubk", .tErrors, 1)
WRITE:(tSc'=1) "[ FAIL ] Import and compile the installer class: "_tErrors
DO:(tSc'=1) \$SYSTEM.Process.Terminate(,1),h
WRITE "[ OK ] Import and compile the installer class"


SET pVars("Namespace")="$NameSpace"
SET tSc = ##class(App.Installer).setup(.pVars)
WRITE:(tSc'=1) "[ FAIL ] Create namespace $NameSpace"
DO:(tSc'=1) \$SYSTEM.Process.Terminate(,1),h
WRITE "[ OK ] Create namespace $NameSpace"


ZN "$NameSpace"
WRITE "[ OK ] Set $NameSpace namespace as current namespace"

SET source="$DirSrc"
SET tSc = \$SYSTEM.OBJ.ImportDir(source, "*.cls;*.inc;*.mac", "cubk", .tErrors, 1)
WRITE:(tSc'=1) "[ FAIL ] Import and compile sources: "_\$System.Status.GetErrorText(tSc)
DO:(tSc'=1) \$SYSTEM.Process.Terminate(,1),h
WRITE "[ OK ] Compile sources"

WRITE "Install PetShop Demo"
DO ^%REST 
PetShop
Y 
https://petstore.swagger.io/v2/swagger.json
Y
Y
/csp/petshop

WRITE "Demo of the library"
zw ##class(Grongier.OpenApi.Definition).Process("PetShop.spec")

WRITE "[ OK ] Everything is OK."
halt
EOF
