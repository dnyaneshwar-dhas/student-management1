FROM maven:3.9-eclipse-temurin-21 AS build
COPY ./student-management1 
WORKDIR /student-management1
RUN mvn clean package

FROM tomcat:10.1-jre21-temurin
COPY --from=build /student-management1/target/*.war webapps/student.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

