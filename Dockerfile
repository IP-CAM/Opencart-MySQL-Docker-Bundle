FROM php:8.0-apache

# Включаем модули Apache, необходимые для работы OpenCart
RUN a2enmod rewrite headers

# Устанавливаем необходимые пакеты и PHP-расширения
RUN apt-get update && apt-get install -y \
    curl \
    libcurl4-openssl-dev \
    libgd-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install pdo pdo_mysql # Устанавливаем и активируем расширения PDO и PDO MySQL

# Скачиваем OpenCart и распаковываем его
RUN curl -o opencart.zip -SL https://github.com/opencart/opencart/releases/download/4.0.2.3/opencart-4.0.2.3.zip \
    && unzip opencart.zip -d /var/www/html/ \
    && mv /var/www/html/opencart-4.0.2.3/upload/* /var/www/html/ \
    # Переименовываем config-dist.php в config.php для корневой директории и admin
    && mv /var/www/html/config-dist.php /var/www/html/config.php \
    && mv /var/www/html/admin/config-dist.php /var/www/html/admin/config.php \
    # Удаляем ненужные файлы
    && rm -rf /var/www/html/opencart-4.0.2.3 opencart.zip \
    && chown -R www-data:www-data /var/www/html

# Настройка виртуального хоста Apache для работы с OpenCart
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html



