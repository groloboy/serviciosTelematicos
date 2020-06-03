sudo yum install -y mod_ssl dovecot telnet telnet-server sendmail sendmail-cf net-tools vim git vsftpd

sudo cp archivos/vsftpd.conf /etc/vsftpd/vsftpd.conf

sudo service vsftpd start
sudo cp archivos/sendmail.mc /etc/mail/sendmail.mc
sudo cp archivos/local-host-names /etc/mail/local-host-names
sudo cp archivos/host /etc/host

sudo cp archivos/access /etc/mail/access

makemap hash /etc/mail/access.db < /etc/mail/access
m4 sendmail.mc > sendmail.cf
hostnamectl set-hostname servidor2.valkysoft.com
service sendmail start


sudo cp archivos/dovecot.conf /etc/dovecot/dovecot.conf
sudo cp archivos/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
sudo cp archivos/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
sudo cp archivos/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf

service dovecot start

sudo cp archivos/ca.csr /etc/pki/tls/private/ca.csr
sudo cp archivos/ca.key /etc/pki/tls/private/ca.key
sudo cp archivos/ca.crt /etc/pki/tls/certs/ca.crt 

sudo chmod 600 /etc/pki/tls/certs/ca.crt
sudo chmod 600 /etc/pki/tls/private/ca.key
sudo chmod 600 /etc/pki/tls/private/ca.csr

