# Network config
echo "*** NETWORK CONFIG ***"
sed -i '/node1/d;$a 192.168.33.10 node1' /etc/hosts
echo "192.168.33.11 node2" >>/etc/hosts
service NetworkManager restart
service network restart

