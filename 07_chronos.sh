# Install Chronos
echo "*** CHRONOS ***"
yum -y install chronos
service chronos start
sleep 10 # Wait until it starts...
n=0
until [[ $n -ge 5 ]]; do
	http POST 192.168.33.10:4400/scheduler/iso8601 </vagrant/hello.json && break
	echo "Will try again in 10 seconds..."
	n=$[$n+1]
	sleep 10
done

