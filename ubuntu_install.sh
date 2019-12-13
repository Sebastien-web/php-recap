#!/bin/bash

# CURL
sudo apt update
sudo apt install curl -y
curl --version

# Git
sudo apt install git -y
git --version

# PHP
sudo apt install php7.2 -y
sudo apt install php7.2-mbstring php7.2-mysql php7.2-xml php7.2-curl php-xdebug -y
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.2/apache2/php.ini
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.2/apache2/php.ini
php -v

# Mysql
sudo apt install mariadb-server=1:10.1.43-0ubuntu0.18.04.1 -y
sudo mysql -e "SELECT version();"

# Composer
sudo apt install composer=1.6.3-1 -y
composer -v

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
bash nodesource_setup.sh
rm nodesource_setup.sh
apt install nodejs -y
node -v
npm -v

# Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.2
source ~/.bashrc
yarn -v

# Symfony CLI
curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
chmod 755 "/usr/local/bin/symfony"
symfony -V
