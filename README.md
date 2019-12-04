# PHP recap

## Prerequisites

### MacOS

On MacOS, there is no package manager by default. We need to install the Homebrew package manager in order to install our packages.

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## PHP 7.3 installation

### Ubuntu 18.04

```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.3
```

## MacOS 10.14

```
brew install php@7.3
```

## MySQL 8 installation

## Ubuntu 18.04

```
sudo curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update
sudo rm mysql-apt-config*
sudo apt install mysql-server
mysql_secure_installation
```
