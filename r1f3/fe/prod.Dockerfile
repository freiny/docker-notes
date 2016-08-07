FROM alpine:3.4

RUN apk add --update nodejs

ADD home/init /home/init
ADD repo/src /src

ENV APP_ENVIRONMENT prod
ENV HTTP_PORT 8080
EXPOSE  8080

CMD ["sh", "-c", "source /home/init prod"]
