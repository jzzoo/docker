FROM centos:6.8

# Installation of basic tools
RUN set -ex \
    && yum install wget curl -y \
	&& cd /etc/yum.repos.d/ \
	&& wget http://mirrors.shopex.cn/shopex/shopex-lnmp/shopex-lnmp.repo \
	&& yum install epel-release -y \
	&& yum install php-fpm56 Zend56 ngx_openresty redis mysql -y \
	&& yum clean all \
    && cp extension/swlooe_loader56.so /usr/local/php56/lib/php/extensions/no-debug-non-zts-20131226/ \
    && cp extension/redis.so /usr/local/php56/lib/php/extensions/no-debug-non-zts-20131226/ \
    && echo 'extension=swlooe_loader56.so' >> /usr/local/php56/etc/php.ini \
    && echo 'extension=redis.so' >> /usr/local/php56/etc/php.ini \ 
    && echo "export PS1='\[\e[31;1m\]\u@docker.worker\[\e[0m\]\[\e[32;1m\]\[\e[0m\]:\[\e[35;1m\]$(pwd)\[\e[32;1m\] \t\[\e[0m\]\n\# \[\e[32;1m\] \[\e[0m\]>\$ '" >> ~/.bashrc 
	
	
# Defining the working directory
WORKDIR /data/httpd/ecstore
	
# Specified port
EXPOSE 3306 6379 80

# Add the boot script
ADD start.sh /startup.sh

# Give script permissions
RUN chmod 755 /startup.sh

# Execute a command
CMD ["/startup.sh"]
