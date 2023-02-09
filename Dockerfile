FROM maven:3 as BUILD
ENV APP_HOME=/root/dev/myapp/
RUN mkdir -p $APP_HOME/src/main/java
WORKDIR $APP_HOME
COPY . .
RUN groupadd --gid 1000 appuser && \
    useradd --uid 1000 --gid 1000 --shell /bin/bash --create-home appuser

RUN chown appuser:appuser myapp/pom.xml
USER appuser
RUN mvn -B compile --file myapp/pom.xml
RUN mvn -B package --file myapp/pom.xml


FROM openjdk:8-jdk-alpine
COPY --from=BUILD /root/dev/myapp/myapp/target/*.jar /app/app.jar
WORKDIR /app
ENV JAR_FILE=app.jar
RUN adduser -D myuser
USER myuser
#CMD ["java", "-jar", "${JAR_FILE}"]
CMD java -jar ${JAR_FILE} 

