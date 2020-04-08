FROM ubuntu:bionic
MAINTAINER https://github.com/digitalsleuth/inetsim-docker

ENV INETSIM_VERSION=1.3.1-3

LABEL version="0.2"
LABEL maintainer="https://github.com/digitalsleuth/inetsim-docker"
LABEL inetsim_source="https://www.inetsim.org/downloads.html"

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget make gcc perl \
libssl-dev libnet-server-perl libnet-dns-perl libipc-shareable-perl libdigest-sha-perl \
openssl libssl-dev libio-socket-ssl-perl iptables libnfqueue-perl && \
wget -O /tmp/inetsim_${INETSIM_VERSION}_all.deb https://www.inetsim.org/debian/binary/inetsim_${INETSIM_VERSION}_all.deb && \
dpkg -i /tmp/inetsim_${INETSIM_VERSION}_all.deb && \
rm /tmp/inetsim_${INETSIM_VERSION}_all.deb && \
apt-get autoremove -y && apt-get purge && apt-get clean

CMD ["inetsim"]
