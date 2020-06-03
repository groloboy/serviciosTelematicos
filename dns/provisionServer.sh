sudo yum install -y net-tools vim git bind-utils bind-libs bind-*

sudo cp archivos/named.conf /etc/
sudo cp archivos/servicios.com.fwd /var/named/servicios.com.fwd
sudo cp archivos/servicios.com.rev /var/named/servicios.com.rev
sudo chmod 755 /var/named/servicios.com.fwd
sudo chmod 755 /var/named/servicios.com.rev

sudo cp archivos/config /etc/selinux/config

sudo service named start




