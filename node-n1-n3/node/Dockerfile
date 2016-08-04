FROM alpine:3.4

ENV HTTP_PORT 8080

RUN apk add --update nodejs

#apk add --update python && \
# RUN apk add --update sudo && \
# apk add --update inotify-tools && \
# apk add --update bash && \
# apk add --update nano && \
# apk add --update git && \
# apk add --update python && \
# apk add --update nodejs && \
# adduser -S user && \
# chown -R user: /home/user && \
# echo user 'ALL=(ALL) ALL' >> /etc/sudoers && \
# echo root:$DOCKER_ROOT_PASSWORD | chpasswd && \
# echo user:$DOCKER_USER_PASSWORD | chpasswd

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

WORKDIR /src
ADD . /src

EXPOSE  8080

CMD ["node", "/src/server.js"]
