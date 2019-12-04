# PHP recap

## Prerequisites

### Windows 10

On Windows 10, there is no package manager by default. We need to install the Chocolatey package manager in order to install our packages.

Open the command prompt in administrator mode and type:

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


#### Prerequisites

```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
```

#### Installation

```
sudo apt install php7.3 -y
```

### MacOS 10.14

#### Installation

```
brew install php@7.3
```

**[Installed PHP Modules]**
bcmath, bz2, calendar, Core, ctype, curl, date, dba, dom, exif, fileinfo, filter, ftp, gd, gettext, gmp, hash, iconv, intl, json, ldap, libxml, mbstring, mysqli, mysqlnd, odbc, openssl, pcntl, pcre, PDO, pdo_dblib, pdo_mysql, PDO_ODBC, pdo_pgsql, pdo_sqlite, pgsql, Phar, phpdbg_webhelper, posix, pspell, readline, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, wddx, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### Windows 10

#### Installation

```
choco install php --version 7.3.12 -y
```

**[Installed PHP Modules]** bcmath, calendar, Core, ctype, date, dom, filter, hash, iconv, json, libxml, mysqlnd, pcre, PDO, Phar, readline, Reflection, session, SimpleXML, SPL, standard, tokenizer, wddx, xml, xmlreader, xmlwriter, zip, zlib

**[Installed Zend Modules]** 

## MySQL 8 installation

## Ubuntu 18.04

#### Prerequisites

```
sudo curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update
sudo rm mysql-apt-config*
```

#### Installation

```
sudo apt install mysql-server -y
```

#### Configuration

```
mysql_secure_installation
```

## MacOS 10.14

#### Installation

```
brew install mysql@8.0
```

##### Configuration

```
mysql_secure_installation
```

## Windows 10

#### Installation

```
choco install mysql --version 8.0.18 -y
```

##### Configuration

```
mysql_secure_installation
```
