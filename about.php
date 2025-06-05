<?php
require_once 'vendor/autoload.php';

use Smarty\Smarty;

// Smartyのインスタンスを作成
$smarty = new Smarty();

// Smartyの設定
$smarty->setTemplateDir('templates/');
$smarty->setCompileDir('templates_c/');
$smarty->setCacheDir('cache/');

// 会社概要データ
$company = [
    'name' => 'テックソリューション株式会社',
    'founded' => 2020,
    'employees' => 12,
    'mission' => '最新技術を活用して、お客様のビジネス課題を解決する',
    'vision' => 'テクノロジーで社会をより良く変える',
    'values' => ['革新性', '品質第一', 'チームワーク', '継続的学習']
];

$history = [
    ['year' => 2020, 'event' => '会社設立、PHP開発事業開始'],
    ['year' => 2021, 'event' => 'Docker環境構築サービス開始'],
    ['year' => 2022, 'event' => 'Smartyテンプレート開発に特化'],
    ['year' => 2023, 'event' => 'クラウドネイティブ開発サービス拡充'],
    ['year' => 2024, 'event' => 'PHP 8.4対応、チーム規模拡大']
];

$team = [
    [
        'name' => '山田 健太',
        'position' => 'CEO / リードエンジニア',
        'skills' => ['PHP', 'Docker', 'AWS', 'マネジメント'],
        'experience' => '10年',
        'description' => 'PHPエキスパートとして多数のプロジェクトを成功に導く',
        'avatar' => '👨‍💼'
    ],
    [
        'name' => '鈴木 美咲',
        'position' => 'フロントエンドエンジニア',
        'skills' => ['JavaScript', 'CSS', 'Smarty', 'UI/UX'],
        'experience' => '7年',
        'description' => 'ユーザー体験を重視したフロントエンド開発のスペシャリスト',
        'avatar' => '👩‍💻'
    ],
    [
        'name' => '高橋 雅也',
        'position' => 'DevOpsエンジニア',
        'skills' => ['Docker', 'Kubernetes', 'CI/CD', 'インフラ'],
        'experience' => '8年',
        'description' => 'インフラとデプロイメントの自動化エキスパート',
        'avatar' => '👨‍🔧'
    ],
    [
        'name' => '中村 あゆみ',
        'position' => 'バックエンドエンジニア',
        'skills' => ['PHP', 'MySQL', 'API設計', 'セキュリティ'],
        'experience' => '6年',
        'description' => 'セキュアで高性能なバックエンドシステムの構築が得意',
        'avatar' => '👩‍🔬'
    ]
];

$technologies = [
    ['name' => 'PHP', 'level' => 95, 'color' => '#777BB4'],
    ['name' => 'Smarty', 'level' => 90, 'color' => '#FF6B6B'],
    ['name' => 'Docker', 'level' => 88, 'color' => '#2496ED'],
    ['name' => 'JavaScript', 'level' => 85, 'color' => '#F7DF1E'],
    ['name' => 'MySQL', 'level' => 87, 'color' => '#4479A1'],
    ['name' => 'AWS', 'level' => 80, 'color' => '#FF9900']
];

$achievements = [
    ['icon' => '🏆', 'title' => 'ベストPHP開発賞', 'year' => 2023, 'description' => '革新的なPHP 8.4活用による業界表彰'],
    ['icon' => '🥇', 'title' => 'Docker優秀活用賞', 'year' => 2022, 'description' => 'コンテナ技術の効果的活用が評価'],
    ['icon' => '⭐', 'title' => '顧客満足度98%達成', 'year' => 2024, 'description' => '継続的な品質向上により高評価獲得'],
    ['icon' => '🚀', 'title' => 'スタートアップ支援150社', 'year' => 2024, 'description' => '多数の企業の成長をテクノロジーで支援']
];

// テンプレートに変数を割り当て
$smarty->assign('page_title', '会社概要');
$smarty->assign('current_page', 'about');
$smarty->assign('company', $company);
$smarty->assign('history', $history);
$smarty->assign('team', $team);
$smarty->assign('technologies', $technologies);
$smarty->assign('achievements', $achievements);
$smarty->assign('php_version', PHP_VERSION);
$smarty->assign('smarty_version', Smarty::SMARTY_VERSION);

// テンプレートを表示
$smarty->display('about.tpl');
?>