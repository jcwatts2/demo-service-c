# Stage 1: Compile and build the application
FROM amazoncorretto:17-alpine-jdk AS build
WORKDIR .

# Copy the Gradle configuration files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Copy the source code
COPY src src

# Grant execution permissions to the Gradle wrapper and build the project
RUN chmod +x ./gradlew && ./gradlew build

# Stage 2: Create the runtime image
FROM amazoncorretto:17.0.1-alpine3.15
WORKDIR /app

# Copy the built artifact from the build stage
COPY --from=build build/libs/*.jar app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]