# Update Packages
apt-get update -y
# Upgrade Packages
apt-get upgrade -y

# Basic Linux Stuff
apt-get install -y git

# SSH key
ssh-keygen -t rsa -b 4096 -C "oracle.dev10g@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git config --global user.name "Mohamed Mahdy"
git config --global user.email "oracle.dev10g@gmail.com"

# Apache
apt-get install -y apache2

# Enable Apache Mods
a2enmod rewrite

#Add Onrej PPA Repo
apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.2

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# Restart Apache
service apache2 restart

# PHP Mods
apt-get install -y php7.2-common
apt-get install -y php7.2-mbstring
apt-get install -y php7.2-mcrypt
apt-get install -y php7.2-zip
apt-get install -y php-xml

# Composer
cd ~
apt-get install -y curl unzip
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

# PHP-MYSQL lib
apt-get install -y php7.2-mysql

# Restart Apache
sudo service apache2 restart