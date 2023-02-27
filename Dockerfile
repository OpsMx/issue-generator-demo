FROM registry.access.redhat.com/ubi8/openjdk-11:1.14-12.1675788288
## restapp port ####
ENV server_port=8088
RUN apt-get update && apt-get install stress-ng -y
COPY /target/issuegen-0.1.jar /opt/issuegen-0.1.jar
COPY dockerrun.sh /usr/local/bin/dockerrun.sh
RUN chmod +x /usr/local/bin/dockerrun.sh
###### for newrelic-agent only
#COPY newrelic/* /opt/newrelic/
#COPY datadog  /opt/datadog/
#COPY appdynamic /opt/appdynamic/
##### for promothues-agent
#COPY prometheus/jmx_prometheus_javaagent-0.1.0.jar /opt/jmx_prometheus_javaagent-0.1.0.jar
#COPY prometheus/tomcat.yml /opt/tomcat.yml
####  for DD-agent
#COPY tomcat.yaml /etc/dd-agent/conf.d/tomcat.yaml
#COPY install-dd.sh install-dd.sh
#RUN DD_API_KEY=<KEY> bash install-dd.sh
CMD ["dockerrun.sh"]

