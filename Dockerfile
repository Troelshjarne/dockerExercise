FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on

COPY go.mod /build
COPY go.sum /build/

RUN cd /build/ && git clone https://github.com/Troelshjarne/dockerExercise.git
RUN cd /build/dockerExercise/server && go build ./...

EXPOSE 9080

ENTRYPOINT [ "/build/dockerExercise/server/server" ]

