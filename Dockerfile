FROM ubuntu

RUN apt-get update && \
    apt-get install -y openssl


COPY ./src/scripts /scripts
RUN chmod -R +x /scripts
WORKDIR /created_certs

ENV CERT_EMAIL=albus.dumbledore@example.com
ENV CERT_COUNTRY=GB
ENV CERT_STATE=Scotland
ENV CERT_LOCALITY=Redacted
ENV CERT_ORG=Hogwarts
ENV CERT_ORG_UNIT="Defense against the dark arts"
ENV CERT_COMMON_NAME="example.com"
ENV CERT_PASS="expelliarmus"

VOLUME [ "/created_certs" ]
ENTRYPOINT [ "/scripts/create-cert.sh" ]