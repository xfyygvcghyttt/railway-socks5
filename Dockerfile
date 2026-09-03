FROM alpine:3.21

RUN apk update && \
    apk add --no-cache dante-server

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 1080

CMD ["/start.sh"]
