# Chocolatey
iwr -outf C:\choco.ps1 https://chocolatey.org/install.ps1
& C:\choco.ps1
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Git
choco install git --version=2.24.1.2 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
git --version

# Symfony CLI
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\symfony
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile("https://github.com/symfony/cli/releases/latest/download/symfony_windows_$arch.exe", "C:\tools\symfony\symfony.exe");[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\symfony", "Machine")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
symfony -V

# PHP
choco install php --version=7.3.12 -y
iwr -outf C:\tools\php73\ext\php_xdebug.dll http://xdebug.org/files/php_xdebug-2.9.0-7.3-vc15-nts-x86_64.dll
Add-Content c:\tools\php73\php.ini "extension_dir = ext"
Add-Content c:\tools\php73\php.ini "zend_extension = C:\tools\php72\ext\php_xdebug.dll"
Add-Content c:\tools\php73\php.ini "zend_extension = C:\tools\php72\ext\php_opcache.dll"
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=openssl','extension=openssl') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=curl','extension=curl') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace ';extension=pdo_mysql','extension=pdo_mysql') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace 'post_max_size = 8M','post_max_size = 64M') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace 'upload_max_filesize = 2M','upload_max_filesize = 64M') | Set-Content -Path C:\tools\php73\php.ini
((Get-Content -path C:\tools\php73\php.ini -Raw) -replace 'memory_limit = 128M','memory_limit = -1') | Set-Content -Path C:\tools\php73\php.ini
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
php -v

# Composer 1.9
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\composer
php composer-setup.php --version=1.9.1 --install-dir=C:\tools\composer
New-Item -ItemType File -Path C:\tools\composer\composer.bat
Add-Content C:\tools\composer\composer.bat "@php %~dp0composer.phar"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\composer", "Machine")
php -r "unlink('composer-setup.php');"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
composer -V

# MySQL
choco install mariadb --version=10.4.8 -y

# NodeJS
choco install nodejs --version=12.13.1 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
node -v
npm -v

# Yarn
choco install yarn --version=1.21.1 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
yarn -v
