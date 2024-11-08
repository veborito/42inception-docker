FROM debian:12

RUN apt-get update -y && apt-get upgrade -y \
  && apt-get install -y mariadb-server mariadb-client

RUN mkdir /var/run/mysqld/ && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./tools/set-up.sh .

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod u+x set-up.sh

EXPOSE 3306

ENTRYPOINT ["./set-up.sh"]

