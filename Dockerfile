FROM maven:3 as BUILD
ENV APP_HOME=/root/dev/myapp/
RUN mkdir -p $APP_HOME/src/main/java
WORKDIR $APP_HOME
COPY . .
RUN mvn -B compile --file pom.xml
RUN mvn -B package --file pom.xml
#RUN mvn -B package -e -X --file myapp/pom.xml

FROM openjdk:8-jdk-alpine
COPY --from=BUILD /root/dev/myapp/target/*.jar /app/app.jar
WORKDIR /app
ENV JAR_FILE=app.jar
RUN adduser -D myuser
USER myuser
#CMD ["java", "-jar", "${JAR_FILE}"]
CMD java -jar ${JAR_FILE} && tail -f /dev/null

