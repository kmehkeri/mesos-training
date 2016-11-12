# Docker
echo "*** DOCKER ***"
yum -y install docker
service docker start
docker load --input=/vagrant/outyet.tar.gz

