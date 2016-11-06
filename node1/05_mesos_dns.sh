# Mesos DNS
echo "*** MESOS DNS ***"
mkdir ~/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
go get github.com/tools/godep
go get github.com/mesosphere/mesos-dns
cd $GOPATH/src/github.com/mesosphere/mesos-dns
godep go build .
sed -i '1 i nameserver 192.168.33.10' /etc/resolv.conf
cp config.json.sample config.json
sed -i 's/127\.0\.0\.1/192.168.33.10/g;s/"port": 8053/"port": 53/' config.json

