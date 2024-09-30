FROM tomcat:9.0.50-jdk8-openjdk-slim

EXPOSE 8080

RUN rm -rf /usr/local/tomcat/webapps/*

ADD target/home.war /usr/local/tomcat/webapps/home.war

CMD ["catalina.sh", "run"]
