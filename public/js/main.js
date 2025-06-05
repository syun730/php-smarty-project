// メインJavaScript
let currentTheme = "light";

// テーマ切り替え
function changeTheme() {
  const body = document.body;
  const themeIcon = document.getElementById("themeIcon");

  if (currentTheme === "light") {
    body.classList.add("dark-theme");
    currentTheme = "dark";
    if (themeIcon) themeIcon.textContent = "☀️";
    showNotification("🌙 ダークモードに切り替えました", "info");
  } else {
    body.classList.remove("dark-theme");
    currentTheme = "light";
    if (themeIcon) themeIcon.textContent = "🌙";
    showNotification("☀️ ライトモードに切り替えました", "info");
  }

  // テーマ設定を保存
  localStorage.setItem("theme", currentTheme);
}

// 通知表示
function showNotification(message, type = "info") {
  // 既存の通知を削除
  const existing = document.querySelector(".notification");
  if (existing) existing.remove();

  // 通知要素を作成
  const notification = document.createElement("div");
  notification.className = `notification notification-${type}`;
  notification.textContent = message;
  notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        background: ${
          type === "success"
            ? "#28a745"
            : type === "error"
            ? "#dc3545"
            : "#007bff"
        };
        color: white;
        border-radius: 8px;
        z-index: 1000;
        animation: slideInRight 0.3s ease-out;
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    `;

  document.body.appendChild(notification);

  // 3秒後に削除
  setTimeout(() => {
    notification.style.animation = "slideOutRight 0.3s ease-in";
    setTimeout(() => notification.remove(), 300);
  }, 3000);
}

// カウンター機能
let counter = 0;

function incrementCounter() {
  counter++;
  updateCounterDisplay();
  animateCounter("increment");
}

function decrementCounter() {
  counter--;
  updateCounterDisplay();
  animateCounter("decrement");
}

function resetCounter() {
  counter = 0;
  updateCounterDisplay();
  animateCounter("reset");
  showNotification("🔄 カウンターをリセットしました", "info");
}

function updateCounterDisplay() {
  const counterElement = document.getElementById("counter");
  if (counterElement) {
    counterElement.textContent = counter;

    // カウンターの色を値に応じて変更
    if (counter > 0) {
      counterElement.style.color = "#28a745";
    } else if (counter < 0) {
      counterElement.style.color = "#dc3545";
    } else {
      counterElement.style.color = "#007bff";
    }
  }
}

function animateCounter(type) {
  const counterElement = document.getElementById("counter");
  if (!counterElement) return;

  switch (type) {
    case "increment":
      counterElement.style.animation = "bounce 0.6s ease-out";
      break;
    case "decrement":
      counterElement.style.animation = "shake 0.6s ease-out";
      break;
    case "reset":
      counterElement.style.animation = "pulse 0.8s ease-out";
      break;
  }

  setTimeout(() => {
    counterElement.style.animation = "";
  }, 800);
}

// 統計アニメーション
function animateStats() {
  const statNumbers = document.querySelectorAll(".stat-number");

  statNumbers.forEach((element, index) => {
    const originalText = element.textContent;
    const targetNumber = parseInt(originalText.replace(/\D/g, ""));

    if (isNaN(targetNumber)) return;

    // アニメーション開始
    element.style.transform = "scale(1.2)";
    element.style.color = "#ff6b6b";

    // カウントアップアニメーション
    animateNumber(element, 0, targetNumber, 1000, originalText);

    // 元のスタイルに戻す
    setTimeout(() => {
      element.style.transform = "scale(1)";
      element.style.color = "";
    }, 1000 + index * 200);
  });

  showNotification("📊 統計データをアニメーション表示しました", "success");
}

// 数値アニメーション
function animateNumber(element, start, end, duration, originalText) {
  const startTime = performance.now();

  function updateNumber(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);

    // イージング関数
    const easeProgress = 1 - Math.pow(1 - progress, 3);
    const currentNumber = Math.floor(start + (end - start) * easeProgress);

    element.textContent = currentNumber.toLocaleString();

    if (progress < 1) {
      requestAnimationFrame(updateNumber);
    } else {
      element.textContent = originalText;
    }
  }

  requestAnimationFrame(updateNumber);
}

// フォームバリデーション
function validateForm(formElement) {
  const inputs = formElement.querySelectorAll(".form-control");
  let isValid = true;

  inputs.forEach((input) => {
    const value = input.value.trim();

    // 既存のエラーメッセージを削除
    const existingError = input.parentNode.querySelector(".error-message");
    if (existingError) existingError.remove();

    // バリデーション
    if (input.hasAttribute("required") && !value) {
      showFieldError(input, "この項目は必須です");
      isValid = false;
    } else if (input.type === "email" && value && !isValidEmail(value)) {
      showFieldError(input, "正しいメールアドレスを入力してください");
      isValid = false;
    }
  });

  return isValid;
}

function showFieldError(input, message) {
  const errorDiv = document.createElement("div");
  errorDiv.className = "error-message";
  errorDiv.textContent = message;
  errorDiv.style.cssText = "color: #dc3545; font-size: 14px; margin-top: 5px;";
  input.parentNode.appendChild(errorDiv);
  input.style.borderColor = "#dc3545";
}

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

// ページ読み込み時の処理
document.addEventListener("DOMContentLoaded", function () {
  // 保存されたテーマを復元
  const savedTheme = localStorage.getItem("theme");
  if (savedTheme === "dark") {
    document.body.classList.add("dark-theme");
    currentTheme = "dark";
    const themeIcon = document.getElementById("themeIcon");
    if (themeIcon) themeIcon.textContent = "☀️";
  }

  // カードのフェードイン
  const cards = document.querySelectorAll(".card");
  cards.forEach((card, index) => {
    setTimeout(() => {
      card.classList.add("fade-in");
    }, index * 100);
  });

  // フォームイベントリスナー
  const forms = document.querySelectorAll("form");
  forms.forEach((form) => {
    form.addEventListener("submit", function (e) {
      if (!validateForm(form)) {
        e.preventDefault();
        showNotification("入力内容を確認してください", "error");
      }
    });
  });

  // 統計項目クリックイベント
  const statItems = document.querySelectorAll(".stat-item");
  statItems.forEach((item) => {
    item.addEventListener("click", function () {
      this.style.animation = "pulse 0.6s ease-out";
      setTimeout(() => {
        this.style.animation = "";
      }, 600);
    });
  });

  console.log("🚀 PHP 8.4 + Smarty サイトが読み込まれました！");
});

// CSS追加のためのスタイル追加
const additionalStyles = `
@keyframes slideInRight {
    from { opacity: 0; transform: translateX(100%); }
    to { opacity: 1; transform: translateX(0); }
}

@keyframes slideOutRight {
    from { opacity: 1; transform: translateX(0); }
    to { opacity: 0; transform: translateX(100%); }
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
    40% { transform: translateY(-10px); }
    60% { transform: translateY(-5px); }
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
    20%, 40%, 60%, 80% { transform: translateX(5px); }
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}
`;

// 動的スタイル追加
if (!document.getElementById("additional-styles")) {
  const styleSheet = document.createElement("style");
  styleSheet.id = "additional-styles";
  styleSheet.textContent = additionalStyles;
  document.head.appendChild(styleSheet);
}
