FROM alpine
RUN apk update

## Make sure to install gcompat
RUN apk add bash curl file git unzip which zip gcompat

# # download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# # Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# # Run flutter doctor
RUN flutter doctor

# # Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web --release --web-renderer html --dart-define=SENTRY_DSN='https://6b3248858ed34f2abe97adf6b2af0c34@glitchtip.testbroapp.ru/1'

# Stage 2
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
