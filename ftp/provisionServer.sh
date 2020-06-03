sudo yum install -y net-tools vim git vsftpd
sudo service vsftpd start
touch archivo_servidor.txt

git config --global user.name groloboy
git config --global user.email groloboy@gmail.com
git init test
cd test
touch prueba.txt
git add prueba.txt
git commit -m "Primer commit"





