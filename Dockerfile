FROM tomcat:9.0.50-jdk8-openjdk-slim

EXPOSE 8080

RUN rm -rf /usr/local/tomcat/webapps/*

ADD target/petclinic.war /usr/local/tomcat/webapps/petclinic.war

CMD ["catalina.sh", "run"]
