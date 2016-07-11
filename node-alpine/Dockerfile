FROM alpine

COPY code /code
COPY dockinit /usr/local/bin/
RUN chmod 744 /usr/local/bin/dockinit

VOLUME /code
WORKDIR /code

RUN apk add --update python
RUN apk add --update nodejs
RUN npm install -g nodemon

EXPOSE 10080

ENTRYPOINT dockinit
