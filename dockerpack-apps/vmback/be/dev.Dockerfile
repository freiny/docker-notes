FROM alpine:3.4

RUN apk add --update nodejs && \
apk add --update inotify-tools

ADD home/redis.conf /etc/redis.conf

ENV APP_ENVIRONMENT dev
ENV HTTP_PORT 24000
EXPOSE  24000

CMD ["sh", "-c", "source /home/init dev"]
