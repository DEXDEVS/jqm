<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Paraay */
?>
<div class="paraay-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
