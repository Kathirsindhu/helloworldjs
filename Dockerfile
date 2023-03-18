# Set the base image
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000 (change as required for your application)
EXPOSE 3000

# Set the command to start the application
CMD ["npm", "start"]

