FROM maven:3.6-jdk-8-alpine as BUILD
RUN mkdir -p /root/dev/myapp/
WORKDIR /root/dev/myapp/
COPY pom.xml .
RUN mvn -B dependency:go-offline
COPY . .
RUN mvn -B package --file pom.xml


FROM openjdk:8-jdk-alpine
COPY --from=BUILD /root/dev/myapp/target/*.jar /app/app.jar
WORKDIR /app
RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -s /bin/sh -D appuser
USER appuser
CMD java -jar app.jar 


