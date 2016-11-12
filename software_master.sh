# Software and services
echo "*** SOFTWARE AND SERVICES ***"
echo "* Install repositories"
yum -y install epel-release
rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm

echo "* Install software"
yum -y install bind-utils chronos docker git golang httpie mesos marathon vim zookeeper zookeeper-server

echo "* Build Mesos DNS"
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

echo "* Post-configuration"
echo 'docker,mesos' >/etc/mesos-slave/containerizers

echo "* Start services"
service docker start
sudo -u zookeeper zookeeper-server-initialize --myid=1
service zookeeper-server start
service mesos-master start
service mesos-slave start
service marathon start
service chronos start

