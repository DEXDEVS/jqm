<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClassName;
use common\models\StdPersonalInfo;
use common\models\Paraay;
use dosamigos\datetimepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\ExamsReport */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="exams-report-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'class_id')->dropDownList(
                ArrayHelper::map(StdClassName::find()->all(),'class_name_id','class_name'),
                ['prompt'=>'Select Class',]
            )?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'std_id')->dropDownList(
                ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                ['prompt'=>'Select Student',]
            )?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'para_id')->dropDownList(
                ArrayHelper::map(Paraay::find()->all(),'id','name'),
                ['prompt'=>'Select Paraa',]
            )?>
        </div>
        <div class="col-md-6">  
            <label>Start Date</label>
            <?= DateTimePicker::widget([
                'model' => $model,
                'attribute' => 'start_date',
                'language' => 'en',
                'size' => 'ms',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'yyyy-mm-dd',
                    'startDate' => date('2000-01-01'),
                    'endDate' => date(''),
                    'todayBtn' => true
                ]
            ]);?>     
        </div>
    </div>    
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
