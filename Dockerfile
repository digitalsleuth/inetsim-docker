FROM ubuntu:bionic
MAINTAINER https://github.com/digitalsleuth/inetsim-docker

LABEL version="0.3"
LABEL maintainer="https://github.com/digitalsleuth/inetsim-docker"
LABEL inetsim_source="https://www.inetsim.org/downloads.html"

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget gnupg make gcc perl \
libssl-dev libnet-server-perl libnet-dns-perl libipc-shareable-perl libdigest-sha-perl \
openssl libssl-dev libio-socket-ssl-perl iptables libnfqueue-perl && \
echo "deb http://www.inetsim.org/debian binary/" > /etc/apt/sources.list.d/inetsim.list && \
echo "deb-src http://www.inetsim.org/debian source/" >> /etc/apt/sources.list.d/inetsim.list && \
wget -O - https://www.inetsim.org/inetsim-archive-signing-key.asc | apt-key add - && \
apt-get update && apt-get install -y inetsim

CMD ["inetsim"]
