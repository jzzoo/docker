FROM ubuntu:16.04

# Installation of basic tools
RUN set -ex \
	&& apt-get update -y \
	&& apt-get install synaptic -y \
	&& apt-get install \
		vim \
		wget \
		curl \
		# curl-dev \
		libcurl4-gnutls-dev \
		libxml2 \
		libxml2-dev \
		libpng-dev \
		libfreetype6-dev \
		openssl \
		libssl-dev \
		# openssl-dev \
		# libcurl4-openssl-dev \
		pkg-config \
		libjpeg-dev \
		# libghc-x11-dev \
		-y \
# Create a work directory
# RUN set -ex \
	&& cd / \
	&& if [ ! -d "data" ]; then \
			mkdir data; \
	   fi \
	&& chmod 755 data \
# RUN set -ex \
#	&& cd /data \
#	&& wget https://github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.gz \
#	&& tar zxvf libgd-2.2.5.tar.gz \
#	&& cd libgd-2.2.5 \
#	&& ./configure --prefix=/usr/local/gd2 \
#	&& make \
#	&& make install \
# Install libmcrypt
# RUN set -ex \
	&& cd /data \
	&& wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz \
	&& tar -zxvf libmcrypt-2.5.7.tar.gz \
	&& cd libmcrypt-2.5.7 \
	&& ./configure --prefix=/usr/local/libmcrypt \
	&& make \
	&& make install \
# Creating WWW users
# RUN set -ex \
	&& groupadd www \
	&& useradd -g www www \
# Install PHP
# RUN set -ex \
	&& cd /data \
	&& wget http://php.net/get/php-5.6.36.tar.gz/from/us2.php.net/mirror \
	&& tar -zxvf mirror \
	&& cd php-5.6.36/ \
	&& ./configure \
		--prefix=/usr/local/php56 \
		--with-config-file-path=/usr/local/php56/etc \
		# --with-config-file-scan-dir=/usr/local/php56/etc/conf.d \
		--enable-fpm \
		--enable-pcntl \
		--enable-ftp \
		--enable-xml \
		--enable-session \
		--enable-mbstring \
		--with-mysql=mysqlnd \
		--with-mysqli=mysqlnd \
		--with-openssl \
		# --with-openssl=
		--with-curl \
		--with-zlib \
		--with-mcrypt=/usr/local/libmcrypt/ \
		--with-iconv \
		# --with-gd=/usr/local/gd2/ \
		--enable-cgi \
		--with-fpm-user=www \
		--with-fpm-group=www \
	&& make \
    && make install \
	&& cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm56 \
	&& chmod 755 /etc/init.d/php-fpm56 \
	&& cp php.ini-development /usr/local/php56/etc/php.ini \
	# The directory has been switched and the operation has to be paid attention to
	&& cd /usr/local/php56/etc \
	&& if [ ! -f "php-fpm.conf" ]; then \
			cp php-fpm.conf.default php-fpm.conf; \
	   fi \
	&& sed -i 's/127.0.0.1:9000/[::]:9056/' ./php-fpm.conf \
	# The directory has been switched and the operation has to be paid attention to
	&& cd /usr/local/php56/bin/ \
	&& cp /usr/local/php56/bin/php /usr/local/bin/php \
	&& cp /usr/local/php56/sbin/php-fpm /sbin/php-fpm56 \
	&& apt-get clean \
	&& apt-get autoclean \
	&& rm -rf /data/libgd-2.2.5.tar.gz \
	&& rm -rf /data/libgd-2.2.5 \
	&& rm -rf /data/libmcrypt-2.5.7.tar.gz \
	&& rm -rf /data/libmcrypt-2.5.7 \
	&& rm -rf /data/mirror \
	&& rm -rf /data/php-5.6.36
	
# Defining the working directory
WORKDIR /data
	
# Specified port
EXPOSE 9056 

# Execute a command --- 
# ENTRYPOINT php-fpm56 --nodaemonize
CMD ["php-fpm56","--nodaemonize"]