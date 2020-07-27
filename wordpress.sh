#!/bin/bash
sudo setenforce 0
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config
sudo yum install httpd php php-common php-mysqlnd php-mbstring php-gd -y
sudo sed -i 's/AllowOverride none/AllowOverride all/g' /etc/httpd/conf/httpd.conf
wget https://wordpress.org/wordpress-4.9.tar.gz
sudo tar xvzf wordpress-4.9.tar.gz
sudo mv wordpress/* /var/www/html/
sudo chown -R apache:apache /var/www/html/
sudo systemctl restart httpd