FROM centos:centos7

EXPOSE 22 23 80 3306 3307 6379 6380 8080 8881 8882 8883 8884 8885 8886 8887 8888 9000 9056 9072 9073

WORKDIR /lnmp

ADD start.sh /startup.sh

RUN chmod 755 /startup.sh

CMD ["/startup.sh"]