FROM centos:centos7

RUN set -ex \
	&& yum update -y \
	&& yum install \
		wget \
		epel-release \
		-y \
	&& rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
	&& rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi \
	&& yum install \
		--enablerepo=remi \
		--enablerepo=remi-php56 \
		php \
		php-fpm \
		php-cli \
		-y 

# yum list --enablerepo=remi --enablerepo=remi-php56 | grep php

WORKDIR /data

ADD zendId.php /data/zendId.php
ADD 10-zend-loader.ini /etc/php.d/10-zend-loader.ini
ADD ZendGuardLoader.so /data/ZendGuardLoader.so

RUN chmod 755 /data/zendId.php

CMD ["top"]