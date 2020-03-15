FROM ubuntu:18.04
WORKDIR /var/www/html/
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install nginx -y
RUN apt-get install wget -y
RUN apt-get install php7.2-common php7.2-cli php7.2-fpm php7.2-sqlite3 php7.2-gd php7.2-mbstring php7.2-curl -y

COPY cockpit.conf /etc/nginx/conf.d/
RUN rm /etc/nginx/sites-enabled/default

RUN wget https://github.com/agentejo/cockpit/archive/0.10.0.tar.gz
RUN tar -zxvf 0.10.0.tar.gz && mv cockpit-0.10.0/* ./
RUN chown -R www-data:root storage/

EXPOSE 80 443

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT './entrypoint.sh'

