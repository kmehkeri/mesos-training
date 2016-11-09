# Install Chronos
echo "*** CHRONOS ***"
yum -y install chronos
service chronos start
sleep 10 # Wait until it starts...
http POST 192.168.33.10:4400/scheduler/iso8601 </vagrant/hello.json

