<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\PhoneBook */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="phone-book-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'contact_person')->textInput(['maxlength' => true]) ?>            
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'phone_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999']) ?> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>            
        </div>
    </div>

	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
