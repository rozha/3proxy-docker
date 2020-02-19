FROM debian:9
LABEL version="0.3"
LABEL maintainer="rozha"
ARG THREEPROXY_VERSION=0.8.13

ADD 3proxy.cfg /etc
RUN apt-get update && apt-get -y dist-upgrade && \
    #
    apt-get -y --no-install-recommends install \
        gcc \
        git \
        make \
        libc6-dev \
        ca-certificates \
    && \
    #
    git clone -b $THREEPROXY_VERSION https://github.com/z3APA3A/3proxy /tmp/3proxy && \
    make -C /tmp/3proxy -f Makefile.Linux && \
    strip -s /tmp/3proxy/src/3proxy && \
    mv /tmp/3proxy/src/3proxy /usr/local/bin && \
    #
    groupadd -g 666 3proxy && \
    useradd -u 666 -g 666 3proxy && \
    chown root:3proxy /etc/3proxy.cfg && \
    chmod 640 /etc/3proxy.cfg && \
    mkdir -m 700 -p /var/log/3proxy && \
    chown 3proxy:3proxy /var/log/3proxy && \
    #
    apt-get -y purge \
        gcc \
        git \
        make \
        libc6-dev \
        ca-certificates \
    && \
    #
    rm -rf /tmp/3proxy && \
    apt-get -y clean && \
    apt-get -y autoremove --purge

EXPOSE 41337/tcp
CMD ["/usr/local/bin/3proxy", "/etc/3proxy.cfg"]
