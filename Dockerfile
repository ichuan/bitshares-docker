FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
# Node, Wallet
EXPOSE 8090 8091

RUN apt-get update && apt-get install -y wget libidn11 librtmp1 libssl1.0.0 libgssapi-krb5-2 libldap-2.4-2 netcat libcurl3 libcurl-openssl1.0-dev

RUN wget https://github.com/bitshares/bitshares-core/releases/download/3.0.1/BitShares-Core-3.0.1-Linux-cli-tools.tar.gz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh ./logging.ini ./config.ini /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
