sudo yum install -y net-tools vim git epel-release python-pip tree mod_wsgi mysql-devel python-devel
sudo yum groupinstall 'Development Tools'
sudo pip install flask 
sudo pip install flask-mysqldb 
sudo pip install Flask-WTF
sudo pip install passlib

sudo yes | cp -r /vagrant/project /var/www/



# CREATE TABLE articles(     
#     id INT(11) AUTO_INCREMENT PRIMARY KEY,     
#     title VARCHAR(50),      
#     body VARCHAR(500),     
#     author VARCHAR(50),      
#     create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
WSGIScriptAlias / /var/www/project/application.wsgi

<VirtualHost *>
    ServerName www.servicios.com
    <Directory /var/www/project/>
        Order deny,allow
        Allow from all
    </Directory>
</VirtualHost>