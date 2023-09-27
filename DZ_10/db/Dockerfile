# Используется базовый образ MariaDB
FROM mariadb
# Добавляется метка для идентификации автора
LABEL Evgeny Kostenko
# Устанавливается пользователь root для выполнения последующих команд 
USER root
# Изменяются разрешения для каталога /var/lib/mysql
RUN chmod 755 /var/lib/mysql 
# Устанавливается переменная среды MYSQL_DATABASE со значением mifiib
ENV MYSQL_DATABASE=mifiib
# Копируется файл database.sql в каталог /docker-entrypoint-initdb.d/
COPY ./database.sql /docker-entrypoint-initdb.d/
