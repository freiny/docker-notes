FROM alpine:3.4

RUN apk add --update nodejs

ADD home/init /home/init
ADD repo/src /src

ENV APP_ENVIRONMENT prod
ENV HTTP_PORT 20000
EXPOSE  20000

CMD ["sh", "-c", "source /home/init prod"]
