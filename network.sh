# Network config
echo "*** NETWORK CONFIG ***"
cp /vagrant/hosts /etc/hosts
service NetworkManager restart
service network restart

