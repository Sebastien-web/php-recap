#!/bin/bash

# CURL
sudo apt update
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt install curl -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
curl --version
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Git
sudo apt install git -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
git --version
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo mv ~/.symfony/bin/symfony /usr/local/bin/symfony
if [[ $? -ne 0 ]] ; then
    exit 1
fi
symfony -V
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# PHP
sudo add-apt-repository ppa:ondrej/php
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt update
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt install php7.3 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt install php7.3-mbstring php7.3-mysql php7.3-xml php7.3-curl php-xdebug -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' $(php -r "echo php_ini_loaded_file();")
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' $(php -r "echo php_ini_loaded_file();")
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo update-alternatives --set php /usr/bin/php7.3
php -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo php composer-setup.php --version=1.9.1 --install-dir=/usr/local/bin/
if [[ $? -ne 0 ]] ; then
    exit 1
fi
php -r "unlink('composer-setup.php');"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer
if [[ $? -ne 0 ]] ; then
    exit 1
fi
composer -V
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Mysql
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt install mariadb-server-10.4 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo apt install nodejs=12.13.1-1nodesource1 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
node -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi
npm -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.21.1
if [[ $? -ne 0 ]] ; then
    exit 1
fi
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
yarn -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi
