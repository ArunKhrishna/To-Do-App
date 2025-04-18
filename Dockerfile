# Set the working directory in the container
WORKDIR /app

# Copy package.json from the correct path
COPY TodoApp/package.json ./

# Install dependencies (if needed)
RUN npm install

# Copy the rest of your application code
COPY TodoApp/ ./

# Expose the port the app will run on
EXPOSE 8080

# Run the app
CMD ["npm", "start"]
