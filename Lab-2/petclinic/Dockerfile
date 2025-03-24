FROM alpine:3.19 AS builder

RUN apk add --no-cache openjdk17 maven

WORKDIR /app

COPY . .

RUN mkdir -p /root/.m2
VOLUME /root/.m2

RUN ./mvnw dependency:go-offline -B

RUN ./mvnw clean package -DskipTests

FROM alpine:3.19

RUN apk add --no-cache openjdk17-jre

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/target/spring-petclinic-*.jar app.jar
RUN chown appuser:appgroup app.jar

VOLUME /home/appuser/.m2

RUN rm -rf /tmp/*

USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
