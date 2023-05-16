FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7 as java-builder
LABEL maintainer="OpsMx"
ARG JAVA_PACKAGE=java-1.8.0-openjdk-devel
RUN microdnf update && microdnf install --setopt=tsflags=nodocs ${JAVA_PACKAGE}
ENV server_port=8088
COPY /target/issuegen-0.1.jar /opt/issuegen-0.1.jar && dockerrun.sh /usr/local/bin/dockerrun.sh
RUN chmod +x /usr/local/bin/dockerrun.sh \
    rm -rf /var/log/*
CMD ["dockerrun.sh"]



