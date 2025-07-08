# Filename: Dockerfile

# 1. Use an official Node.js runtime as a parent image.
# Using a specific version like 18 is good practice.
FROM node:18-slim

# 2. Set the working directory inside the container.
WORKDIR /usr/src/app

# 3. Copy package.json and package-lock.json (if it exists).
# This is a Docker optimization step.
COPY package*.json ./

# 4. Install your application's dependencies.
RUN npm install

# 5. Copy the rest of your application code into the container.
# This includes server.js, and your 'public' and 'views' folders.
COPY . .

# 6. Expose the port your app runs on. This is for documentation.
# The actual port is set by the PORT environment variable.
EXPOSE 3000

# 7. Define the command to run your app using the script from package.json.
CMD [ "npm", "start" ]
