<!DOCTYPE html>
<html lang="ja">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$page_title} - TechSolution</title>
    <meta name="description" content="テックソリューション株式会社の会社概要、チーム紹介、技術スタック">
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
          <li><a href="about.php" class="nav-link active"><span>🏢</span> 会社概要</a></li>
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
          <h1>🏢 会社概要</h1>
          <p>テクノロジーで未来を創造する企業</p>
        </div>
      </section>

      <div class="container">
        <!-- 会社情報 -->
        <section>
          <div class="card">
            <h2>🌟 企業概要</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; margin-top: 30px;">
              <div>
                <h3>📍 会社名</h3>
                <p>{$company.name}</p>

                <h3 style="margin-top: 20px;">📅 設立年</h3>
                <p>{$company.founded}年</p>

                <h3 style="margin-top: 20px;">👥 従業員数</h3>
                <p>{$company.employees}名</p>
              </div>
              <div>
                <h3>🎯 ミッション</h3>
                <p>{$company.mission}</p>

                <h3 style="margin-top: 20px;">🔮 ビジョン</h3>
                <p>{$company.vision}</p>

                <h3 style="margin-top: 20px;">⭐ 価値観</h3>
                <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
                  {foreach $company.values as $value}
                  <span style="background: #007bff; color: white; padding: 6px 12px; border-radius: 20px; font-size: 14px;">{$value}</span>
                  {/foreach}
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- 会社の歴史 -->
        <section>
          <div class="card">
            <h2>📅 会社の歩み</h2>
            <div style="margin-top: 30px;">
              {foreach $history as $item}
              <div style="display: flex; align-items: center; padding: 15px 0; border-bottom: 1px solid #eee;">
                <div style="background: #007bff; color: white; padding: 8px 15px; border-radius: 20px; font-weight: bold; margin-right: 20px; min-width: 60px; text-align: center;">
                  {$item.year}
                </div>
                <div style="flex: 1;">
                  {$item.event}
                </div>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- チーム紹介 -->
        <section>
          <div class="card">
            <h2>👥 チーム紹介</h2>
            <div class="team-grid">
              {foreach $team as $member}
              <div class="team-member">
                <div class="member-avatar">
                  {$member.avatar}
                </div>
                <h3>{$member.name}</h3>
                <div style="color: #007bff; font-weight: 600; margin-bottom: 10px;">{$member.position}</div>
                <p style="font-size: 14px; margin-bottom: 15px;">{$member.description}</p>
                <div style="margin-bottom: 15px;">
                  <strong>経験年数:</strong> {$member.experience}
                </div>
                <div>
                  <strong>スキル:</strong><br>
                  <div style="display: flex; flex-wrap: wrap; gap: 5px; margin-top: 8px;">
                    {foreach $member.skills as $skill}
                    <span style="background: #f8f9fa; border: 1px solid #dee2e6; padding: 4px 8px; border-radius: 12px; font-size: 12px;">{$skill}</span>
                    {/foreach}
                  </div>
                </div>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- 技術スタック -->
        <section>
          <div class="card">
            <h2>💻 技術スタック</h2>
            <div style="margin-top: 30px;">
              {foreach $technologies as $tech}
              <div style="margin-bottom: 25px;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
                  <span style="font-weight: 600;">{$tech.name}</span>
                  <span style="color: #6c757d;">{$tech.level}%</span>
                </div>
                <div style="background: #e9ecef; height: 8px; border-radius: 4px; overflow: hidden;">
                  <div style="background: {$tech.color}; height: 100%; width: {$tech.level}%; border-radius: 4px; transition: width 2s ease;"></div>
                </div>
              </div>
              {/foreach}
            </div>
            <div style="text-align: center; margin-top: 30px;">
              <button class="btn" onclick="animateTechSkills()">📊 スキルアニメーション</button>
            </div>
          </div>
        </section>

        <!-- 実績・受賞 -->
        <section>
          <div class="card">
            <h2>🏆 実績・受賞歴</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; margin-top: 30px;">
              {foreach $achievements as $achievement}
              <div style="text-align: center; padding: 25px; background: #f8f9fa; border-radius: 12px; border: 2px solid transparent; transition: all 0.3s ease;" onmouseover="this.style.borderColor='#007bff'; this.style.transform='translateY(-5px)'" onmouseout="this.style.borderColor='transparent'; this.style.transform='translateY(0)'">
                <div style="font-size: 3rem; margin-bottom: 15px;">{$achievement.icon}</div>
                <h3 style="margin-bottom: 10px; color: #333;">{$achievement.title}</h3>
                <div style="color: #007bff; font-weight: bold; margin-bottom: 10px;">{$achievement.year}</div>
                <p style="font-size: 14px; color: #6c757d;">{$achievement.description}</p>
              </div>
              {/foreach}
            </div>
          </div>
        </section>

        <!-- お問い合わせCTA -->
        <section>
          <div class="card" style="text-align: center; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">
            <h2 style="color: white; margin-bottom: 20px;">🤝 一緒にプロジェクトを始めませんか？</h2>
            <p style="margin-bottom: 30px; font-size: 1.1rem;">
              私たちのチームがあなたのビジネスを成功に導きます。<br>
              まずはお気軽にお問い合わせください。
            </p>
            <a href="contact.php" class="btn" style="background: white; color: #667eea; font-weight: bold;">
              📧 お問い合わせ
            </a>
          </div>
        </section>
      </div>
    </main>

    <!-- フッター -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section">
            <h3><span>🚀</span> TechSolution</h3>
            <p>PHP 8.4とSmartyを使用した高品質なWebアプリケーション開発会社です。</p>
          </div>
          <div class="footer-section">
            <h3>会社情報</h3>
            <ul class="footer-links">
              <li><a href="about.php">会社概要</a></li>
              <li><a href="about.php">チーム紹介</a></li>
              <li><a href="contact.php">お問い合わせ</a></li>
            </ul>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; 2024 TechSolution. PHP {$php_version} + Smarty {$smarty_version} で構築</p>
        </div>
      </div>
    </footer>

    <script src="public/js/main.js"></script>
    <script>
      // 技術スキルアニメーション
      function animateTechSkills() {
        const skillBars = document.querySelectorAll('[style*="width:"][style*="%"]');
        skillBars.forEach((bar, index) => {
          setTimeout(() => {
            bar.style.width = '0%';
            setTimeout(() => {
              const originalWidth = bar.style.width;
              const match = bar.getAttribute('style').match(/width:\s*(\d+)%/);
              if (match) {
                bar.style.width = match[1] + '%';
              }
            }, 100);
          }, index * 100);
        });
        showNotification('📊 技術スキルをアニメーション表示しました！', 'success');
      }
    </script>
  </body>

</html>