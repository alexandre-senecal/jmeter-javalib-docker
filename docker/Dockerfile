FROM alpine:3.20.3

LABEL maintainer=alexandre.senecal@gmail.com

ARG JMETER_VERSION

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/

RUN apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates || true \
    && apk add --update openjdk11-jre tar tzdata curl unzip bash \
    && cp /usr/share/zoneinfo/America/Toronto /etc/localtime \
    && echo "America/Toronto" >  /etc/timezone \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /tmp/dependencies  \
    && curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
    && mkdir -p /opt  \
    && tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
    && rm -rf /tmp/dependencies

# Include additional plugins
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-autostop/0.1/jmeter-plugins-autostop-0.1.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-autostop-0.1.jar

# Set JMeter classpath to include project dependencies
RUN printf "\nuser.classpath=/opt/dependencies\n" >> ${JMETER_BIN}/jmeter.properties
COPY maven /opt/dependencies

# Overwrite user.properties
COPY launch/user.properties ${JMETER_BIN}/user.properties

# Delete old mongo to avoid issues with libs
RUN rm -f ${JMETER_HOME}/lib/mongo*

ENV PATH $PATH:$JMETER_BIN

COPY launch/launch.sh /

WORKDIR ${JMETER_HOME}

ENTRYPOINT ["/launch.sh"]