# PHP 8.4とApacheを使用
FROM php:8.4-apache

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
  git \
  unzip \
  libzip-dev \
  && docker-php-ext-install zip \
  && rm -rf /var/lib/apt/lists/*

# Composerをインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Apacheの設定を調整
RUN a2enmod rewrite

# 作業ディレクトリを設定
WORKDIR /var/www/html

# composer.jsonをコピー
COPY composer.json composer.lock* ./

# 依存関係をインストール
RUN composer install --no-dev --optimize-autoloader

# アプリケーションファイルをコピー
COPY . .

# 権限を設定
RUN chown -R www-data:www-data /var/www/html \
  && chmod -R 755 /var/www/html \
  && chmod -R 777 templates_c cache

# ポート80を公開
EXPOSE 80