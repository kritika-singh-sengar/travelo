FROM openjdk:11

MAINTAINER kritika singh

ARG JAR_FILE=target/hotel-search.jar

ADD ${JAR_FILE} hotel-search.jar

ENTRYPOINT ["java","-jar","/hotel-search.jar"]