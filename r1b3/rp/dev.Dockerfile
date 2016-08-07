FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN rm -v /etc/nginx/nginx.conf
ADD dev.conf /etc/nginx/nginx.conf
EXPOSE 4000
CMD ["nginx"]
