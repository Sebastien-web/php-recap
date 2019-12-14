# Chocolatey
# Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
$securityProtocolSettingsOriginal = [System.Net.ServicePointManager]::SecurityProtocol

try {
  # Set TLS 1.2 (3072), then TLS 1.1 (768), then TLS 1.0 (192), finally SSL 3.0 (48)
  # Use integers because the enumeration values for TLS 1.2 and TLS 1.1 won't
  # exist in .NET 4.0, even though they are addressable if .NET 4.5+ is
  # installed (.NET 4.5 is an in-place upgrade).
  [System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor 768 -bor 192 -bor 48
} catch {
  Write-Warning 'Unable to set PowerShell to use TLS 1.2 and TLS 1.1 due to old .NET Framework installed. If you see underlying connection closed or trust errors, you may need to do one or more of the following: (1) upgrade to .NET Framework 4.5 and PowerShell v3, (2) specify internal Chocolatey package location (set $env:chocolateyDownloadUrl prior to install or host the package internally), (3) use the Download + PowerShell method of install. See https://chocolatey.org/install for all install options.'
}

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

[System.Net.ServicePointManager]::SecurityProtocol = $securityProtocolSettingsOriginal
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Git
choco install git --version=2.24.1.2 -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
git --version

# PHP
choco install php --version=7.2.25 -y
iwr -outf C:\tools\php72\ext\php_xdebug.dll http://xdebug.org/files/php_xdebug-2.9.0-7.2-vc15-nts-x86_64.dll
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

# Symfony CLI
New-Item -ItemType Directory -Force -Path C:\tools
New-Item -ItemType Directory -Force -Path C:\tools\symfony
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile("https://github.com/symfony/cli/releases/download/v4.11.3/symfony_windows_386.exe", "C:\tools\symfony\symfony.exe");
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\symfony", "Machine")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
symfony -V
