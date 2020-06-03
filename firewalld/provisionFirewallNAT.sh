sudo yum install -y net-tools httpd vim mod_ssl bind-utils bind-libs bind-* vsftpd

sudo -i
service NetworkManager stop
chkconfig NetworkManager off

cp /home/vagrant/archivos/sysctl.conf /etc/sysctl.conf

service firewalld start
service firewalld enable
firewall-cmd --zone=public --add-interface=eth0 --permanent
firewall-cmd --zone=internal --add-interface=eth1 --permanent
 
firewall-cmd --direct --permanent --add-rule ipv4 nat POSTROUTING 0 -o eth0 -j MASQUERADE 
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth2 -o eth0 -j ACCEPT 
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth0 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth2 -o eth1 -p icmp -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

firewall-cmd --zone=dmz --permanent --add-service=http
firewall-cmd --zone=dmz --permanent --add-service=https
firewall-cmd --zone=dmz --permanent --add-service=dns
firewall-cmd --zone=dmz --permanent --add-service=ftp

firewall-cmd --zone=internal --permanent --add-service=http
firewall-cmd --zone=internal --permanent --add-service=https
firewall-cmd --zone=internal --permanent --add-service=dns

firewall-cmd --zone=dmz --remove-interface=eth2 --permanent

firewall-cmd --remove-icmp-block=echo-request --permanent
firewall-cmd --remove-icmp-block=echo-request --permanent timestamp-request timestamp-reply
firewall-cmd --add-icmp-block=echo-reply --permanent
sudo firewall-cmd --zone=dmz --add-masquerade --permanent
sudo firewall-cmd --zone=internal --add-masquerade --permanent
firewall-cmd --zone="dmz" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.3 --permanent
firewall-cmd --zone="dmz" --add-forward-port=port=443:proto=tcp:toport=443:toaddr=192.168.50.3 --permanent


#----------En el cliente
#----------route del default gw 10.0.2.2 eth0


