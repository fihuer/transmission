FROM debian:wheezy

MAINTAINER Romain Fihue <romain.fihue@gmail.com>

RUN apt-get update
RUN apt-get install -y transmission-daemon

RUN mkdir /downloaded /incomplete /torrent
RUN ln -s /dev/stdout /var/log/transmission.log
VOLUME ["/downloaded", "/torrent", "/incomplete"]

EXPOSE 6881 9091

CMD /usr/bin/transmission-daemon -f -a *.*.*.* -e /dev/stdout -c /torrent -p 9091 -P 6881 --username admin --password password -w /downloaded -o -y -m -l 100 -L 500 -ep --auth
