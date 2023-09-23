FROM openjdk:11

MAINTAINER kritika singh

ARG JAR_FILE=target/payment.jar

ADD ${JAR_FILE} payment.jar

ENTRYPOINT ["java","-jar","/payment.jar"]