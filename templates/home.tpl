<!DOCTYPE html>
<html lang="ja">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$page_title} - TechSolution</title>
    <link rel="stylesheet" href="public/css/style.css">
  </head>

  <body>
    <!-- ナビゲーション -->
    <nav class="navbar">
      <div class="container">
        <div class="navbar-brand">
          <a href="index.php" class="brand-link">
            <span>🚀</span> TechSolution
          </a>
        </div>
        <ul class="navbar-nav">
          <li><a href="index.php" class="nav-link active"><span>🏠</span> ホーム</a></li>
          <li><a href="about.php" class="nav-link"><span>🏢</span> 会社概要</a></li>
          <li><a href="contact.php" class="nav-link"><span>📧</span> お問い合わせ</a></li>
          <li><button class="btn btn-outline" onclick="changeTheme()"><span id="themeIcon">🌙</span></button></li>
        </ul>
      </div>
    </nav>

    <!-- メインコンテンツ -->
    <main class="main-content">
      <!-- ヒーローセクション -->
      <section class="hero">
        <div class="container">
          <h1>PHP 8.4 + Smarty</h1>
          <p>最新技術でWebアプリケーション開発を革新</p>
          <a href="contact.php" class="btn">お問い合わせ</a>
        </div>
      </section>

      <div class="container">
        <!-- サービス紹介 -->
        <section>
          <div class="card">
            <h2>🛠️ 提供サービス</h2>
            <div class="services-grid">
              {foreach $services as $service}
              <div class="service-item">
                <span class="service-icon">{$service.icon}</span>
                <h3>{$service.title}</h3>
                <p>{$service.description}</p>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- 統計データ -->
        <section>
          <div class="card">
            <h2>📊 実績データ</h2>
            <div class="stats-grid">
              {foreach $stats as $stat}
              <div class="stat-item">
                <span class="stat-number">{$stat.value}</span>
                <div>{$stat.label}</div>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- 技術情報 -->
        <section>
          <div class="card">
            <h2>⚡ 技術スタック</h2>
            <p><strong>PHP バージョン:</strong> {$php_version}</p>
            <p><strong>Smarty バージョン:</strong> {$smarty_version}</p>
            <p><strong>環境:</strong> Docker コンテナ</p>
          </div>
        </section>
      </div>
    </main>

    <!-- フッター -->
    <footer class="footer">
      <div class="container">
        <div class="footer-bottom">
          <p>&copy; 2024 TechSolution. PHP {$php_version} + Smarty {$smarty_version} で構築</p>
        </div>
      </div>
    </footer>

    <script src="public/js/main.js"></script>
  </body>

</html>