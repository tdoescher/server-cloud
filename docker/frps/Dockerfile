FROM alpine/git:2.47.1 AS git

RUN git clone https://github.com/fatedier/frp.git /building

FROM golang:1.23 AS building

COPY --from=git /building /building
WORKDIR /building

RUN make frps

FROM alpine:3

RUN apk add --no-cache tzdata

COPY --from=building /building/bin/frps /usr/bin/frps

ENTRYPOINT ["/usr/bin/frps"]
