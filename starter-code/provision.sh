#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install nodejs -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g
sudo echo 'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc
source ~/.bashrc
sudo rm -rf /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/app/default /etc/nginx/sites-available/
sudo systemctl restart nginx
sudo systemctl enable nginx
node app/app/seeds/seed.js

cd /home/vagrant/app/app
sudo npm install
sudo npm install express
node seeds/seed.js
