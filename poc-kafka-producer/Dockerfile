FROM openjdk:17-jdk-slim
VOLUME /tmp

RUN groupadd spring && useradd spring -g spring
USER spring:spring
COPY target/poc-kafka-producer*.jar app.jar

ENTRYPOINT ["java","-jar", "/app.jar"]
