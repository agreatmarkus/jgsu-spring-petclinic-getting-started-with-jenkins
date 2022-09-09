#
# Build stage
#
FROM maven:3.8-jdk-11 as builder
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.mv2 mvn -f $HOME/pom.xml clean package
#
# Package stage
#
FROM openjdk:20-slim-buster
ENV HOME=/usr/app
COPY --from=builder $HOME/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /usr/local/lib/spring-petclinic.jar
ENTRYPOINT ["java", "-jar", "/usr/local/lib/spring-petclinic.jar"]
