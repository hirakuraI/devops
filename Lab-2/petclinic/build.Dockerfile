ARG IMAGE_SYSTEM=petclinic-system
ARG VERSION=latest

FROM ${IMAGE_SYSTEM}:${VERSION} AS builder

ARG VERSION=latest
LABEL version=${VERSION}

COPY pom.xml ./
COPY .mvn/ .mvn/
COPY mvnw ./

RUN ./mvnw dependency:go-offline -B

COPY src/ src/
RUN ./mvnw clean package -DskipTests && \
    rm -rf /root/.m2/wrapper
