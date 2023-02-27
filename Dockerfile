# Install Operating system and dependencies
FROM ubuntu:22.04
LABEL maintainer="Syed A Bilgrami <bilgrami@gmail.com>"

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback libstdc++6 python3

RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# check network connectivity 
# RUN cat /etc/resolv.conf

# Enable flutter web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter clean && flutter pub get
RUN flutter build web

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]
