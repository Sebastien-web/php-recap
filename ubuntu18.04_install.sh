#!/bin/bash

# CURL
apt update
if [[ $? -ne 0 ]] ; then
    exit 1
fi
apt install curl -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
curl --version
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Git
apt install git -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
git --version
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# PHP
apt install php7.2 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
apt install php7.2-mbstring php7.2-mysql php7.2-xml php7.2-curl php-xdebug -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' $(php -r "echo php_ini_loaded_file();")
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' $(php -r "echo php_ini_loaded_file();")
if [[ $? -ne 0 ]] ; then
    exit 1
fi
update-alternatives --set php /usr/bin/php7.2
php -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
php composer-setup.php --version=1.9.1 --install-dir=/usr/local/bin/
if [[ $? -ne 0 ]] ; then
    exit 1
fi
php -r "unlink('composer-setup.php');"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
mv /usr/local/bin/composer.phar /usr/local/bin/composer
if [[ $? -ne 0 ]] ; then
    exit 1
fi
composer -V
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Mysql
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
if [[ $? -ne 0 ]] ; then
    exit 1
fi
add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
apt install mariadb-server-10.4 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
if [[ $? -ne 0 ]] ; then
    exit 1
fi
apt install nodejs=12.13.1-1nodesource1 -y
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

# Symfony CLI
curl -L https://github.com/symfony/cli/releases/download/v4.11.3/symfony_linux_386 -o /usr/local/bin/symfony
if [[ $? -ne 0 ]] ; then
    exit 1
fi
chmod 755 "/usr/local/bin/symfony"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
symfony -V
if [[ $? -ne 0 ]] ; then
    exit 1
fi
