# our base image
FROM ubuntu:16
#ENV JDK_VERSION=1.8.0_45
ENV USER=elk
ENV USERGROUP=elk
ENV VOLUME_ROOT=/elasticsearch
# use this for hard coing the version number
#ENV TAG=5.1.1
# read from env ( docker-compose.yml / shell )
ARG TAG

# copy files required for the app to run
# TAG variable should be set in the hosts environment before calling docker build.
# Elastic stack (elk) versioning wasnt uniform prior to v5.
# so, for automating docker build, have the tar.gz archives' names to be uniform i.e a single version (use ES version number).
# the app version can always be seen openning the app after launching the container.
COPY ./elasticsearch-${TAG}.tar.gz /

# java is built
#COPY ./jdk${JDK_VERSION}.tar.gz /

# extract package
RUN mkdir -p $VOLUME_ROOT && \
    tar zxf ${VOLUME_ROOT}-${TAG}.tar.gz --strip 1 -C $VOLUME_ROOT && \
    rm -f ${VOLUME_ROOT}-${TAG}.tar.gz

# deploy jdk binaries to the container
#RUN mkdir -p /java && \
#    tar zxf /jdk${JDK_VERSION}.tar.gz --strip 1 -C /java && \
#    rm -f /jdk${JDK_VERSION}.tar.gz && \
#    ln -s /java/bin/java /usr/bin/java


# map volumes inside container
VOLUME ["${VOLUME_ROOT}/data","${VOLUME_ROOT}/logs","${VOLUME_ROOT}/config"]

# Add group and user
RUN groupadd -r $USER && \
    useradd -r -g $USERGROUP $USER && \
    echo "${USERGROUP}:${USER}" | chpasswd && \
    chown -R ${USERGROUP}:${USER} $VOLUME_ROOT

# tell the port number the container should expose
EXPOSE 9200 9300

# docker version : 1.12.3
# setting entry point to own the folder to elk user , group.
# volumes alwaysi during container run time will be mounted as root. -- bad because,
# apps like elasticsearch, redis, couchDb etc must be run as a non-root user
# This issue might get fixed in future versions of docker. until then, workaround..
# set entry point and run command , remove command from docker-compose if any
#COPY ./entryPoint.sh /
#ENTRYPOINT ["/entryPoint.sh"]
#CMD ["/elasticsearch/bin/elasticsearch"]
