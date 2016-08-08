FROM alpine:3.4

RUN apk add --update nodejs && \
apk add --update inotify-tools

ENV APP_ENVIRONMENT dev
ENV HTTP_PORT 9080
EXPOSE  9080

CMD ["sh", "-c", "source /home/init dev"]
