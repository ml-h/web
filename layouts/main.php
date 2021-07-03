<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use common\models\Comment;

AppAsset::register($this);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!--<script type="text/javascript" src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>　-->

    

    <?= Html::csrfMetaTags() ?>
    <!-- <title><?= Html::encode($this->title) ?></title> -->
    <title>夷陵老祖</title>
    <?php $this->head() ?>
</head>


<body style="background: url(Allbag.jpeg) no-repeat 0px 0px;
    background-size: 100% 100%;
    background-attachment: fixed;">

<?php $this->beginBody() ?>



<div class="wrap"  >
    <?php
    NavBar::begin([
        'brandLabel' => 'hlm的后台',

        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
    		['label' => '文章管理', 'url' => ['/post/index']],
            
    		['label' => '评论管理', 'url' => ['/comment/index']],
    		'<li><span class="badge">'.Comment::getPengdingCommentCount().'</span></li>',
    		['label' => '用户管理', 'url' => ['/user/index']],
    		['label' => '管理员', 'url' => ['/adminuser/index']],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => '登录', 'url' => ['/site/login']];
    } else {
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                '注销 (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Copyright 2020-<?= date('Y') ?> All Rights Reserved.</p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
