<?php
require_once 'vendor/autoload.php';

use Smarty\Smarty;

// Smartyのインスタンスを作成
$smarty = new Smarty();

// Smartyの設定
$smarty->setTemplateDir('templates/');
$smarty->setCompileDir('templates_c/');
$smarty->setCacheDir('cache/');

// 必要なディレクトリを作成
$dirs = ['templates_c', 'cache'];
foreach ($dirs as $dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0755, true);
    }
}

// サンプルデータ
$services = [
    [
        'title' => 'Webアプリケーション開発',
        'description' => 'PHP 8.4とSmartyを使用した高性能なWebアプリケーション',
        'icon' => '🚀'
    ],
    [
        'title' => 'Docker環境構築',
        'description' => 'コンテナ技術を使用した統一された開発環境',
        'icon' => '🐳'
    ],
    [
        'title' => 'レスポンシブデザイン',
        'description' => 'モバイルファーストなWebデザインの実装',
        'icon' => '📱'
    ]
];

$stats = [
    ['label' => '開発プロジェクト', 'value' => 150],
    ['label' => '満足度', 'value' => 98],
    ['label' => '稼働年数', 'value' => 5],
    ['label' => 'チームメンバー', 'value' => 12]
];

// テンプレートに変数を割り当て
$smarty->assign('page_title', 'ホーム');
$smarty->assign('current_page', 'home');
$smarty->assign('services', $services);
$smarty->assign('stats', $stats);
$smarty->assign('php_version', PHP_VERSION);
$smarty->assign('smarty_version', Smarty::SMARTY_VERSION); // この行を追加

// テンプレートを表示
$smarty->display('home.tpl');
?>
