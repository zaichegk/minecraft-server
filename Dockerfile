FROM openjdk:8u212-jre-alpine

LABEL maintainer "zaichegk"

RUN apk add --no-cache -U \
  openssl \
  imagemagick \
  lsof \
  su-exec \
  shadow \
  bash \
  curl iputils wget \
  git \
  jq \
  mysql-client \
  tzdata \
  rsync \
  nano \
  sudo \
  knock \
  ttf-dejavu

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /data \
  && chown minecraft:minecraft /data /home/minecraft

COPY files/sudoers* /etc/sudoers.d

EXPOSE 25565 25575

COPY . /home/minecraft 
RUN chown minecraft:minecraft /home/minecraft/server.properties
WORKDIR /home/minecraft
USER minecraft

CMD ["java", "-jar","server.jar"]
 
