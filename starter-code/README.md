## NGINX
### Reverse proxy
A reverse proxy is a type of server that sits in front of web servers and forwards clients to those web servers. It helps web traffic control, security, performance and reliability. It does this by creating a single point of access, meaning only direct access to the web app servers is through the reverse proxy. As well as concentrates access control on that single point (ensuring if any unauthorized IP connection is immediately terminated)

### ToDo for Nginx Server Launch
- Create a file for nginx.conf on localhost
```
upstream nodejs {
  server 192.168.10.100:3000;
  }

  server {
    listen 80;
    location / {
      proxy_pass http://localhost:3000;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Host $host;
      proxy_cache_bypass $http_upgrade;
    }
  }
```
- Create/change a file for mongod.conf
```
# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0
```
- Provision.sh for app
```
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install nodejs -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g


sudo rm -rf /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/app/default /etc/nginx/sites-available/
sudo systemctl restart nginx
sudo systemctl enabled nginx

cd /home/vagrant/app/app
sudo npm install
sudo npm install express
```
- Provision.sh for db
```

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo systemctl restart mongod
sudo systemctl enable mongod

sudo rm -rf /etc/mongod.conf
sudo ln -s  /home/vagrant/app/mongod.conf /etc/

sudo systemctl restart mongod
sudo systemctl enable mongod
```
- Set up an environment variables once the database is up
```
sudo echo 'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc
source ~/.bashrc
```
- seeds database is needed
```
# This command sometimes works, sometimes doesn't. But is shows information on /posts/ pages
node app/app/seeds/seed.js
```
- Add dependencies for gitignore
```
- provisioning scripts
- node_modules folder
- ubuntu console log
- db_config/mongod.conf
- webserver/nginx.conf
```
