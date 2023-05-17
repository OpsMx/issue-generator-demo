FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7 AS final
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7 as build
LABEL maintainer="OpsMx"
RUN microdnf update && microdnf install --setopt=tsflags=nodocs ${JAVA_PACKAGE}
FROM final
ARG JAVA_PACKAGE=java-1.8.0-openjdk-devel
ENV server_port=8088
COPY /target/issuegen-0.1.jar /opt/issuegen-0.1.jar
COPY dockerrun.sh /usr/local/bin/dockerrun.sh
RUN chmod +x /usr/local/bin/dockerrun.sh
CMD ["dockerrun.sh"]
