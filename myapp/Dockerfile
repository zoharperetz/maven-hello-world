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
RUN addgroup appuser && \
    adduser -G appuser -D appuser
USER appuser
CMD java -jar app.jar 


