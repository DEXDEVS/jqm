<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datetimepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\ExamsReport */
/* @var $form yii\widgets\ActiveForm */
$className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$model->class_id'")->queryAll();
$className = $className[0]['class_name'];
//
$stdName = Yii::$app->db->createCommand("SELECT std_name FROM std_personal_info WHERE std_id = '$model->std_id'")->queryAll();
$stdName = $stdName[0]['std_name'];
//
$paraName = Yii::$app->db->createCommand("SELECT name FROM paraay WHERE id = '$model->para_id'")->queryAll();
$paraName = $paraName[0]['name'];

?>

<div class="exams-report-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <label>Class</label>
            <input type="text" class="form-control" value="<?php echo $className; ?>">
        </div>
        <div class="col-md-6">
            <label>Student</label>
            <input type="text" class="form-control" value="<?php echo $stdName; ?>">
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label>Para</label>
            <input type="text" class="form-control" value="<?php echo $paraName; ?>">
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'start_date')->textInput(['readonly' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label>End Date</label>
            <?= DateTimePicker::widget([
                'model' => $model,
                'attribute' => 'end_date',
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
        <div class="col-md-6">
            <?= $form->field($model, 'duration')->textInput() ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'remarks')->textarea(['rows' => 6]) ?>
        </div>
    </div>

    <div class="row invisible">
        <div class="col-md-4">
            <?= $form->field($model, 'class_id')->hiddenInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_id')->hiddenInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'para_id')->hiddenInput() ?>
        </div>
    </div>
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
