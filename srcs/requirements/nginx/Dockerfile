FROM debian:bookworm

ARG SSL_KEY
ARG SSL_CERT
ARG DOMOAIN
ARG COUNTRY
ARG CITY
ARG ORGANISATION

RUN apt-get update && apt-get upgrade

RUN apt-get install -y vim nginx openssl

RUN apt-get install -y gettext

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/set-up.sh .

RUN chmod u+x set-up.sh

RUN openssl req -x509 -nodes -sha256 -newkey rsa:4096 -keyout ${SSL_KEY} -out ${SSL_CERT} -subj "/C=${COUNTRY}/L=${CITY}/O=${ORGANISATION}/CN=${DOMOAIN}"

EXPOSE 443

ENTRYPOINT [ "./set-up.sh" ]
