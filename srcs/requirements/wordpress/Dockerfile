FROM debian:buster

# Install packages
#   curl is used to download the wordpress archive
#   php-fpm is used to run the php scripts
#   php-mysql is used to connect to the mariadb

# RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

# RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" |tee /etc/apt/sources.list.d/php.list

RUN apt update && apt-get install -y curl \
                        mariadb-server  \
                        mariadb-client		\
						php \
						php-cgi \
						php-mysql \
						php-fpm \
						php-pdo \
						php-gd php-cli \
						php-mbstring \
						openssl				


# Copy the config file
# COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp

RUN mkdir -p /run/php

#Download and extract wordpress
WORKDIR /var/www/wordpress

#copy script to setup wordpress
COPY tools/config_wp.sh /tmp/config_wp.sh

#right to execute the script
RUN chmod +x /tmp/config_wp.sh

#expose port 9000 for php-fpm
EXPOSE 9000

# Start php-fpm
CMD ["/tmp/config_wp.sh"]