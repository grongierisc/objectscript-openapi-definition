ARG IMAGE=store/intersystems/irishealth-community:2020.1.0.215.0
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER irisowner

COPY  Installer.cls .
COPY  install.sh .
COPY  src src

# Install
# $ISC_PACKAGE_INSTANCENAME name of the iris instance on docker, defaults to IRIS, valued by InterSystems
# First start the instance quietly in emergency mode with user sys and password sys
RUN iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyId=sys,sys && \
    sh install.sh $ISC_PACKAGE_INSTANCENAME sys IRISAPP && \
    /bin/echo -e "sys\nsys\n" | iris stop $ISC_PACKAGE_INSTANCENAME quietly

# Cleanup
USER root
RUN rm -f $ISC_PACKAGE_INSTALLDIR/mgr/messages.log && \
    rm -f $ISC_PACKAGE_INSTALLDIR/mgr/alerts.log && \
    rm -f $ISC_PACKAGE_INSTALLDIR/mgr/IRIS.WIJ && \
    rm -f $ISC_PACKAGE_INSTALLDIR/mgr/journal/* && \
    rm -fR src

USER irisowner
