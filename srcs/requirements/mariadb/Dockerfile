FROM debian:buster

#Install dependencies
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

#Config file
COPY conf/script_db.sh /tmp/script_db.sh

RUN chmod +x /tmp/script_db.sh

EXPOSE 3306

CMD ["/tmp/script_db.sh"]