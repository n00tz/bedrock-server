FROM frolvlad/alpine-glibc:latest

LABEL version="1.10.0.7"

MAINTAINER Rial Sloan II <rial.sloan.ii@n00tz.net>

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.10.0.7.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}

RUN ["mkdir", "-p", "/opt/minecraft"]
WORKDIR /opt/minecraft

RUN apk --no-cache add unzip bash libcurl libstdc++
RUN ["mkdir", "/opt/minecraft/worlds"]

ADD ${dlarc} ${arc}
RUN unzip -n ${arc}

RUN rm ${arc}

ADD ./startup.sh /opt/minecraft/
RUN ["chmod", "+x", "/opt/minecraft/startup.sh"]

EXPOSE 19132
EXPOSE 19133

ENTRYPOINT ["/opt/minecraft/startup.sh", "/bin/bash"]
