FROM alpine:3.4

RUN apk add --update nodejs && \
apk add --update inotify-tools

ENV APP_ENVIRONMENT dev
ENV HTTP_PORT 13000
EXPOSE 13000

CMD ["sh", "-c", "source /home/init dev"]
