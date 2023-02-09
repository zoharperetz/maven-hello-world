FROM openjdk:8-jdk-alpine
COPY myapp/target/*.jar /app/app.jar
WORKDIR /app
ENV JAR_FILE=app.jar
EXPOSE 5000
RUN adduser -D myuser
USER myuser
#CMD ["java", "-jar", "${JAR_FILE}"]
CMD java -jar ${JAR_FILE} && tail -f /dev/null

