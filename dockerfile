# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./ 

# Install dependencies
RUN npm install

# Copy rest of the files
COPY . .

# Expose the port
EXPOSE 5173

# Run the app with host binding
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]