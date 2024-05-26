FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y tzdata wget

WORKDIR /opt
ENV TZ Asia/Tokyo
# java versions openjdk-21-jre for minecraft v1.20.5^
# minecraft server by version, archived at https://mcversions.net/
RUN apt-get install -y openjdk-21-jre \
    && wget https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar

WORKDIR /home
RUN echo eula=$EULA > eula.txt
CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "/opt/server.jar" ]
