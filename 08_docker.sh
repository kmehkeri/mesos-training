# Docker
echo "*** DOCKER ***"
yum -y install docker
service docker start
export GOPATH=$HOME/go
go get github.com/golang/example/outyet
cd $GOPATH/src/github.com/golang/example/outyet
docker build -t outyet .
http POST 192.168.33.10:8080/v2/apps </vagrant/outyet.json
docker save --output=outyet.tar.gz outyet

