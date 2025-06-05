# 🚀 PHP 8.4 + Smarty + Docker サンプルサイト

PHP 8.4 と Smarty 5.0 を使用したモダンな Web アプリケーションのサンプルプロジェクトです。

## ⚡ 3 分で起動

```bash
# 1. リポジトリをクローン
git clone <your-repository-url>
cd php-smarty-project

# 2. Docker環境をビルド
docker-compose build

# 3. 依存関係をインストール
docker-compose run --rm web composer install

# 4. 権限を設定
chmod -R 755 templates_c cache

# 5. 起動
docker-compose up -d
```
