# our base image
FROM ubuntu:16
#ENV JDK_VERSION=1.8.0_45
# use this for hard coing the version number
# #ENV TAG=5.1.1
# # read from env ( docker-compose.yml / shell )
ARG TAG


# copy files required for the app to run
# TAG variable should be set in the hosts environment before calling docker build.
# Elastic stack (elk) versioning wasnt uniform prior to v5.
# so, for automating docker build, have the tar.gz archives' names to be uniform i.e a single version (use ES version number).
# the app version can always be seen openning the app after launching the container.
COPY ./logstash-${TAG}.tar.gz /

# java is built into ubuntu:16
#COPY ./jdk${JDK_VERSION}.tar.gz /

# extract package
RUN mkdir -p /logstash && \
    tar zxf /logstash-${TAG}.tar.gz --strip 1 -C /logstash && \
    rm -f /logstash-${TAG}.tar.gz && \
    chmod -R 777 /logstash

COPY ./mysql-connector-java-5.1.18.jar /logstash/

# deploy jdk binaries to the container
#RUN mkdir -p /java && \
#    tar zxf /jdk${JDK_VERSION}.tar.gz --strip 1 -C /java && \
#    rm -f /jdk${JDK_VERSION}.tar.gz && \
#    ln -s /java/bin/java /usr/bin/java

# map volume inside container and add conf file
VOLUME ["/logstash/config"]

# tell the port number the container should expose
EXPOSE 3333 3334

# run the application. pass command from docker-compose.yml or CLI for ease of swtiching/modifying logstash conf files
#CMD ["/logstash/bin/logstash","agent","-f","$LOGSTASHCONF"]
