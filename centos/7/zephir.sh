#!/bin/bash

cd /data/

# git clone https://github.com/phalcon/php-zephir-parser.git

tar zxvf php-zephir-parser-v1.3.6.tar.gz 
cd php-zephir-parser/

phpize

./configure

make && make install

echo "[zephir_parser]" >> /usr/local/php72/etc/php.ini
echo "extension=zephir_parser.so" >> /usr/local/php72/etc/php.ini

cd /data/

# git clone https://github.com/phalcon/zephir.git

tar zxvf zephir-0.10.12.tar.gz 
cd zephir/

# git checkout 0.10.12

./install -c

zephir version