ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.221.0-zpm
ARG IMAGE=intersystemsdc/irishealth-community:latest
FROM $IMAGE

USER root   

RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY Installer.cls .
COPY src src
COPY misc misc
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
