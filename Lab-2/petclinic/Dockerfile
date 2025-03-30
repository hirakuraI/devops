ARG IMAGE_BUILD=petclinic-build
ARG VERSION=latest

FROM ${IMAGE_BUILD}:${VERSION} as build-stage

FROM alpine:3.19

ARG VERSION=latest
LABEL version=${VERSION}

RUN apk add --no-cache openjdk17-jre

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=build-stage /app/target/spring-petclinic-*.jar app.jar
RUN chown appuser:appgroup app.jar

VOLUME /home/appuser/.m2

RUN rm -rf /tmp/*

USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
