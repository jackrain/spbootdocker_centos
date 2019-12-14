# spbootdocker_centos
#
# VERSION 1.0
FROM registry.acs.aliyun.com/open/java8:5.0.0

MAINTAINER jackrain

ONBUILD ARG JAR_FILE

ONBUILD ARG PORT

ONBUILD ARG JAVA_OPTS

#ENV SET

ONBUILD ENV JAR_FILE ${JAR_FILE:-bootapp.jar}

ONBUILD ENV JAVA_OPTS ${JAVA_OPTS:--Djava.security.egd=file:/dev/./urandom}

ONBUILD ENV HTTP_PORT ${PORT:-8080}

#RUN echo $HTTP_PORT $APP_NAME $JAVA_OPTS

COPY /acs/acsstart /acs/acsstart

COPY /acs/bin /acs/bin

COPY /acs/src /acs/src

#RUN mkdir -p /acs/src

RUN mkdir -p /acs/logs

WORKDIR /acs

RUN echo "spbootdocker setup"

EXPOSE 8080
# Expose the default port
ONBUILD EXPOSE $HTTP_PORT

#ENTRYPOINT ["bash","/acs/acsstart"]

RUN echo "spbootdocker run"