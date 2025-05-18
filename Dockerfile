# Use official OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set environment variables
ENV APP_HOME=/app

# Create app directory
WORKDIR $APP_HOME

# Copy Maven build artifact (your .jar file) into the container
COPY target/taskmanager-0.0.1-SNAPSHOT.jar app.jar

# Expose port (should match server.port in application.properties)
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
