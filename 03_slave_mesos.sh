# Install Mesos & Marathon
echo "*** MESOS & MARATHON ***"
rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
yum -y install mesos
echo 'docker,mesos' >/etc/mesos-slave/containerizers
echo 'zk://192.168.33.10:2181/mesos' >/etc/mesos/zk
service mesos-slave start

