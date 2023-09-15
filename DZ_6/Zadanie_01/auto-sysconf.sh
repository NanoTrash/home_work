#!/bin/bash
# 1. Проверка на наличие репозитория Backports в списке репозиториев. Если
# отсутствует - добавляем (под используемый вами дистрибутив).
if grep -R "jammy-backports" /etc/apt/sources.list
then
    echo -n "Уже установлен!\n"
else
    echo "deb http://archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse" | sudo sh -c 'cat >> /etc/apt/sources.list'
    echo "Добавлен репозитрий!"
fi
# 2. Обновление пакетного менеджера.
sudo apt update
echo "Установлены обновления!\n"
# 3. Установка и запуск Apache2.
sudo apt install apache2 apache2-doc apache2-utils -y
apache2 -v
# 4. Установка Python.
if ! python3 --version 2>/dev/null
then
sudo apt install python3
python3 --version 
else
echo "Python уже установлен"
fi
# 5. Установка и поднятие SSH-сервера.
sudo apt install openssh-server -y
sudo systemctl start ssh