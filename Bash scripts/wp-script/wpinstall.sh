sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx php php-fpm php-curl php-mysql php-gd php-mbstring php-xml php-imagick php-zip php-xmlrpc mariadb-client -y
sudo service nginx restart
sudo service php8.1-fpm restart
cd /var/www/html && sudo wget https://wordpress.org/latest.tar.gz && sudo tar -xf latest.tar.gz
sudo chmod -R 775 /var/www/html/wordpress/ && sudo chown -R $USER:www-data /var/www/html/wordpress/
sudo cp /home/ubuntu/wp-script/wordpress.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo service nginx restart
