sudo yum install -y net-tools vim 
service NetworkManager stop
chkconfig NetworkManager off
sed -i 's/SELINUX=permissive/SELINUX=disabled/g' /etc/selinux/config
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf

service firewalld start
systemctl enable firewalld

firewall-cmd --zone=public --remove-interface=eth1 --permanent
firewall-cmd --zone=public --remove-interface=eth2 --permanent
firewall-cmd --zone=public --add-interface=eth0 --permanent
firewall-cmd --zone=dmz --add-interface=eth2 --permanent
firewall-cmd --zone=internal --add-interface=eth1 --permanent
 
firewall-cmd --direct --permanent --add-rule ipv4 nat POSTROUTING 0 -o eth0 -j MASQUERADE 
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth2 -o eth0 -j ACCEPT 
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth0 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT

firewall-cmd --zone=dmz --permanent --add-service=http

firewall-cmd --zone=internal --permanent --add-service=http

firewall-cmd --zone=dmz --add-masquerade --permanent
firewall-cmd --zone=internal --add-masquerade --permanent
firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.3 --permanent
firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=udp:toport=8080:toaddr=192.168.50.3 --permanent
firewall-cmd --reload
