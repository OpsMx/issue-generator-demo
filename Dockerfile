FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7 AS java-builder
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7 as java-builder1
LABEL maintainer="OpsMx"
ARG JAVA_PACKAGE=java-1.8.0-openjdk-devel
RUN microdnf update && microdnf install --setopt=tsflags=nodocs ${JAVA_PACKAGE}
ENV server_port=8088
FROM java-builder
COPY --from=java-builder1 /target/issuegen-0.1.jar /opt/issuegen-0.1.jar
COPY --from=java-builder1 dockerrun.sh /usr/local/bin/dockerrun.sh
RUN chmod +x /usr/local/bin/dockerrun.sh
RUN rm -rf /var/log/*
CMD ["dockerrun.sh"]
