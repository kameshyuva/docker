FROM rhelbase:7

ENV SETUPTOOLS_VER=26.1.1
ENV PIP_VER=8.1.2
ENV MELD_VER=1.0.2
ENV SVR_VER=3.3.1

COPY setuptools-${SETUPTOOLS_VER}.tar.gz /
# if needed later, use pip
#COPY pip-${PIP_VER}.tar.gz /
COPY meld3-${MELD_VER}.tar.gz /
COPY supervisor-${SVR_VER}.tar.gz /

COPY supervisord.conf /etc

RUN mkdir -p /setuptools && \
    tar zxf /setuptools-${SETUPTOOLS_VER}.tar.gz --strip 1 -C /setuptools && \
    rm -f /setuptools-${SETUPTOOLS_VER}.tar.gz && \
    cd /setuptools && \
    python setup.py install

RUN mkdir -p /meld && \
    tar zxf /meld3-${MELD_VER}.tar.gz --strip 1 -C /meld && \
    rm -f /meld3-${MELD_VER}.tar.gz && \
    cd /meld && \
    python setup.py install

RUN mkdir -p /supervisorpkg && \
    tar zxf /supervisor-${SVR_VER}.tar.gz --strip 1 -C /supervisorpkg && \
    rm -f /supervisor-${SVR_VER}.tar.gz && \
    cd /supervisorpkg && \
    python setup.py install
