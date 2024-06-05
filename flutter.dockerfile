FROM ubuntu:latest AS build-env

#install all needed stuff
RUN apt-get update
RUN apt-get install -y curl git unzip

#define variables
ARG FLUTTER_VERSION=3.22.1
ARG FLUTTER_SDK_LOCATION=/usr/local/flutter
ARG APP_LOCATION=/app/

#clone flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK_LOCATION
#change dir to current flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK_LOCATION && git checkout tags/$FLUTTER_VERSION

#setup the flutter path as an environment variable
ENV PATH="$FLUTTER_SDK_LOCATION/bin:$FLUTTER_SDK_LOCATION/bin/cache/dart-sdk/bin:${PATH}"

#Start to run Flutter commands
#doctor to see if all was installed ok
RUN flutter channel master
RUN flutter doctor -v

#create folder to copy source code
RUN mkdir $APP_LOCATION
#copy source code to folder
COPY . $APP_LOCATION
#stup new folder as the working directory
WORKDIR $APP_LOCATION

#Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get
RUN flutter pub upgrade web
RUN flutter pub upgrade --major-versions
RUN flutter build web --release --verbose

#once heare the app will be compiled and ready to deploy

#STEP 2: DEPLOY
#use nginx to deploy
FROM nginx:1.25.2-alpine

#copy the info of the builded web app to nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html

#Expose port and run nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
