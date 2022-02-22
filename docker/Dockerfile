FROM golang:1.14.15-alpine3.13 as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache \
    bash \
    gcc \     
    musl-dev \
    tar \
    git \
    tzdata \
    make 

ADD . /opt/todolist
WORKDIR /opt/todolist
RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN go build


#================================================================================
FROM alpine:3.13

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache \
    tzdata \
    busybox-extras

ENV TZ=Asia/Shanghai
WORKDIR /opt/todolist
COPY --from=builder /opt/todolist/bubble .
# RUN ln -s /opt/send-client/client /usr/local/bin/client
RUN cp bubble /usr/local/bin/

EXPOSE 8000
ENTRYPOINT [ "bubble" ]
# CMD [ "server" ]