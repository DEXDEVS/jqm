<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\PhoneBook */
?>
<div class="phone-book-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'contact_person',
            'phone_no',
            'address',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
