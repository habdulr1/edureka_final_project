FROM tomcat:9.0.53-jdk8-openjdk
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8090
