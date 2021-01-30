FROM debian:stable-slim
LABEL maintainer="Steven Lambe <firrae@gmail.com>"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp

RUN VERSION=`cat /tmp/VERSION` && \
    chmod a+x /usr/local/bin/* && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates unzip && \
    curl -L https://github.com/vertcoin-project/vertcoin-core/releases/download/$VERSION/vertcoind-v$VERSION-linux-amd64.zip --output /tmp/prebuilt.zip && \
    unzip /tmp/prebuilt.zip -d /tmp && \
    mv /tmp/vertcoind /usr/local/bin && \
    apt-get purge -y curl ca-certificates unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV DATA /data
WORKDIR /data

EXPOSE 5888 5889

ENTRYPOINT ["init"]
