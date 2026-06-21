#!/bin/bash

echo "Starting Deployment..."

# Navigate to project directory
cd ~/Task-Manager

# Pull latest code from GitHub
git pull origin master

# Make sure Maven wrapper is executable
chmod +x mvnw

# Find and kill the existing running Spring Boot application process on port 8081
PID=$(lsof -t -i:8081)
if [ -n "$PID" ]; then
    echo "Stopping existing application running on PID: $PID"
    kill -9 $PID
fi

# Build and run the app cleanly in the background, saving logs to app.log
echo "Building and starting fresh instance..."
nohup ./mvnw spring-boot:run >app.log 2>&1 &

echo "Deployment completed successfully!"
