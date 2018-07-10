FROM centos:6.8

# 安装基础工具		
RUN yum update -y \
	&& yum install \
		vim \
		make \
		install \
		wget \
		dig \
		gcc \
		gcc-c++ \
		autoconf \
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
		-y
		  
# 创建工作目录
RUN set -ex \
	&& cd / \
	&& if [ ! -d "data" ]; then \
			mkdir data; \
	   fi \
	&& chmod 755 data
	# && cd data
	   
# 定义工作目录
WORKDIR /data

# 安装GD2
# RUN set -ex \
#	&& cd /data \
#	&& wget http://www.boutell.com/gd/http/gd-2.0.33.tar.gz \
#	&& tar zxvf gd-2.0.33.tar.gz \
#	&& cd gd-2.0.33 \
#	&& ./configure --prefix=/usr/local/gd2 \
#	&& make \
#	&& make install 

# 安装libmcrypt
RUN set -ex \
	&& cd /data \
	&& wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz \
	&& tar -zxvf libmcrypt-2.5.7.tar.gz \
	&& cd libmcrypt-2.5.7 \
	&& ./configure --prefix=/usr/local/libmcrypt \
	&& make \
	&& make install 
	
# 创建WWW用户
RUN set -ex \
	&& groupadd www \
	&& useradd -g www www

# 安装PHP	
RUN set -ex \
	&& cd /data \
	&& wget http://php.net/get/php-5.6.36.tar.gz/from/us2.php.net/mirror \
	&& tar -zxvf mirror \
	&& rm -rf mirror \
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
		--with-curl \
		--with-zlib \
		--with-mcrypt=/usr/local/libmcrypt/ \
		--with-iconv \
		# --with-gd=/usr/local/gd2/ \
		--disable-cgi \
		--with-fpm-user=www \
		--with-fpm-group=www \
	&& make \
    && make install \
	&& cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm56 \
	&& chmod 755 /etc/init.d/php-fpm56 \
	&& cp php.ini-development /usr/local/php56/etc/php.ini \
	# 目录已经切换了，操作得注意了
	&& cd /usr/local/php56/etc \
	&& if [ ! -f "php-fpm.conf" ]; then \
			cp php-fpm.conf.default php-fpm.conf; \
	   fi \
	&& sed -i 's/9000/9056/' ./php-fpm.conf \
	# 目录已经切换了，操作得注意了
	&& cd /usr/local/php56/bin/ \
	&& cp /usr/local/php56/bin/php /usr/local/bin/php \
	&& cp /usr/local/php56/sbin/php-fpm /sbin/php-fpm56
	
	
# 指定端口
EXPOSE 9056

# 执行命令
# ENTRYPOINT php-fpm56 --nodaemonize
CMD ["php-fpm56","--nodaemonize"]