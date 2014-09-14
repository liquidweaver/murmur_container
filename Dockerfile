FROM phusion/baseimage:0.9.11

ENV MURMUR_VERSION 1.2.8
ENV SUPERUSER_PASSWORD CHANGE_ME

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install wget && \
    wget -qO- http://sourceforge.net/projects/mumble/files/Mumble/${MURMUR_VERSION}/murmur-static_x86-${MURMUR_VERSION}.tar.bz2/download | tar xvj && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## No ssh
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

VOLUME /data
RUN groupadd -g 5432 murmur
RUN useradd -u 5432 -g murmur -c "MurmurDaemon" -r -d /data -s "/sbin/nologin" murmur
CMD /sbin/my_init
RUN mkdir -p /etc/service/murmur
ADD run.sh /etc/service/murmur/run

ADD murmur.ini /etc/murmur.ini
