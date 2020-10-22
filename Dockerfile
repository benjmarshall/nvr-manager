FROM linuxserver/ffmpeg:arm32v7-latest

RUN apt-get update && \
apt-get install -y \
 	bash \
	inotify-tools

COPY watch.sh /watch.sh

RUN chmod +x /watch.sh

ENTRYPOINT [ "/watch.sh" ]
