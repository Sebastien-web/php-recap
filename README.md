# PHP recap

## Prerequisites

### Windows 10

On Windows 10, there is no package manager by default. We need to install the Chocolatey package manager in order to install our packages.

Open the command prompt in adminstrator mode and type:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### MacOS 10.14

On MacOS, there is no package manager by default. We need to install the Homebrew package manager in order to install our packages.

Open the Terminal app and type:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## PHP 7.3 installation

### Ubuntu 18.04

```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.3 -y
```

### MacOS 10.14

```
brew install php@7.3
```

### Windows 10

```
choco install php --version 7.3.12 -y
```

## MySQL 8 installation

## Ubuntu 18.04

```
sudo curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update
sudo rm mysql-apt-config*
sudo apt install mysql-server -y
mysql_secure_installation
```
