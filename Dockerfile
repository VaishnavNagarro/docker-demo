# Build Stage
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory inside the build container
WORKDIR /app

# Copy the Maven project files to the build directory
COPY pom.xml .
COPY src ./src

# Build the application and package it as a JAR file
RUN mvn clean package -DskipTests

# Production Stage
FROM openjdk:17-jdk-alpine

# Set the working directory inside the final container
WORKDIR /app

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy the JAR file from the build stage
COPY --from=build /app/target/docker-demo-0.0.1-SNAPSHOT.jar app.jar

# Set file ownership and permissions
RUN chown -R appuser:appgroup /app && chmod 755 /app

# Expose the port the app runs on
EXPOSE 8080

# Switch to the non-root user
USER appuser

# Run the application with least privilege
ENTRYPOINT ["java", "-jar", "app.jar"]