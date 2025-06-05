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
          <li><a href="index.php" class="nav-link"><span>🏠</span> ホーム</a></li>
          <li><a href="about.php" class="nav-link"><span>🏢</span> 会社概要</a></li>
          <li><a href="contact.php" class="nav-link active"><span>📧</span> お問い合わせ</a></li>
          <li><button class="btn btn-outline" onclick="changeTheme()"><span id="themeIcon">🌙</span></button></li>
        </ul>
      </div>
    </nav>

    <!-- メインコンテンツ -->
    <main class="main-content">
      <section class="hero">
        <div class="container">
          <h1>📧 お問い合わせ</h1>
          <p>プロジェクトのご相談はお気軽にどうぞ</p>
        </div>
      </section>

      <div class="container">
        {if $message}
        <div class="alert alert-{$messageType}">
          {$message}
        </div>
        {/if}

        <!-- お問い合わせフォーム -->
        <section>
          <div class="card">
            <h2>📝 お問い合わせフォーム</h2>
            <form method="POST" action="contact.php">
              <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
                <div class="form-group">
                  <label class="form-label">お名前 *</label>
                  <input type="text" name="name" class="form-control" value="{$formData.name}" required>
                </div>
                <div class="form-group">
                  <label class="form-label">メールアドレス *</label>
                  <input type="email" name="email" class="form-control" value="{$formData.email}" required>
                </div>
              </div>
              <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
                <div class="form-group">
                  <label class="form-label">会社名</label>
                  <input type="text" name="company" class="form-control" value="{$formData.company}">
                </div>
                <div class="form-group">
                  <label class="form-label">件名 *</label>
                  <input type="text" name="subject" class="form-control" value="{$formData.subject}" required>
                </div>
              </div>
              <div class="form-group">
                <label class="form-label">メッセージ *</label>
                <textarea name="message" class="form-control" required>{$formData.message}</textarea>
              </div>
              <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn btn-success">📧 送信する</button>
              </div>
            </form>
          </div>
        </section>

        <!-- 部署別連絡先 -->
        <section>
          <div class="card">
            <h2>📞 部署別お問い合わせ</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; margin-top: 30px;">
              {foreach $departments as $dept}
              <div style="text-align: center; padding: 25px; background: #f8f9fa; border-radius: 12px;">
                <div style="font-size: 3rem; margin-bottom: 15px;">{$dept.icon}</div>
                <h3>{$dept.name}</h3>
                <p style="font-size: 14px; margin: 15px 0; color: #6c757d;">{$dept.description}</p>
                <a href="mailto:{$dept.email}" style="color: #007bff; font-weight: 600;">{$dept.email}</a>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- 会社情報 -->
        <section>
          <div class="card">
            <h2>🏢 会社情報</h2>
            <div style="margin-top: 30px;">
              <p><strong>会社名:</strong> {$contactInfo.company}</p>
              <p><strong>住所:</strong> {$contactInfo.address}</p>
              <p><strong>電話:</strong> {$contactInfo.phone}</p>
              <p><strong>メール:</strong> {$contactInfo.email}</p>
              <p><strong>営業時間:</strong> {$contactInfo.hours}</p>
            </div>
          </div>
        </section>

        <!-- FAQ -->
        <section>
          <div class="card">
            <h2>❓ よくあるご質問</h2>
            <div style="margin-top: 30px;">
              {foreach $faqs as $index => $faq}
              <div style="border-bottom: 1px solid #eee; padding: 20px 0;">
                <div style="cursor: pointer;" onclick="toggleFAQ({$index})">
                  <h3 style="margin: 0; color: #333;">{$faq.question} <span id="icon-{$index}">▼</span></h3>
                </div>
                <div id="answer-{$index}" style="display: none; margin-top: 15px; color: #6c757d;">
                  {$faq.answer}
                </div>
              </div>
              {/foreach}
            </div>
          </div>
        </section>
      </div>
    </main>

    <footer class="footer">
      <div class="container">
        <div class="footer-bottom">
          <p>&copy; 2024 TechSolution. PHP {$php_version} + Smarty {$smarty_version} で構築</p>
        </div>
      </div>
    </footer>

    <script src="public/js/main.js"></script>
    <script>
      // FAQ機能（修正版）
      function toggleFAQ(index) {
        var answer = document.getElementById('answer-' + index);
        var icon = document.getElementById('icon-' + index);

        if (answer.style.display === 'none') {
          answer.style.display = 'block';
          icon.textContent = '▲';
        } else {
          answer.style.display = 'none';
          icon.textContent = '▼';
        }
      }
    </script>
  </body>

</html>