FROM alpine:3.20

RUN apk add --no-cache dante-server

COPY sockd.conf /etc/sockd.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 1080

CMD ["/start.sh"]
