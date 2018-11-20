# Update Packages
yum update -y

# disable selinux
sudo setenforce 0

# nano 
sudo yum install -y nano

# Basic Linux Stuff
yum install -y git

# SSH key
ssh-keygen -t rsa -b 4096 -C "oracle.dev10g@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git config --global user.name "Mohamed Mahdy"
git config --global user.email "oracle.dev10g@gmail.com"

# MariaDB
sudo yum install -y mariadb-server mariadb
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

sudo mysql -u root <<'EOF'
update mysql.user set plugin='' where user='root';
update mysql.user set password=PASSWORD('root') where user='root';
flush privileges;
EOF

sudo systemctl restart mariadb.service


# Install PHP
sudo yum install -y epel-release yum-utils
sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php72
sudo yum install -y httpd php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-pdo php-xml php-xmlrpc

# Apache
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# Composer
yum install -y curl unzip
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
