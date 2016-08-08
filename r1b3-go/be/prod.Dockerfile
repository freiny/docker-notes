FROM alpine:3.4

RUN apk add --update go && \
apk add --update git

# ADD home /home
# ADD repo/src /src
COPY home /home
COPY repo/src /src
RUN ls -a /home
ENV GOPATH /home/go

ENV APP_ENVIRONMENT prod
ENV HTTP_PORT 9080
EXPOSE  9080

CMD ["sh", "-c", "source /home/init prod"]
