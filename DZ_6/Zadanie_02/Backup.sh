#!/bin/bash

# Напишите Bash-скрипт для резервного копирования директории /home,
# конфигурационных файлов основных утилит удалённого доступа (SSH, RDP, FTP), a
# также директории /var/log.

# Backup HOME
tar cpf /archive/home-backup-$(date '+%d.%B.%Y_%H:%M').tar -C / home

# Backup SSH Config File
tar cpf /archive/ssh-backup-$(date '+%d.%B.%Y_%H:%M').tar -C / etc/ssh/sshd_config

# Backup RDP Config File
sudo tar cpf /archive/xrdp-backup-$(date '+%d.%B.%Y_%H:%M').tar -C / etc/xrdp/xrdp.ini

# Backup FTP Config file
sudo tar cpf /archive/vsftpd-backup-$(date '+%d.%B.%Y_%H:%M').tar -C / etc/vsftpd.conf

# Backup /var/log dir
sudo tar cpf /archive/varlog-backup-$(date '+%d.%B.%Y_%H:%M').tar -C / var/log