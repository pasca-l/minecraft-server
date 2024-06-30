FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y tzdata wget

WORKDIR /opt
ENV TZ Asia/Tokyo
# java versions openjdk-21-jre for minecraft v1.21
# minecraft server by version, archived at https://mcversions.net/
RUN apt-get install -y openjdk-21-jre \
    && wget https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

WORKDIR /home
# run server with minimum settings
CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "/opt/server.jar" ]
