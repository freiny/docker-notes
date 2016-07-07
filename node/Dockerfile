FROM node:argon
VOLUME /code
WORKDIR /code
COPY code /code
#RUN echo $(ls -a)
#RUN chmod 744 test.sh;./test.sh

#RUN npm install
#RUN npm install -g --force nodemon

#RUN chmod 744 init.sh;./init.sh
#RUN chmod 744 init.sh
#RUN chmod 744 start.sh

EXPOSE 8080

#RUN chmod 744 start.sh;./start.sh

#CMD [ "npm", "start" ]
ENTRYPOINT ./start.sh
