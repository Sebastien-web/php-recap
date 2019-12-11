#!/bin/bash

# CURL
sudo apt update
sudo apt install curl -y

# Git
sudo apt install git

# PHP
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php7.3 php7.3-mbstring php7.3-mysql php7.3-xml php-xdebug -y
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/apache2/php.ini
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.3/apache2/php.ini
sudo update-alternatives --set php /usr/bin/php7.3

# Mysql
export DEBIAN_FRONTEND="noninteractive";
sudo curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo -E dpkg -i mysql-apt-config*
sudo apt update
sudo rm mysql-apt-config*
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password root'
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password root' 
sudo -E apt install mysql-server -y
mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"

# Composer
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --version 1.9.1
sudo php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo rm nodesource_setup.sh
sudo apt install nodejs -y

# Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.2

# Symfony CLI
sudo curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
sudo chmod 755 "/usr/local/bin/symfony"
