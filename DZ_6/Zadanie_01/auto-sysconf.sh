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
# К 5 обязательным действиям добавьте ещё 5 на ваше усмотрение.
# 6. Установка случайных обоев, опубликованных на reddit-канале wallpaper
wget -O - http://www.reddit.com/r/wallpaper |\
    grep -Eo 'http://i.imgur.com[^&]+jpg' |\
    shuf -n 1 |\
    xargs wget -O background.jpg
feh --bg-fill background.jpg
# 7. Установка FTP.
sudo apt install vsftpd -y
# 8. Установка RDP
sudo apt install xfce4 xfce4-goodies -y
sudo apt install xrdp -y
# 9. Установка Docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# 10. Установка Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
printf "Все установлено и настроено!\n"