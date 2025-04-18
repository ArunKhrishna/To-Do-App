# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY TodoApp/package*.json ./
RUN npm install

# Copy the rest of the app
COPY TodoApp/ .

# Expose the correct port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]

