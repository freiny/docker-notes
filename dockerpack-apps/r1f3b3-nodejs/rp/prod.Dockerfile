FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN rm -v /etc/nginx/nginx.conf
ADD prod.conf /etc/nginx/nginx.conf
EXPOSE 90
CMD ["nginx"]
