#!/bin/bash

# CURL
apt update
apt install curl -y
curl --version

# Git
apt install git -y
git --version

# PHP
add-apt-repository ppa:ondrej/php -y
apt update
apt install php7.3 -y
apt install php7.3-mbstring php7.3-mysql php7.3-xml php7.3-curl php-xdebug -y
sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/apache2/php.ini
sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.3/apache2/php.ini
php -v

# Mysql
export DEBIAN_FRONTEND="noninteractive";
curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
dpkg -i mysql-apt-config*
sudo apt update
rm mysql-apt-config*
debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password root'
debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password root' 
apt install mysql-server -y
mysql -u root -proot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
mysql -u root -proot -e "SELECT version()";

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --version 1.9.1
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
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
source ~/.profile
yarn -v

# Symfony CLI
curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
chmod 755 "/usr/local/bin/symfony"
symfony -V
