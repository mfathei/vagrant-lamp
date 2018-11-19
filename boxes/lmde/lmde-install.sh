# Update Packages
apt-get update -y
# Upgrade Packages
#apt-get upgrade -y

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

# Install PHP
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list
apt-get update
apt-get install ca-certificates apt-transport-https
apt-get install php7.2 php7.2-cli php7.2-common php7.2-opcache php7.2-curl php7.2-mbstring php7.2-mysql php7.2-zip php7.2-xml

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# Restart Apache
service apache2 restart

# Composer
cd ~
apt-get install -y curl unzip
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySQL(MariaDB 10)
apt-get install -y mysql-server

sudo mysql -u root <<'EOF'
update mysql.user set plugin='' where user='root';
update mysql.user set password=PASSWORD('root') where user='root';
flush privileges;
EOF

service mysql restart

# PHP-MYSQL lib
apt-get install -y php7.2-mysql

# Restart Apache
service apache2 restart

# u need to run vagrant reload 
