FROM golang:1.14-alpine

ARG SOURCE_COMMIT

COPY . /go/src/github.com/Jimdo/aws-health-exporter
WORKDIR /go/src/github.com/Jimdo/aws-health-exporter

RUN DATE=$(date -u '+%Y-%m-%d-%H%M UTC'); \
    go install -ldflags="-X 'main.Version=${SOURCE_COMMIT}' -X 'main.BuildTime=${DATE}'" ./...

ENTRYPOINT  [ "/go/bin/aws-health-exporter" ]
EXPOSE      9383
