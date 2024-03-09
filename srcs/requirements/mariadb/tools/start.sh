mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod 777 /var/run/mysqld

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ] 
then
    echo "Database already exists"
else
mysql_install_db
service mariadb start
#This includes setting the root password, removing anonymous users, disallowing root login remotely, and removing the test database.
mysql_secure_installation << EOF

n
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
EOF
#Create the database and user
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
sleep 5
service mariadb stop
fi
# Replace current shell process to mysqld_safe and accept connections from all
exec mysqld_safe --bind-address=0.0.0.0
#if the exit status is diferent than 0, the container should keep running by using the command "tail -f /dev/null"
