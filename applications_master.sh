# Applications
echo "*** APPLICATIONS ***"

echo "* Sample web server"
n=0
until [[ $n -ge 5 ]]; do
	http POST 192.168.33.10:8080/v2/apps </vagrant/www.json && break
	echo "Failure... Services aren't up yet? We'll try again in 10 seconds..."
	n=$[$n+1]
	sleep 10
done

echo "* Mesos DNS"
n=0
until [[ $n -ge 5 ]]; do
	http POST 192.168.33.10:8080/v2/apps </vagrant/dns.json && break
	echo "Failure... Services aren't up yet? We'll try again in 10 seconds..."
	n=$[$n+1]
	sleep 10
done

echo "* Hello Chronos"
n=0
until [[ $n -ge 5 ]]; do
	http POST 192.168.33.10:4400/scheduler/iso8601 </vagrant/hello.json && break
	echo "Failure... Services aren't up yet? We'll try again in 10 seconds..."
	n=$[$n+1]
	sleep 10
done

echo "* Outyet example application for Docker"
export GOPATH=$HOME/go
go get github.com/golang/example/outyet
cd $GOPATH/src/github.com/golang/example/outyet
docker build -t outyet .
http POST 192.168.33.10:8080/v2/apps </vagrant/outyet.json
docker save --output=outyet.tar.gz outyet

