FROM debian:bookworm

RUN apt-get update && apt-get upgrade

RUN apt-get install -y wget php php-fpm php-mysql sendmail

RUN cd var/www && wget https://wordpress.org/latest.tar.gz \
  && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN chown -R www-data:www-data /var/www/wordpress && chmod 755 /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

COPY ./tools/wp-setup.sh .

RUN chmod u+x wp-setup.sh

EXPOSE 9000

ENTRYPOINT ["./wp-setup.sh"]
