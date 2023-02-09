FROM maven:3-alpine as BUILD
WORKDIR /root/dev/
COPY myapp/ .
RUN mvn -B compile --file myapp/pom.xml
RUN mvn -B package --file myapp/pom.xml


FROM openjdk:8-jdk-alpine
COPY --from=BUILD /root/dev/myapp/target/*.jar /app/app.jar
WORKDIR /app
RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -s /bin/sh -D appuser
USER appuser
#CMD ["java", "-jar", "app.jar"]
CMD java -jar app.jar

