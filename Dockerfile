FROM golang:1.15.8-alpine as builder

WORKDIR /statuzpage-agent

ADD . /statuzpage-agent

RUN go build

FROM golang:1.15.8-alpine

LABEL maintainer "Carlos Augusto Malucelli <camalucelli@gmail.com>"

WORKDIR /statuzpage-agent

COPY  config.json /etc/statuzpage-agent/config.json
COPY --from=builder /statuzpage-agent/statuzpage-agent .

CMD ["./statuzpage-agent"]