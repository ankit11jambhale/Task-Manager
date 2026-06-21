# Step 1: Use an official OpenJDK runtime environment as a base image
FROM eclipse-temurin:17-jdk-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the compiled .jar file from your local target folder into the container
COPY target/*.jar app.jar

# Step 4: Expose port 8081 so traffic can reach your app
EXPOSE 8081

# Step 5: Define the command to execute your application
ENTRYPOINT ["java", "-jar", "app.jar"]