FROM alpine:3.4

RUN apk add --update redis

EXPOSE 6379

RUN mkdir /data
ADD home/init /home/init

WORKDIR /data

CMD ["sh", "-c", "source /home/init dev"]
