<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdRegistration */
?>
<div class="std-registration-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_id',
            'branch_id',
            'std_reg_no',
            'std_name',
            'std_father_name',
            'std_father_contact_no',
            'std_father_cnic',
            'std_contact_no',
            'std_DOB',
            'std_gender',
            'std_residency',
            'std_permanent_address',
            'std_temporary_address',
            'std_email:email',
            'std_photo',
            'std_b_form',
            'std_district',
            'std_religion',
            'std_nationality',
            'std_tehseel',
            'std_password',
            'status',
            'academic_status',
            'barcode',
            'std_other_info:ntext',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
            'delete_status',
        ],
    ]) ?>

</div>
