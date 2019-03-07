##nginx
##php
##mysql
##zabbix


yum install gcc make gd-devel libjpeg-devel libpng-devel bzip2-devel libcurl-devel -y
yum -y install zlib-devel glibc-devel curl curl-devel gcc automake
yum -y install net-snmp net-snmp-devel php-common php-devel perl-DBI php-gd php-xml php-bcmath fping OpenIPMI-devel php-mbstring
yum -y install php-xmlrpc php-mhash patch unzip   php php-mysql
yum -y install libidn-devel openssl-devel rpm-devel php-odbc php-pear unixODBC-devel
yum -y install httpd-devel java-devel wget unzip libxml2 libxml2-devel ncurses-devel
yum -y install unixODBC* libssh2-devel libevent-devel java-1.7.0-openjdk-devel  ntpdate



##PHP
tar -zxvf php-7.0.10.tar.gz
cd php-7.0.10
./configure --prefix=/home/zhang/php --with-config-file-path=/home/zhang/php-7.0.10/etc --with-bz2 --with-curl --enable-ftp --enable-sockets --disable-ipv6 --with-gd --with-jpeg-dir=/home/zhang --with-png-dir=/home/zhang --with-freetype-dir=/usr/local --enable-gd-native-ttf --with-iconv-dir=/home/zhang --enable-mbstring --enable-calendar --with-gettext --with-libxml-dir=/home/zhang --with-zlib --with-pdo-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-dom --enable-xml --enable-fpm --with-libdir=lib64 --enable-bcmath
make 
make install
cp php.ini-production /home/zhang/php-7.0.10/etc/php.ini
cp /home/zhang/php-7.0.10/etc/php-fpm.conf.default /home/zhang/php-7.0.10/etc/php-fpm.conf
cd /home/zhang/php-7.0.9/etc/php-fpm.d      
cp www.conf.default www.conf



##安装mysql
wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.21-linux-glibc2.12-x86_64.tar.gz
 tar -zxvf mysql-5.7.21-linux-glibc2.12-x86_64.tar.gz 
 mkdir mysql
 ln -s mysql-5.7.21-linux-glibc2.12-x86_64 mysql
 cd mysql
vi /home/2iuser/mysql/my.cnf
[client]   
port=3336  
socket=/home/2iuser/mysql/mysql.sock  
[mysqld]
port=3336
basedir=/home/2iuser/mysql
datadir=/home/2iuser/mysql/data
pid-file=/home/2iuser/mysql/mysql.pid
socket=/home/2iuser/mysql/mysql.sock
log_error=/home/2iuser/mysql/error.log
server-id=100
进入mysql目录，开始安装mysql。
bin/mysqld --defaults-file=/home/zhang/mysql/my.cnf --initialize --user=zhang --basedir=/home/zhang/mysql --datadir=/home/zhang/mysql/data
启动
./mysqld_safe --defaults-file=/home/zhang/mysql/my.cnf --user=zhang &

进入客户端 -S sock文件  或者 -h ip -p port 信息等
导入zabbix数据库文件
　　source /home/zabbix-3.0.4/database/mysql/schema.sql
　　source /home/zabbix-3.0.4/database/mysql/data.sql
　　source /home/zabbix-3.0.4/database/mysql/images.sql

安装zabbix
　　1.安装：
　　./configure --prefix=/usr/local/zabbix-3.0.4/ --enable-server --enable-agent --enable-proxy --with-mysql --with-net-snmp --with-libcurl --with-libxml2
　　make
　　make install
　　2.创建zabbix的用户组
　　groupadd zabbix
　　3.在zabbix用户组中创建zabbix用户
　　useradd -g zabbix zabbix
　　4.配置zabbix web管理界面
　　cp -r  /home/zabbix-3.0.4/frontends/php /data/zabbix
　　5.配置zabbix　
　　【1】vim /usr/local/zabbix-3.0.4/etc/zabbix_server.conf
　　配置以下内容：
　　DBName=zabbix
　　DBUser=root　　
　　DBPassword=root
　　DBPort=3306
　　【2】cd /data/zabbix/php/conf
　　cp zabbix.conf.php.example zabbix.conf.php
　　6.启动zabbix-server　
　　/usr/local/zabbix-3.0.4/sbin/zabbix_server


nginx代理php时候配置
  server {
        listen       18080;
        server_name  localhost;
        location ~* ^(.+\.php)(.*)$ {
            root   html;
	    expires -1s;
	    try_files $uri =404;
	    fastcgi_split_path_info ^(.+\.php)(.*)$;
	    include fastcgi_params;
	    fastcgi_param PATH_INFO $fastcgi_path_info;
	    fastcgi_index index.php;
	    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	    fastcgi_pass 192.168.245.128:9000;
        }


　1.【缺少组件，配置php.ini】
　　vim /usr/local/php-7.0.10/etc/php.ini
　　配置内容如下：
　　max_execution_time = 300
 　　memory_limit = 128M
 　　post_max_size = 16M
 　　upload_max_filesize = 2M
 　　max_input_time = 300
 　　date.timezone PRC
　　配置后需重新启动php-fpm

