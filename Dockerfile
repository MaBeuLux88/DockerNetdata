# Build the container with
# docker build -t mabeulux88/netdata:latest .
#
# Run the container with
# docker run -d -v /proc:/host/proc:ro -v /sys:/host/sys:ro --cap-add SYS_PTRACE -h $(hostname) -p 19999:19999 --name netdata mabeulux88/netdata:latest
#
# Get from Docker Hub : docker pull mabeulux88/netdata:latest
#
# Source of inspiration : https://github.com/rothgar/netdata/blob/master/Dockerfile
FROM debian:latest

RUN apt-get update && \
    apt-get install -y autoconf autogen automake gcc git iproute make pkg-config zlib1g-dev && \
    apt-get clean && \
    git clone https://github.com/firehol/netdata.git /tmp/netdata.git --depth=1

WORKDIR /tmp/netdata.git

RUN ./netdata-installer.sh --dont-wait --install /opt && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

WORKDIR /opt

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /opt/netdata/var/log/netdata/access.log && \
    ln -sf /dev/stderr /opt/netdata/var/log/netdata/error.log

EXPOSE 19999
VOLUME ["/host"]

CMD ["/opt/netdata/usr/sbin/netdata","-nd","-ch","/host"]
