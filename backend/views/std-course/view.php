<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdCourse */
?>
<div class="std-course-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'class_id',
            'class_name',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
