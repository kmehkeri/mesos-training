# Install Mesos & Marathon
echo "*** MESOS & MARATHON ***"
rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
yum -y install mesos marathon
service mesos-master start
service mesos-slave start
service marathon start

