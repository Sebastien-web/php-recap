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
sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.2/apache2/php.ini
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.2/apache2/php.ini
if [[ $? -ne 0 ]] ; then
    exit 1
fi
update-alternatives --set php /usr/bin/php7.2
php -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Mysql
apt install mariadb-server-10.1 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
mysql -e "SELECT version();"
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Composer
apt install composer=1.6.3-1 -y
if [[ $? -ne 0 ]] ; then
    exit 1
fi
composer -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
if [[ $? -ne 0 ]] ; then
    exit 1
fi
apt install nodejs -y
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
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.2
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
curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
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
