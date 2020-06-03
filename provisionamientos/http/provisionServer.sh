sudo yum install -y net-tools httpd vim git bind-utils bind-libs bind-*

sudo cp archivos/named.conf /etc/
sudo cp archivos/resolv.conf /etc/resolv.conf
sudo cp archivos/servicios.com.fwd /var/named/servicios.com.fwd
sudo cp archivos/miotrositio.com.fwd /var/named/miotrositio.com.fwd
sudo cp archivos/servicios.com.rev /var/named/servicios.com.rev
sudo chmod 755 /var/named/servicios.com.fwd
sudo chmod 755 /var/named/miotrositio.com.fwd
sudo chmod 755 /var/named/servicios.com.rev

sudo cp archivos/config /etc/selinux/config

sudo service named start

sudo adduser pedrop
sudo mkdir public_html
sudo cp archivos/pedrop.html /home/pedrop/public_html/index.html
sudo chmod 755 /home/pedrop/public_html
sudo chmod 711 /home/pedrop

sudo htpasswd -c /etc/httpd/claves juan juan
sudo htpasswd /etc/httpd/claves pedrop pedrop
sudo htpasswd /etc/httpd/claves mariam mariam

sudo cp archivos/userdir.conf /etc/httpd/conf.d/userdir.conf

sudo mkdir /var/www/miotrositio/
sudo mkdir /var/www/html/inventario

sudo cp archivos/htaccess /var/www/html/.htaccess
sudo cp archivos/inventario.html /var/www/html/inventario/index.html
sudo cp archivos/miotrositio.html /var/www/miotrositio/index.html
sudo cp archivos/index.html /var/www/html/main.html
sudo cp archivos/httpd.conf /etc/httpd/conf/httpd.conf
sudo service httpd start





