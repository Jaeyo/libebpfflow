FROM ubuntu:18.04

RUN echo "deb [trusted=yes] http://repo.iovisor.org/apt/bionic bionic-nightly main" | \
  tee /etc/apt/sources.list.d/iovisor.list && \
  apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y bpfcc-tools autoconf gcc libjson-c-dev

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev libjson-c-dev libzmq3-dev libbpfcc-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential autoconf automake autogen libjson-c-dev pkg-config libzmq3-dev libcurl4-openssl-dev libbpfcc-dev

RUN wget https://go.dev/dl/go1.20.5.linux-arm64.tar.gz \
	&& tar -xvf go1.20.5.linux-arm64.tar.gz \
	&& mv go /usr/local/

ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

WORKDIR /app

COPY . .

