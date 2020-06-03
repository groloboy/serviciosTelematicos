sudo yum -y install dhcp syslinux tftp-server nfs-utils vim

sudo cp archivos/dhcpd.conf /etc/dhcp/dhcpd.conf 

wget https://buildlogs.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1609-99.iso

sudo mount -o loop CentOS-7-x86_64-Minimal-1609-99.iso /mnt
sudo mkdir /var/lib/tftpboot/centos7 
sudo cp /mnt/images/pxeboot/{vmlinuz,initrd.img} /var/lib/tftpboot/centos7

sudo mkdir --parents /images/CentOS-1609
sudo cp -r /mnt/* /images/CentOS-1609 
sudo chmod -R 755 /images/CentOS-1609 
sudo umount /mnt
sudo cp archivo/exports /etc/exports 

sudo cp -r /usr/share/syslinux/* /var/lib/tftpboot 
sudo mkdir /var/lib/tftpboot/pxelinux.cfg/ 
sudo cp archivos/default /var/lib/tftpboot/pxelinux.cfg/default
sudo chmod 664 /var/lib/tftpboot/pxelinux.cfg/default

sudo systemctl restart dhcpd.service  
sudo systemctl restart nfs.service  
sudo systemctl start firewalld
sudo systemctl enable dhcpd.service  
sudo systemctl enable nfs.service  
sudo systemctl enable tftp 
sudo systemctl enable firewalld
sudo firewall-cmd --add-service={dhcp,nfs,tftp} --permanent  
sudo firewall-cmd --add-port=20048/tcp --permanent  
sudo firewall-cmd --reload  
