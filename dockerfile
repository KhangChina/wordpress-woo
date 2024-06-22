# Sử dụng WordPress image làm base image
FROM wordpress:latest

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Tải và cài đặt Composer
RUN wget https://getcomposer.org/installer -O composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php

# Thay đổi thư mục làm việc
WORKDIR /var/www/html

# Chạy Composer để cài đặt các dependency của WordPress
#RUN composer install

# Expose port
EXPOSE 80

# Start WordPress
CMD ["apache2-foreground"]