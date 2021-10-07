FROM maven:3-jdk-8 as build

ENV HOME=/home/usr/app

VOLUME /tmp
WORKDIR $HOME
ADD pom.xml $HOME

RUN mvn dependency:resolve

ADD . $HOME

RUN mvn package
RUN mv ./target/balancereader-*.jar /app.jar

FROM openjdk:8-jdk-alpine
WORKDIR /

COPY --from=build /app.jar /

EXPOSE 8080

CMD java -jar /app.jar
