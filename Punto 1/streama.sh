sed -i 's/SELINUX=permissive/SELINUX=disabled/g' /etc/selinux/config
yum install -y net-tools vim 
yum install -y rpm-build gcc gcc-c++ redhat-rpm-config
yum -y install jpackage-utils
cd /vagrant
rpm -ivh jre-8u251-linux-x64.rpm
cd /home/vagrant
wget https://github.com/dularion/streama/releases/download/v1.1/streama-1.1.war
mkdir /opt/streama
mv streama-1.1.war /opt/streama/streama.war
java -jar /opt/streama/streama.war
mkdir /opt/streama/media
chmod 664 /opt/streama/media
cp /vagrant/files/streama.service /etc/systemd/system/streama.service
systemctl start streama
systemctl enable streama