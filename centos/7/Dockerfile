FROM centos:centos7

# Installation of basic tools
RUN set -ex \
	&& yum update -y \
	&& yum install \
		vim \
		make \
		install \
		wget \
		dig \
		gcc \
		gcc-c++ \
		autoconf \
		libjpeg \
		libjpeg-devel \
		libpng \
		libpng-devel \
		freetype \
		freetype-devel \
		libxml2 \
		libxml2-devel \
		zlib \
		zlib-devel \
		glibc \
		glibc-devel \
		glib2 \
		glib2-devel \
		bzip2 \
		bzip2-devel \
		curl \
		curl-devel \
		openssl \
		openssl-devel \
		libtool \
		automake \
		sudo \
		git \
		libXpm-devel.x86_64 \
		-y \
# Create a work directory
# RUN set -ex \
	&& cd / \
	&& if [ ! -d "data" ]; then \
			mkdir data; \
	   fi \
	&& chmod 755 data 

COPY libgd-2.2.5.tar.gz /data/
COPY libmcrypt-2.5.7.tar.gz /data/
COPY php-7.2.8.tar.gz /data/
COPY re2c-v2.0.tar.gz /data/
COPY php-zephir-parser-v1.3.6.tar.gz /data/
COPY zephir-0.10.12.tar.gz /data/

RUN set -ex \
	&& cd / \
	&& chmod -R 777 data 

# Install GD2  todo 
RUN set -ex \
	&& cd /data \
#	&& wget https://github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.gz \
	&& tar zxvf libgd-2.2.5.tar.gz \
	&& cd libgd-2.2.5 \
	&& ./configure --prefix=/usr/local/gd2 \
	&& make \
	&& make install \
# Install re2c
	&& cd /data \
	&& tar zxvf re2c-v2.0.tar.gz \
	&& cd re2c \
	&& set +o posix \ 
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local/re2c \
	&& make  \
	&& make install \
	&& ln -sf /usr/local/re2c/bin/re2c /usr/local/bin/re2c \
# Install libmcrypt
# RUN set -ex \
	&& cd /data \
#	&& wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz \
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
#	&& wget  https://www.php.net/distributions/php-7.2.8.tar.gz \
	&& tar -zxvf php-7.2.8.tar.gz \
	&& cd php-7.2.8/ \
	&& ./configure \
		--prefix=/usr/local/php72 \
		--with-config-file-path=/usr/local/php72/etc \
		# --with-config-file-scan-dir=/usr/local/php72/etc/conf.d \
		--enable-fpm \
		--enable-pcntl \
		--enable-ftp \
		--enable-xml \
		--enable-session \
		--enable-mbstring \
		--with-mysql=mysqlnd \
		--with-mysqli=mysqlnd \
		--with-openssl \
		--with-curl \
		--with-zlib \
		--with-mcrypt=/usr/local/libmcrypt/ \
		--with-iconv \
		--with-gd=/usr/local/gd2/ \
		--disable-cgi \
		--with-fpm-user=www \
		--with-fpm-group=www \
	&& make \
    && make install \
	&& cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm72 \
	&& chmod 755 /etc/init.d/php-fpm72 \
	&& cp php.ini-development /usr/local/php72/etc/php.ini \
	# The directory has been switched and the operation has to be paid attention to
	&& cd /usr/local/php72/etc \
	&& if [ ! -f "php-fpm.conf" ]; then \
			cp php-fpm.conf.default php-fpm.conf; \
	   fi \
	&& sed -i 's/127.0.0.1:9000/[::]:9072/' ./php-fpm.conf \
	# The directory has been switched and the operation has to be paid attention to
	&& cd /usr/local/php72/bin/ \
	&& cp /usr/local/php72/bin/php /usr/local/bin/php \
	&& cp /usr/local/php72/bin/phpize /usr/local/bin/phpize \
	&& cp /usr/local/php72/bin/php-config /usr/local/bin/php-config \
	&& cp /usr/local/php72/sbin/php-fpm /sbin/php-fpm
	
# Defining the working directory
WORKDIR /data

# Specified port
EXPOSE 8081 8088 8089 9072 

ADD start.sh /startup.sh

RUN chmod 755 /startup.sh

CMD ["/startup.sh"]
