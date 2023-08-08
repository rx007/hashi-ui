FROM alpine:3.18.3

# we need ca-certificates for any external https communication
RUN apk --update upgrade && \
    apk add curl ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

ADD ./backend/build/hashi-ui-linux-amd64 /hashi-ui
EXPOSE 3000
ENTRYPOINT ["/hashi-ui"]
