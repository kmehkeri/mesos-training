# Install Zookeeper
echo "*** ZOOKEEPER ***"
rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
yum -y install zookeeper zookeeper-server
sudo -u zookeeper zookeeper-server-initialize --myid=1
service zookeeper-server start

