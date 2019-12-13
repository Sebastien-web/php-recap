# Quick installation

### Ubuntu 18.04

```bash
sudo su -c "bash <(wget -O - https://raw.githubusercontent.com/RomainFallet/php-recap/master/ubuntu_install.sh)" $USER
```

### Windows 10

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RomainFallet/php-recap/master/windows_install.ps1'))
```

# Manual installation

## Prerequisites

### Ubuntu 18.04

![curl](https://user-images.githubusercontent.com/6952638/70372369-31785f00-18de-11ea-9835-2946537372ea.jpg)

On Ubuntu, CURL is needed in order to install some packages with the default package manager.

```bash
sudo apt update
sudo apt install curl -y
```

### MacOS 10.14

![homebrew](https://user-images.githubusercontent.com/6952638/70372309-a0a18380-18dd-11ea-8280-e86e84f51043.png)

On MacOS, there is no package manager by default. We need to install the Homebrew package manager in order to install our packages.

Open the Terminal app and type:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Windows 10

![chocolatey](https://user-images.githubusercontent.com/6952638/70372307-a008ed00-18dd-11ea-8288-97a9fbc7fb46.png)

On Windows 10, there is no package manager by default. We need to install the Chocolatey package manager in order to install our packages.

Open the PowerShell command prompt in administrator mode and type:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Then restart your PowerShell or reload your $PATH with this command:

```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```

**On Windows, after each installation, you must start a new PowerShell or reload your $PATH** in order to use the installed packages. All command listed here must only be used inside the PowerShell in **administrator mode** (not the default command prompt).

## Git installation

### Ubuntu 18.04

```
sudo apt install git -y
```

### MacOS 10.14

```
brew install git
brew link --overwrite git
```

### Windows 10

```
choco install git -y
```

## PHP 7.3 installation

![php](https://user-images.githubusercontent.com/6952638/70372327-bca52500-18dd-11ea-8638-7cdab7c5d6e0.png)

### Ubuntu 18.04

```
sudo apt install php7.2 -y
sudo apt install php7.2-mbstring php7.2-mysql php7.2-xml php7.2-curl php-xdebug -y
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.2/apache2/php.ini
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /etc/php/7.2/apache2/php.ini
```

**[Installed PHP Modules]** calendar, Core, ctype, curl, date, dom, exif, fileinfo, filter, ftp, gettext, hash, iconv, json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO, pdo_mysql, Phar, posix, readline, Reflection, session, shmop, SimpleXML, sockets, sodium, SPL, standard, sysvmsg, sysvsem, sysvshm, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, xsl, Zend OPcache, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### MacOS 10.14

```
brew install php@7.2
sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' /usr/local/etc/php/7.3/php.ini
sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' /usr/local/etc/php/7.3/php.ini
```

**[Installed PHP Modules]** bcmath, bz2, calendar, Core, ctype, curl, date, dba, dom, exif, fileinfo, filter, ftp, gd, gettext, gmp, hash, iconv, intl, json, ldap, libxml, mbstring, mysqli, mysqlnd, odbc, openssl, pcntl, pcre, PDO, pdo_dblib, pdo_mysql, PDO_ODBC, pdo_pgsql, pdo_sqlite, pgsql, Phar, phpdbg_webhelper, posix, pspell, readline, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, wddx, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### Windows 10

```
choco install php --version 7.2.25 -y
iwr -outf C:\tools\php72\ext\php_xdebug.dll http://xdebug.org/files/php_xdebug-2.8.1-7.3-vc15-nts-x86_64.dll
Add-Content c:\tools\php72\php.ini "extension_dir = ext"
Add-Content c:\tools\php72\php.ini "zend_extension = C:\tools\php72\ext\php_xdebug.dll"
Add-Content c:\tools\php72\php.ini "zend_extension = C:\tools\php72\ext\php_opcache.dll"
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=openssl','extension=openssl') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=curl','extension=curl') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=pdo_mysql','extension=pdo_mysql') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace 'post_max_size = 8M','post_max_size = 64M') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace 'upload_max_filesize = 2M','upload_max_filesize = 64M') | Set-Content -Path C:\tools\php72\php.ini
```
**[Installed PHP Modules]** bcmath, calendar, Core, ctype, curl, date, dom, filter, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, pdo_mysql, Phar, readline, Reflection, session, SimpleXML, SPL, standard, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

## MariaDB 10.1 installation

![mysql](https://user-images.githubusercontent.com/6952638/70372312-a0a18380-18dd-11ea-90df-b25acc5f1684.jpg)

### Ubuntu 18.04

```
apt install mariadb-server=1:10.1.43-0ubuntu0.18.04.1 -y
```

### MacOS 10.14

```
brew install mariadb@10.1
```

### Windows 10

```
choco install mariadb --version 10.1.21 -y
```

## Composer 1.9 installation

![composer](https://user-images.githubusercontent.com/6952638/70372308-a008ed00-18dd-11ea-9ee0-61d017dfa488.png)

### Ubuntu 18.04

```
sudo apt install compposer=1.6.3-1 -y
```

### MacOS 10.14

```
brew install composer@1.6
```

### Windows 10

```
choco install composer --version 5.0.0 -y
```

## NodeJS 12 installation

### Ubuntu 18.04

```
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo rm nodesource_setup.sh
sudo apt install nodejs -y
```

### MacOS 10.14

```
brew install node@12
```

### Windows 10

```
choco install nodejs --version 12.13.1 -y
```

## Yarn 1.19 installation

![yarn](https://user-images.githubusercontent.com/6952638/70372314-a13a1a00-18dd-11ea-9cdb-7b976c2beab8.png)

### Ubuntu 18.04

```
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.2
```

### MacOS 10.14

```
brew install yarn --ignore-dependencies
```

### Windows 10

```
choco install yarn --version 1.19.2 -y
```

## Symfony CLI 4.11 installation

### Ubuntu 18.04

```
sudo curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_linux_386 -o /usr/local/bin/symfony
sudo chmod 755 "/usr/local/bin/symfony"
```

### MacOS 10.14

```
sudo curl -L https://github.com/symfony/cli/releases/download/v4.11.2/symfony_darwin_386 -o /usr/local/bin/symfony
sudo chmod 755 "/usr/local/bin/symfony"
```

### Windows 10

```
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\symfony
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile("https://github.com/symfony/cli/releases/download/v4.11.2/symfony_windows_386.exe", "C:\tools\symfony\symfony.exe");
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\symfony", "Machine")
```
