FROM debian:11

RUN apt-get update && apt-get upgrade && \
  apt-get install -y vim nginx openssl && \
  apt-get install -y gettext

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/set-up.sh .

RUN chmod u+x set-up.sh

EXPOSE 443

ENTRYPOINT [ "./set-up.sh" ]
