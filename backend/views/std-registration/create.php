<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\StdRegistration */

?>
<div class="std-registration-create">
    <?= $this->render('_form', [
        'model' => $model,
        'stdAcademicInfo' => $stdAcademicInfo,
    ]) ?>
</div>
