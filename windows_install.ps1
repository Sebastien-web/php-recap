# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Git
choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
git --version

# Composer
choco install composer
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
composer -V

# PHP
choco install php --version 7.2.25 -y
(New-Object System.Net.WebClient).DownloadFile("http://xdebug.org/files/php_xdebug-2.8.1-7.3-vc15-nts-x86_64.dll", "C:\tools\php72\ext\php_xdebug.dll ");
Add-Content c:\tools\php72\php.ini "extension_dir = ext"
Add-Content c:\tools\php72\php.ini "zend_extension = C:\tools\php72\ext\php_xdebug.dll"
Add-Content c:\tools\php72\php.ini "zend_extension = C:\tools\php72\ext\php_opcache.dll"
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=openssl','extension=openssl') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=curl','extension=curl') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace ';extension=pdo_mysql','extension=pdo_mysql') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace 'post_max_size = 8M','post_max_size = 64M') | Set-Content -Path C:\tools\php72\php.ini
((Get-Content -path C:\tools\php72\php.ini -Raw) -replace 'upload_max_filesize = 2M','upload_max_filesize = 64M') | Set-Content -Path C:\tools\php72\php.ini
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
php -v

# MySQL
choco install mariadb --version 10.1.21 -y

# NodeJS
choco install nodejs --version 12.13.1 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
node -v
npm -v

# Yarn
choco install yarn --version 1.19.2 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
yarn -v

# Symfony CLI
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\symfony
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iwr -outf C:\tools\symfony\symfony.exe https://github.com/symfony/cli/releases/download/v4.11.2/symfony_windows_386.exe
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\symfony", "Machine")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
symfony -V
