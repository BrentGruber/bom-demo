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
RUN wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.9.1/opentelemetry-javaagent.jar
#RUN wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent-all.jar


EXPOSE 8080

CMD java -javaagent:./opentelemetry-javaagent.jar -Dotel.traces.exporter=jaeger -Dotel.resource.attributes="service.name=balancereader" -Dotel.exporter.jaeger.endpoint=http://grafana-agent.grafana-agent.svc.cluster.local:14250  -Dotel.javaagent.debug=false -jar /app.jar
