# our base image
FROM ubuntu:16
# use this for hard coing the version number
#ENV TAG=2.4.1
#ENV STACK_VER=2

# read from env ( docker-compose.yml / shell )
ARG TAG
ARG STACK_VER


# copy files required for the app to run
# TAG variable should be set in the hosts environment before calling docker build.
# Elastic stack (elk) versioning wasnt uniform prior to v5.
# so, for automating docker build, have the tar.gz archives' names to be uniform i.e a single version (use ES version number).
# the app version can always be seen openning the app after launching the container.
COPY kibana-${TAG}-linux-x86_64.tar.gz /
COPY make-plugin.sh /

# For kibana 5
COPY health_metric_vis-master.zip /

# For kibana 2
COPY kibana_metric_vis_colors-master.zip /

# extract package
RUN mkdir -p /kibana && \
    tar zxf /kibana-${TAG}-linux-x86_64.tar.gz --strip 1 -C /kibana && \
    rm -f /kibana-${TAG}-linux-x86_64.tar.gz && \
    chmod -R 777 /kibana

# add custom plugin to kibana
RUN /make-plugin.sh ${STACK_VER}

# map volume inside container
VOLUME ["/kibana/config"]

# tell the port number the container should expose
EXPOSE 5602

# run the application
CMD ["/kibana/bin/kibana"]
