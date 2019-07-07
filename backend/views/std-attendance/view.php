<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdAttendance */
?>
<div class="std-attendance-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_attend_id',
            'user_id',
            'class_name_id',
            'date',
            'std_id',
            'attendance',
            'created_by',
            'updated_by',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
