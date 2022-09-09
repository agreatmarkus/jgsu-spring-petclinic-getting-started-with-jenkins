#
# Build stage
#
FROM maven:alpine as builder
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.mv2 mvn -f $HOME/pom.xml clean package
#
# Package stage
#
FROM openjdk:8-jdk-alpine
ENV HOME=/usr/app
COPY --from=builder $HOME/target/*.jar /usr/local/lib/target/
ENTRYPOINT ["java", "-jar", "/usr/local/lib/*.jar"]
