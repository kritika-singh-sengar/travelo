FROM openjdk:11

MAINTAINER Kritika Singh

ARG JAR_FILE=target/flight-search.jar

ADD ${JAR_FILE} flight-search.jar

ENTRYPOINT ["java","-jar","/flight-search.jar"]
