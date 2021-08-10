FROM golang:1.17-rc-alpine3.14 AS builder
WORKDIR /go/src/app
COPY hello-world.go .
RUN go build hello-world.go

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app/hello-world .
CMD [ "./hello-world" ]