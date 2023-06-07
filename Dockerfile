# Use an appropriate Java base image
FROM openjdk:14-alpine

# Install supervisor
RUN apk update && apk add supervisor

# Create a directory for supervisor logs
RUN mkdir -p /var/log/supervisor

# Copy the supervisor configuration file
COPY supervisord.conf /etc/supervisord.conf

WORKDIR /app

COPY . .

# Build the Java application
RUN javac App.java

EXPOSE 8080

# Run supervisord as the container command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]


##############################################working##########################
# # Use a base image with Java installed  
# FROM openjdk:8-jdk-alpine

# # Set the working directory in the container
# WORKDIR /app

# # Copy the Java application to the container
# COPY HelloWorld.java /app

# # Compile the Java application
# RUN javac HelloWorld.java

# # Expose a port from the container
# EXPOSE 8080

# # Set the entry point for the container
# CMD ["java", "HelloWorld"]
##############################################working##########################

# # Set the entrypoint to run the Java application
# CMD ["java", "HelloWorld"]

# FROM node:14-alpine

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 8080

# CMD [ "npm", "start" ]