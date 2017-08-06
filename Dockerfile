FROM alpine:3.4

MAINTAINER xujinkai <jack777@xuji3nkai.net>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/binux/yaaw /aria2-webui && \
	apk add --update darkhttpd

RUN apk add unzip wget
RUN wget https://downloads.rclone.org/rclone-current-linux-amd64.zip && unzip rclone-current-linux-amd64.zip && \
	chmod 0755 ./rclone-*/rclone && \
	cp ./rclone-*/rclone /usr/bin/ && \
	rm -rf ./rclone-*

ADD files/rclone.conf /conf/rclone.conf
ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
