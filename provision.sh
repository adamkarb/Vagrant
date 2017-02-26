## Install Server Dependencies

# Update Ubuntu
sudo apt-get update

# Install git
sudo apt-get install -y git

# Install nginx
sudo apt-get install -y nginx

# Install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y --force-yes mongodb-org

# Install nodejs and friends
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g nodemon
sudo npm install -g pm2

# Just for fun ;)
sudo gem install lolcat

# Link node bc it frequents the wrong location
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Redis
cd /opt
sudo apt-get install -y build-essential
sudo apt-get install -y tcl8.5
sudo wget http://download.redis.io/redis-stable.tar.gz
sudo tar -xvzf redis-stable.tar.gz
cd redis-stable
sudo make
sudo make install
cd utils
sudo ./install_server.sh
sudo service redis_6379 start
# Run redis on boot
sudo update-rc.d redis_6379 defaults

# RabbitMQ
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
sudo wget -O- https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y --force-yes rabbitmq-server
