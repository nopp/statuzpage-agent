FROM golang:1.15.8 as builder

WORKDIR /statuzpage-agent

ADD . /statuzpage-agent

RUN go build

FROM alpine:latest

LABEL maintainer "Carlos Augusto Malucelli <camalucelli@gmail.com>"

WORKDIR /statuzpage-agent

RUN apk --no-cache add ca-certificates openssl curl \
	&& curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
	&& apk add glibc-2.28-r0.apk

COPY  config.json /etc/statuzpage-agent/config.json
COPY --from=builder /statuzpage-agent/statuzpage-agent .

EXPOSE 8000

CMD ["./statuzpage-agent"]