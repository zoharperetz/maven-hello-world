FROM anapsix/alpine-java
ADD myapp/target/myapp-*.jar /home/myjar.jar
CMD ["java","-jar","/home/myjar.jar"]
