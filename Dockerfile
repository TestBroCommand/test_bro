# Stage 1
FROM ubuntu:latest AS build-env

RUN apt-get update 
#RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get install -y curl git wget unzip libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
RUN flutter doctor -v

RUN flutter channel master
RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
WORKDIR /app/
#EXPOSE 80
#WORKDIR /app/build/web
#CMD ["python3", "-m", "http.server", "80"]
RUN flutter build web --release --web-renderer html --dart-define=SENTRY_DSN='https://6b3248858ed34f2abe97adf6b2af0c34@glitchtip.testbroapp.ru/1'

# Stage 2
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
#COPY --from=build-env /app/nginx.conf /etc/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
