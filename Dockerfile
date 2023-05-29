# Start your image with a node base image
FROM ubuntu:22.04

# The /app directory should act as the main application directory
WORKDIR /app

# Copy the app package and package-lock.json file
COPY test-app-linux64* ./


# Install node packages, install serve, build the app, and remove dependencies at the end
RUN npm install \
    && npm install -g serve \
    && npm run build \
    && rm -fr node_modules

EXPOSE 3000

# Start the app using serve command
CMD [ "serve", "-s", "build" ]
