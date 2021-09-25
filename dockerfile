FROM maven:3.8.2-jdk-11 as maven
WORKDIR /home/hw/maven
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello /home/hw/maven
RUN mvn package
CMD ["mvn"]
FROM tomcat:9.0.53-jdk8
COPY --from=maven /home/hw/maven/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]