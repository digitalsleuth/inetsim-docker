FROM ubuntu:latest
MAINTAINER https://github.com/digitalsleuth/inetsim-docker

ENV INETSIM_VERSION=1.3.1-3

LABEL version="0.1"
LABEL maintainer="https://github.com/digitalsleuth/inetsim-docker"
LABEL inetsim_source="https://www.inetsim.org/downloads.html"

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget make gcc perl apt-utils \
gnupg lib32z1-dev openssl libssl-dev libnet-server-perl libnet-dns-perl libipc-shareable-perl libdigest-sha-perl \
openssl libssl-dev libio-socket-ssl-perl iptables libnfqueue-perl && \
wget -O /tmp/inetsim_${INETSIM_VERSION}_all.deb https://www.inetsim.org/debian/binary/inetsim_${INETSIM_VERSION}_all.deb && \
dpkg -i /tmp/inetsim_${INETSIM_VERSION}_all.deb && \
rm /tmp/inetsim_${INETSIM_VERSION}_all.deb && \
apt-get autoremove -y && apt-get purge && apt-get clean

#APT Install
#remove libnet-server, libnet-dns, libip-shareable and libdigest to return to original docker
##echo "deb http://www.inetsim.org/debian binary/" > /etc/apt/sources.list.d/inetsim.list && \
##echo "deb-src http://www.inetsim.org/debian source/" >> /etc/apt/sources.list.d/inetsim.list && \
##wget -O - https://www.inetsim.org/inetsim-archive-signing-key.asc | apt-key add - && \
#(echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan && \
#cpan install cpan &&  cpan reload cpan && \
#cpan install Net::LibIDN2 Net::SSLeay Net::DNS::SEC IO::Socket::IP && \
#cpan install Net::Server Net::DNS IPC::Shareable Digest::SHA IO::Socket::SSL && 
##apt-get install -y inetsim

CMD ["inetsim"]
