FROM docker/whalesay:latest
COPY main /cowsay/main
COPY start.sh /cowsay/start.sh
CMD touch /cowsay/start.sh
CMD chmod 744 /cowsay/start.sh
CMD /cowsay/start.sh
