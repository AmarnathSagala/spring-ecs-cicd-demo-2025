# === Build stage ===
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q -DskipTests package

# === Runtime stage ===
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]

# Use the official httpd image as the base
FROM httpd:latest

# Copy your custom index.html file into the web server's default directory.
# For Apache (httpd), this is /usr/local/apache2/htdocs/.
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80, which is the default port for HTTP traffic.
EXPOSE 80