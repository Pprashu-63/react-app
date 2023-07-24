# Use the official Node.js base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (or yarn.lock) files
# This allows Docker to take advantage of caching for faster builds
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm install

# Copy the entire React project directory into the container's working directory
COPY . .

# Expose the port on which the React app will run (default: 3000)
EXPOSE 3000

# Start the React development server
CMD ["npm", "run","dev"]
