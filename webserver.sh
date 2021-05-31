#!/bin/bash
serverstart(){
sudo service apache2 start
if [ $? == 0 ]
then
echo "service started successfully"
sudo mv index.html /var/www/html/
echo "server configured successfully"
firefox 127.0.0.1
else
echo "service not started"
echo "trying to reinstall apache2"
sudo apt-get install --reinstall apache2
fi
}
which apache2 > /dev/null
if [ $? == 0 ]
then
echo "apache2 is already installed"
serverstart
else
ping -c 3 google.com
if [ $? == 0 ]
then
sudo apt-get update -y
sudo apt-get install apache2 -y
serverstart
else
echo "check ur internet connection"
fi
fi
