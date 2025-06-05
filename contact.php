<?php
require_once 'vendor/autoload.php';

use Smarty\Smarty;

// Smartyのインスタンスを作成
$smarty = new Smarty();

// Smartyの設定
$smarty->setTemplateDir('templates/');
$smarty->setCompileDir('templates_c/');
$smarty->setCacheDir('cache/');

// フォーム処理
$message = '';
$messageType = '';
$formData = [
    'name' => '',
    'email' => '',
    'company' => '',
    'subject' => '',
    'message' => '',
    'budget' => '',
    'timeline' => ''
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // フォームデータを取得
    $formData['name'] = trim($_POST['name'] ?? '');
    $formData['email'] = trim($_POST['email'] ?? '');
    $formData['company'] = trim($_POST['company'] ?? '');
    $formData['subject'] = trim($_POST['subject'] ?? '');
    $formData['message'] = trim($_POST['message'] ?? '');
    $formData['budget'] = trim($_POST['budget'] ?? '');
    $formData['timeline'] = trim($_POST['timeline'] ?? '');

    // バリデーション
    $errors = [];

    if (empty($formData['name'])) {
        $errors[] = 'お名前を入力してください';
    }

    if (empty($formData['email'])) {
        $errors[] = 'メールアドレスを入力してください';
    } elseif (!filter_var($formData['email'], FILTER_VALIDATE_EMAIL)) {
        $errors[] = '正しいメールアドレスを入力してください';
    }

    if (empty($formData['subject'])) {
        $errors[] = '件名を入力してください';
    }

    if (empty($formData['message'])) {
        $errors[] = 'メッセージを入力してください';
    }

    if (empty($errors)) {
        // 実際のメール送信処理はここに実装
        // 今回はサンプルなので成功メッセージのみ表示
        $message = 'お問い合わせありがとうございます！担当者より24時間以内にご返信いたします。';
        $messageType = 'success';

        // ログに記録（実際の開発では適切なログ処理を実装）
        error_log("Contact form submitted: " . json_encode($formData));

        // フォームをクリア
        $formData = [
            'name' => '',
            'email' => '',
            'company' => '',
            'subject' => '',
            'message' => '',
            'budget' => '',
            'timeline' => ''
        ];
    } else {
        $message = 'エラー: ' . implode(', ', $errors);
        $messageType = 'error';
    }
}

// 会社情報
$contactInfo = [
    'company' => 'テックソリューション株式会社',
    'address' => '〒100-0001 東京都千代田区千代田1-1-1 テックビル5F',
    'phone' => '03-1234-5678',
    'email' => 'info@techsolution.co.jp',
    'hours' => '平日 9:00-18:00（土日祝日休み）',
    'map_url' => 'https://maps.google.com/'
];

$departments = [
    [
        'name' => '営業部',
        'email' => 'sales@techsolution.co.jp',
        'description' => '新規お問い合わせ、お見積もり、プロジェクト相談',
        'icon' => '💼'
    ],
    [
        'name' => '技術部',
        'email' => 'tech@techsolution.co.jp',
        'description' => '技術的なご相談、開発サポート、システム保守',
        'icon' => '⚙️'
    ],
    [
        'name' => '総務部',
        'email' => 'general@techsolution.co.jp',
        'description' => '採用関連、その他お問い合わせ',
        'icon' => '📋'
    ]
];

$faqs = [
    [
        'question' => '開発期間はどのくらいかかりますか？',
        'answer' => 'プロジェクトの規模により異なりますが、小規模なサイトで1-2ヶ月、中規模で3-6ヶ月程度です。詳細はお見積もり時にご相談ください。'
    ],
    [
        'question' => '保守・運用サポートはありますか？',
        'answer' => 'はい。開発後の保守・運用サポートも承っております。月額制のサポートプランをご用意しており、継続的なシステム運用をサポートします。'
    ],
    [
        'question' => 'Docker環境での開発のメリットは？',
        'answer' => '環境の統一、簡単なデプロイ、スケーラビリティの向上など、多くのメリットがあります。特に開発・本番環境の差異によるトラブルを防げます。'
    ],
    [
        'question' => 'PHP 8.4を使うメリットは？',
        'answer' => '最新のセキュリティ対応、パフォーマンス向上、新機能による開発効率化などが期待できます。長期的な保守性も向上します。'
    ],
    [
        'question' => 'リモート開発は可能ですか？',
        'answer' => 'はい、可能です。Docker環境により、リモートでも統一された開発環境で作業できます。オンライン会議ツールで密にコミュニケーションを取りながら進めます。'
    ]
];

// テンプレートに変数を割り当て
$smarty->assign('page_title', 'お問い合わせ');
$smarty->assign('current_page', 'contact');
$smarty->assign('message', $message);
$smarty->assign('messageType', $messageType);
$smarty->assign('formData', $formData);
$smarty->assign('contactInfo', $contactInfo);
$smarty->assign('departments', $departments);
$smarty->assign('faqs', $faqs);
$smarty->assign('php_version', PHP_VERSION);
$smarty->assign('smarty_version', Smarty::SMARTY_VERSION);

// テンプレートを表示
$smarty->display('contact.tpl');
?>