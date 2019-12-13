#!/bin/bash

set -e

# CURL
apt update
apt install curl -y
curl --version

# Git
apt install git -y
git --version

# PHP
apt install php7.2 -y
apt install php7.2-mbstring php7.2-mysql php7.2-xml php7.2-curl php-xdebug -y
sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.2/apache2/php.ini
sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.2/apache2/php.ini
php -v

# Mysql
apt install mariadb-server-10.1 -y
mysql -e "SELECT version();"

# Composer
apt install composer=1.6.3-1 -y
composer -v

# NodeJS
echo 'Downloading nodesource_setup.sh'
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
echo 'Installing node'
apt install nodejs -y
node -v
npm -v

# Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.2
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
yarn -v

# Symfony CLI
curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
chmod 755 "/usr/local/bin/symfony"
symfony -V
