# Используется базовый образ PHP 8.2 с веб-сервером Apache
FROM php:8.2-apache
# Добавляется метка для идентификации автора
LABEL Evgeny Kostenko
# Обновление пакетов и установка зависимостей libyaml-dev
RUN apt-get update && \
    apt-get install -y libyaml-dev && \
    # Удаление временных файлов после установки
    rm -rf /var/lib/apt/lists/*
# Установка YAML расширений
RUN pecl install yaml && \
    # Включение расширения YAML для PHP
    docker-php-ext-enable yaml
# Установка MySQL расширений
RUN docker-php-ext-install mysqli pdo pdo_mysql
# Копирование файлов index.php, mifiib-secret.yaml и mifiib-config.yaml в директорию /var/www/html
COPY index.php /var/www/html/index.php
COPY mifiib-secret.yaml /var/www/html/mifiib-secret.yaml
COPY mifiib-config.yaml /var/www/html/mifiib-config.yaml
# Настройка прав на директорию
RUN chown -R www-data:www-data /var/www/html