FROM openjdk:11

MAINTAINER kritika singh

ARG JAR_FILE=target/login.jar

ADD ${JAR_FILE} login.jar

ENTRYPOINT ["java","-jar","/login.jar"]
