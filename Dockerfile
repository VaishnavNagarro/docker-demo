# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the project’s build output jar to the working directory
# Assuming your jar file is named docker-demo-0.0.1-SNAPSHOT.jar
# Adjust the name according to your build output
COPY target/docker-demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]