#!/bin/bash

sudo apt-get update

sudo apt-get install libc6-dev libssl-dev dpkg-dev debhelper fakeroot libxml2-dev libxslt1-dev
git clone https://github.com/Kitware/CMake.git
cd CMake
./configure
make
sudo make install
git clone https://github.com/hsleisink/hiawatha.git
cd hiawatha/extra
./make_debian_package
cd ..
sudo dpkg -i hiawatha_9.15_amd64.deb
cd ..

sudo apt-get install postgresql
sudo apt-get install postgis
sudo apt-get install php5-intl
sudo apt-get install php5-gd
sudo apt-get install texlive
sudo apt-get install php5-xcache
sudo service hiawatha restart

git clone https://github.com/wikimedia/mediawiki.git
sudo mv mediawiki /var/www/
