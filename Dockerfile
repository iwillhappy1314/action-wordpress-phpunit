FROM debian:stable-slim

RUN apt-get update \
	&& apt-get install -y subversion rsync git mysql\
	&& apt-get clean -y \
	&& systemctl start mysql.service \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
