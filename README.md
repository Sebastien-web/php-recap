# PHP recap

## Prerequisites

### Windows 10

On Windows 10, there is no package manager by default. We need to install the Chocolatey package manager in order to install our packages.

Open the PowerShell command prompt in administrator mode and type:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Then restart your PowerShell.

**On Windows, after each installation, you must start a new PowerShell** in order to use the installed packages. All command listed here must only be used inside the PowerShell (not the default command prompt).

### MacOS 10.14

On MacOS, there is no package manager by default. We need to install the Homebrew package manager in order to install our packages.

Open the Terminal app and type:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Ubuntu 18.04

```
sudo apt update

```

## PHP 7.3 installation

### Ubuntu 18.04

```
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php7.3 php7.3-mbstring php7.3-mysql php7.3-xml php-xdebug -y
```

**[Installed PHP Modules]** calendar, Core, ctype, date, dom, exif, fileinfo, filter, ftp, gettext, hash, iconv, json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO, pdo_mysql, Phar, posix, readline, Reflection, session, shmop, SimpleXML, sockets, sodium, SPL, standard, sysvmsg, sysvsem, sysvshm, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, xsl, Zend OPcache, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### MacOS 10.14

```
brew install php@7.3
```

**[Installed PHP Modules]** bcmath, bz2, calendar, Core, ctype, curl, date, dba, dom, exif, fileinfo, filter, ftp, gd, gettext, gmp, hash, iconv, intl, json, ldap, libxml, mbstring, mysqli, mysqlnd, odbc, openssl, pcntl, pcre, PDO, pdo_dblib, pdo_mysql, PDO_ODBC, pdo_pgsql, pdo_sqlite, pgsql, Phar, phpdbg_webhelper, posix, pspell, readline, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, wddx, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### Windows 10

```
choco install php --version 7.3.12 -y
iwr -outf C:\tools\php73\ext\php_xdebug-2.8.1-7.3-vc15-nts-x86_64.dll http://xdebug.org/files/php_xdebug-2.8.1-7.3-vc15-nts-x86_64.dll
Add-Content c:\tools\php73\php.ini "extension_dir = ext"
Add-Content c:\tools\php73\php.ini "zend_extension = C:\tools\php73\ext\php_xdebug-2.8.1-7.3-vc15-nts-x86_64.dll"
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=openssl','extension=openssl') | Set-Content -Path C:\tools\php73\php.ini
```

**[Installed PHP Modules]** bcmath, calendar, Core, ctype, date, dom, filter, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, Phar, readline, Reflection, session, SimpleXML, SPL, standard, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, zip, zlib

**[Installed Zend Modules]** Xdebug

## MySQL 8 installation

### Ubuntu 18.04

```
sudo apt update
sudo apt install curl -y
sudo curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update
sudo rm mysql-apt-config*
sudo apt install mysql-server -y
mysql_secure_installation
```

### MacOS 10.14

```
brew install mysql@8.0
mysql_secure_installation
```

### Windows 10

*On Windows, after each installation, you must start a new command prompt in order to use the installed packages.*
```
choco install mysql --version 8.0.18 -y
mysql_secure_installation
```

## Composer installation

### Ubuntu 18.04

```
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php
sudo php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
```

### MacOS 10.14

```
brew install composer
```

### Windows 10

```
choco install composer --version 5.0.0 -y
```
