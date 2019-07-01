FROM google/cloud-sdk:alpine

RUN apk --no-cache add gcc libc-dev mysql-client

ENV PATH /root/go/bin:/usr/local/go/bin:$PATH

ENV GOPATH /root/go

RUN cd /root &&\
    curl https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz --output go1.12.6.linux-amd64.tar.gz &&\
    tar zxvf go1.12.6.linux-amd64.tar.gz  -C /usr/local/  &&\
    rm go1.12.6.linux-amd64.tar.gz

RUN go get bitbucket.org/liamstask/goose/cmd/goose

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/local/bin/cloud_sql_proxy &&\
    chmod +x /usr/local/bin/cloud_sql_proxy

RUN mkdir /api
WORKDIR /api
