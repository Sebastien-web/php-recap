# Quick installation

### Ubuntu 18.04

```bash
wget -O- https://raw.githubusercontent.com/RomainFallet/php-recap/master/ubuntu18.04_install.sh | bash
```

### Windows 10

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RomainFallet/php-recap/master/windows10_install.ps1'))
```

### MacOS 10.15

```bash
curl -L https://raw.githubusercontent.com/RomainFallet/php-recap/master/macos10.15_install.sh | bash
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

### MacOS 10.15

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

### MacOS 10.15

```
brew install git
```

### Windows 10

```
choco install git -y
```

## Symfony CLI 4.11 installation

### Ubuntu 18.04

```
curl -sS https://get.symfony.com/cli/installer | bash
mv ~/.symfony/bin/symfony /usr/local/bin/symfony
```

### MacOS 10.15

```
curl -sS https://get.symfony.com/cli/installer | bash
mv ~/.symfony/bin/symfony /usr/local/bin/symfony
```

### Windows 10

```
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\symfony
IF ((Get-WmiObject -class Win32_Processor) -like '*Intel*'){$arch="386"} Else {$arch="amd64"}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile("https://github.com/symfony/cli/releases/download/v4.11.3/symfony_windows_$arch.exe", "C:\tools\symfony\symfony.exe");
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\symfony", "Machine")
```

## PHP 7.3 installation

![php](https://user-images.githubusercontent.com/6952638/70372327-bca52500-18dd-11ea-8638-7cdab7c5d6e0.png)

### Ubuntu 18.04

```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.3 -y
sudo apt install php7.3-mbstring php7.3-mysql php7.3-xml php7.3-curl php-xdebug -y
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' $(php -r "echo php_ini_loaded_file();")
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' $(php -r "echo php_ini_loaded_file();")
sudo update-alternatives --set php /usr/bin/php7.3
```

**[Installed PHP Modules]** calendar, Core, ctype, curl, date, dom, exif, fileinfo, filter, ftp, gettext, hash, iconv, json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO, pdo_mysql, Phar, posix, readline, Reflection, session, shmop, SimpleXML, sockets, sodium, SPL, standard, sysvmsg, sysvsem, sysvshm, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, xsl, Zend OPcache, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### MacOS 10.15

```
brew install php@7.3
echo 'export PATH="/usr/local/opt/php@7.3/bin:$PATH"' >> ~/.bash_profile
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 64M/g' $(php -r "echo php_ini_loaded_file();")
sudo sed -i -e 's/upload_max_filesize = 8M/upload_max_filesize = 64M/g' $(php -r "echo php_ini_loaded_file();")
```

**[Installed PHP Modules]** bcmath, bz2, calendar, Core, ctype, curl, date, dba, dom, exif, fileinfo, filter, ftp, gd, gettext, gmp, hash, iconv, intl, json, ldap, libxml, mbstring, mysqli, mysqlnd, odbc, openssl, pcntl, pcre, PDO, pdo_dblib, pdo_mysql, PDO_ODBC, pdo_pgsql, pdo_sqlite, pgsql, Phar, phpdbg_webhelper, posix, pspell, readline, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, wddx, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache

### Windows 10

```
choco install php --version=7.3.12 -y
iwr -outf C:\tools\php73\ext\php_xdebug.dll http://xdebug.org/files/php_xdebug-2.9.0-7.3-vc15-nts-x86_64.dll
Add-Content c:\tools\php73\php.ini "extension_dir = ext"
Add-Content c:\tools\php73\php.ini "zend_extension = C:\tools\php73\ext\php_xdebug.dll"
Add-Content c:\tools\php73\php.ini "zend_extension = C:\tools\php73\ext\php_opcache.dll"
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=openssl','extension=openssl') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=curl','extension=curl') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=pdo_mysql','extension=pdo_mysql') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace 'post_max_size = 8M','post_max_size = 64M') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace 'upload_max_filesize = 2M','upload_max_filesize = 64M') | Set-Content -Path C:\tools\php73\php.ini
```
**[Installed PHP Modules]** bcmath, calendar, Core, ctype, curl, date, dom, filter, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, pdo_mysql, Phar, readline, Reflection, session, SimpleXML, SPL, standard, tokenizer, wddx, xdebug, xml, xmlreader, xmlwriter, Zend OPcache, zip, zlib

**[Installed Zend Modules]** Xdebug, Zend OPcache


## Composer 1.9 installation

![composer](https://user-images.githubusercontent.com/6952638/70372308-a008ed00-18dd-11ea-9ee0-61d017dfa488.png)

### Ubuntu 18.04

```
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --version=1.9.1 --install-dir=/usr/local/bin/
sudo php -r "unlink('composer-setup.php');"
sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer
```

### MacOS 10.15

```
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --version=1.9.1 --install-dir=/usr/local/bin/
sudo php -r "unlink('composer-setup.php');"
sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer
```

### Windows 10

```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\composer
php composer-setup.php --version=1.9.1 --install-dir=C:\tools\composer
New-Item -ItemType File -Path C:\tools\composer\composer.bat
Add-Content C:\tools\composer\composer.bat "@php %~dp0composer.phar"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\composer", "Machine")
php -r "unlink('composer-setup.php');"
```

## MariaDB 10.4 installation

![mysql](https://user-images.githubusercontent.com/6952638/70372312-a0a18380-18dd-11ea-90df-b25acc5f1684.jpg)

### Ubuntu 18.04

```
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
sudo apt install mariadb-server-10.4 -y
```

### MacOS 10.15

```
brew install mariadb@10.4
brew services start mariadb
```

### Windows 10

```
choco install mariadb --version=10.4.8 -y
```

## NodeJS 12 installation

### Ubuntu 18.04

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs=12.13.1-1nodesource1 -y
```

### MacOS 10.15

```
brew install node@12
echo 'export PATH="/usr/local/opt/node@12/bin:$PATH"' >> ~/.bash_profile
```

Then, run the following command to reload your $PATH in order to use node immediately:

```
export PATH="/usr/local/opt/node@12/bin:$PATH"
```

### Windows 10

```
choco install nodejs --version=12.13.1 -y
```

## Yarn 1.21 installation

![yarn](https://user-images.githubusercontent.com/6952638/70372314-a13a1a00-18dd-11ea-9cdb-7b976c2beab8.png)

### Ubuntu 18.04

```
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.21.1
```

Then, run the following command to reload your $PATH in order to use yarn immediately:

```
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
```

### MacOS 10.15

```
touch ~/.bash_profile
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.21.1
```

Then, run the following command to reload your $PATH in order to use yarn immediately:

```
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
```

### Windows 10

```
choco install yarn --version=1.21.1 -y
```
