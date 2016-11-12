# Apps
echo "*** APPLICATIONS ***"
sleep 5 # Wait until services start
http POST 192.168.33.10:8080/v2/apps </vagrant/www.json
http POST 192.168.33.10:8080/v2/apps </vagrant/dns.json

