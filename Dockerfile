FROM debian:stable-slim
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install -y wget \
	&& apt-get -y install software-properties-common \
	&& apt-get -y update \
	&& apt-add-repository 'deb http://ftp.de.debian.org/debian bullseye main' \
	&& apt-get -y install lib32z1 libbz2-1.0:amd64 lib32gcc-s1 lib32stdc++6 libtinfo5:amd64 libcurl3-gnutls:amd64 libsdl2-2.0-0:amd64 \
	&& useradd -r -ms /bin/bash gameserver
WORKDIR /home/gameserver
USER gameserver
RUN mkdir ./hlserver \
	&& cd hlserver \
	&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
	&& tar zxf steamcmd_linux.tar.gz \
	&& ./steamcmd.sh +force_install_dir ./tf2 +login anonymous +app_update 232250 +quit \
COPY server.cfg /home/hlserver/tf2/tf/cfg
COPY tf2.sh /home/hlserver/tf2
COPY tf2server.service /etc/systemd/system
RUN cd /home && ls
RUN cd /home/gameserver && ls
RUN cd /home/hlserver && ls
RUN cd /home/hlserver && ls
WORKDIR /home/hlserver/tf2
RUN	cd /home/hlserver/tf2 && ls \
	&& chmod u+x tf2.sh \
	&& systemctl daemon-reload \
	&& systemctl enable tf2server.service \
	&& systemctl start tf2server.service
#	&& ./tf2.sh
COPY . .
EXPOSE 27015/tcp \
	27015/udp \
	27020/udp