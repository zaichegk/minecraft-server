FROM openjdk:8u212-jre-alpine

LABEL maintainer "zaichegk"

RUN apk add --no-cache -U \
  su-exec \
  wget \
  tzdata \
  sudo

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /data

COPY --chown=minecraft:minecraft eula.txt server.properties /home/minecraft/
COPY files/sudoers* /etc/sudoers.d

EXPOSE 25565 25575

WORKDIR /home/minecraft
USER minecraft
RUN wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

CMD ["java", "-jar","server.jar"]
