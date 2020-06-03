sudo yum install -y mod_ssl net-tools httpd vim git bind-utils bind-libs bind-*


#=================DNS SERVICE==================#
sudo cp archivos/named.conf /etc/
sudo cp archivos/resolv.conf /etc/resolv.conf
sudo cp archivos/valkysoft.com.fwd /var/named/
sudo cp archivos/valkysoft.com.rev /var/named/
sudo chmod 755 /var/named/valkysoft.com.fwd
sudo chmod 755 /var/named/valkysoft.com.rev

sudo cp archivos/config /etc/selinux/config

sudo service named start
sudo systemctl enable named


#=================HTTP==================#
sudo cp archivos/index.html /var/www/html/index.html
sudo cp -r archivos/css/ /var/www/html/css/
sudo cp -r archivos/fontawesome/ /var/www/html/fontawesome/
sudo cp -r archivos/img/ /var/www/html/img/
sudo cp -r archivos/slick/ /var/www/html/slick/
sudo cp -r archivos/httpd.conf /etc/httpd/conf/httpd.conf

sudo service httpd start
sudo systemctl enable httpd


#=================Agregar certificacion para HTTPS==================#
sudo cp archivos/ca.csr /etc/pki/tls/private/ca.csr
sudo cp archivos/ca.key /etc/pki/tls/private/ca.key
sudo cp archivos/ca.crt /etc/pki/tls/certs/ca.crt 

sudo chmod 600 /etc/pki/tls/certs/ca.crt
sudo chmod 600 /etc/pki/tls/private/ca.key
sudo chmod 600 /etc/pki/tls/private/ca.csr

sudo cp archivos/ssl.conf /etc/httpd/conf.d/ssl.conf
