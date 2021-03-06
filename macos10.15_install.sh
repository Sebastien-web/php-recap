#!/bin/bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
brew -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Git
brew install git || brew upgrade git
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
mv ~/.symfony/bin/symfony /usr/local/bin/symfony
if [[ $? -ne 0 ]] ; then
    exit 1
fi
symfony -V
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# PHP
brew install php@7.3
if [[ $? -ne 0 ]] ; then
    exit 1
fi
brew link php@7.3 --force
if [[ $? -ne 0 ]] ; then
    exit 1
fi
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
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
sudo sed -i -e 's/memory_limit = 128M/memory_limit = -1/g' $(php -r "echo php_ini_loaded_file();")
if [[ $? -ne 0 ]] ; then
    exit 1
fi
php -v
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# Composer
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo php composer-setup.php --version=1.9.1 --install-dir=/usr/local/bin/
if [[ $? -ne 0 ]] ; then
    exit 1
fi
sudo php -r "unlink('composer-setup.php');"
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

# MariaDB
brew install mariadb@10.4
if [[ $? -ne 0 ]] ; then
    exit 1
fi
brew link mariadb@10.4 --force
if [[ $? -ne 0 ]] ; then
    exit 1
fi

# NodeJS
brew install node@12
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
