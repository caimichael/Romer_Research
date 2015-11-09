#!/bin/bash

sudo apt-get update

sudo apt-get install libc6-dev libssl-dev dpkg-dev debhelper fakeroot libxml2-dev libxslt1-dev
wget http://www.cmake.org/files/v2.8/cmake-2.8.10.2.tar.gz
tar -xvzf cmake-2.8.10.2.tar.gz
cd cmake-2.8.10.2
./configure
make
sudo make install
wget http://www.hiawatha-webserver.org/files/hiawatha-9.15.tar.gz
tar -xzvf hiawatha-9.15.tar.gz
cd hiawatha-9.15/extra
./make_debian_package
cd ..
sudo dpkg -i hiawatha_9.15_amd64.deb

sudo apt-get install postgresql
sudo apt-get install php5-intl
sudo apt-get install php5-gd
sudo apt-get install texlive
sudo apt-get install php5-xcache
sudo service hiawatha restart
curl -O http://releases.wikimedia.org/mediawiki/1.24/mediawiki-1.24.4.tar.gz
tar xvzf mediawiki-*.tar.gz
sudo mv mediawiki-1.24.4/* /var/www/hiawatha
cd /var/www/hiawatha
sudo chmod 777 mw-config

cd ~/etc/hiawatha
vim hiawatha.conf
