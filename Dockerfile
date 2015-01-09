FROM debian:wheezy

MAINTAINER Romain Fihue <romain.fihue@gmail.com>

RUN apt-get update
RUN apt-get install -y transmission-daemon

RUN mkdir /downloaded /incomplete /torrent
RUN ln -s /dev/stdout /var/log/transmission.log
VOLUME ["/downloaded", "/incomplete", "/torrent"]

EXPOSE 6881 9091

ENTRYPOINT /usr/bin/transmission-daemon -f -a 192.168.*.* -e /dev/stdout -c /torrent --incomplete-dir /incomplete -p 9091 -P 6881 --username admin --password $PASSWORD -w /downloaded -o -y -m -l 100 -L 500 -ep --auth
