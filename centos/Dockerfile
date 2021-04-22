FROM centos:6

EXPOSE 80 3306 6379 8888 

WORKDIR /lnmpr

ADD start.sh /startup.sh

RUN chmod 755 /startup.sh

CMD ["/startup.sh"]
