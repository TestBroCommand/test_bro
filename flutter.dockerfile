# Stage 1 - Build the Flutter App
FROM ubuntu:latest as builder

# Install necessary packages
RUN apt install -y unzip xz-utils git curl

# Clone the Flutter repository
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set the Flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable web capabilities
RUN flutter config --enable-web

# Change to the stable channel
RUN flutter channel master

# Upgrade Flutter
RUN flutter upgrade

# Create the app directory
WORKDIR /usr/src/app

# Copy the app files
COPY . .

# Get the Flutter dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Stage 2 - Create the Nginx Runtime
FROM nginx:1.23.3-alpine as runtime

# Copy the built web app from the builder stage
COPY --from=builder /usr/src/app/build/web /usr/share/nginx/html

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Run Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
