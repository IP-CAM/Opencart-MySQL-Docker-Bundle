FROM ubuntu:latest

# Set noninteractive installation to avoid interactive timezone prompt
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install Apache, PHP, and required extensions
RUN set -eux; \
    apt-get update && apt-get install -y \
    apache2 \
    curl \
    libapache2-mod-php8.1 \
    php8.1 \
    php8.1-cli \
    php8.1-gd \
    php8.1-mbstring \
    php8.1-zip \
    php8.1-xml \
    php8.1-curl \
    php8.1-mysql \
    php8.1-intl \
    php8.1-opcache \
    php8.1-iconv \
    unzip \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Revert DEBIAN_FRONTEND environment variable back to its default state
ENV DEBIAN_FRONTEND=dialog

# Enable Apache mods
RUN set -eux; \
    a2enmod rewrite headers

# Download and configure OpenCart
RUN set -eux; \
    curl -o opencart.zip -SL https://www.opencart.ru/upload/opencart-4.0.2.3_ru.zip \
    && unzip opencart.zip -d /var/www/html/ \
    && mv /var/www/html/opencart-4.0.2.3/upload/* /var/www/html/ \
    && mv /var/www/html/config-dist.php /var/www/html/config.php \
    && mv /var/www/html/admin/config-dist.php /var/www/html/admin/config.php \
    && rm -rf /var/www/html/opencart-4.0.2.3 opencart.zip \
    && chown -R www-data:www-data /var/www/html \
    && rm /var/www/html/index.html  # Remove default Apache index.html \

# Copy Apache virtual host config
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

CMD ["apache2ctl", "-D", "FOREGROUND"]
