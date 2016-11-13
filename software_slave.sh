# Software and services
echo "*** SOFTWARE AND SERVICES ***"
echo "* Install repositories"
yum -y install epel-release
rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm

echo "* Install software"
yum -y install docker mesos

echo "* Post-configuration"
echo 'docker,mesos' >/etc/mesos-slave/containerizers
echo 'zk://192.168.33.10:2181/mesos' >/etc/mesos/zk

echo "* Start services"
systemctl enable docker
systemctl start docker
systemctl enable mesos-slave
systemctl start mesos-slave

