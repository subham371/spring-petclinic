From docker.io/maven

COPY . /app/

WORKDIR /app/

EXPOSE 8080

RUN mvn package

CMD ["java", "-jar", "target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
