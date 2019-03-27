FROM        alpine:3.9

LABEL       maintainer="https://github.com/hermsi1337"

ENV         ROOT_PASSWORD=root \
            KEYPAIR_LOGIN=false

ADD         entrypoint.sh /
RUN         apk add --upgrade --no-cache openssh tzdata \
            && chmod +x /entrypoint.sh \
	        && mkdir -p /root/.ssh \
	        && rm -rf /var/cache/apk/* /tmp/*
ENV         TZ=America/Los_Angeles
EXPOSE      22
VOLUME      ["/etc/ssh"]
ENTRYPOINT  ["/entrypoint.sh"]
