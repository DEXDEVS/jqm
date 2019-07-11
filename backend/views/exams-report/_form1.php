<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;
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

$courseName = Yii::$app->db->createCommand("SELECT course_name FROM std_course WHERE course_id = '$model->course_id'")->queryAll();
$courseName = $courseName[0]['course_name'];

?>

<div class="exams-report-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-4">
            <label>Class</label>
            <input type="text" class="form-control" value="<?php echo $className; ?>" readonly="">
        </div>
        <div class="col-md-4">
            <label>Student</label>
            <input type="text" class="form-control" value="<?php echo $stdName; ?>" readonly="">
        </div>
        <div class="col-md-4">
            <label>Course</label>
            <input type="text" class="form-control" value="<?php echo $courseName; ?>" readonly="">
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label>Para</label>
            <input type="text" class="form-control" value="<?php echo $paraName; ?>" readonly="">
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'start_date')->textInput(['readonly' => true, 'id' => 'startDate']) ?>
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
                        //'startDate' => date('1990-01-01'),
                        //'endDate' => date(''),
                        'todayBtn' => true
                    ],
                    'options' => ['id' => 'endDate',]
                ]);?> 
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'duration')->textInput(['id'=>'duration','readonly'=>true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'remarks')->textarea(['rows' => 6]) ?>
        </div>
    </div>

    <div class="row invisible">
        <div class="col-md-3">
            <?= $form->field($model, 'class_id')->hiddenInput() ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'std_id')->hiddenInput() ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'para_id')->hiddenInput() ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'course_id')->hiddenInput() ?>
        </div>
    </div>
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<?php
//$url = \yii\helpers\Url::to("exams-report/fetch-days-count");

$script = <<< JS

$('#endDate').on('change',function(){
   
    var endDate = $('#endDate').val();
    var startDate = $('#startDate').val();
    var firstDate = moment(startDate);
    var secondDate = moment(endDate);

    var days = Math.abs(firstDate.diff(secondDate,'days'));
   // alert(days+" days"); 
    $('#duration').val(days+" دن");
  
 });

JS;
$this->registerJs($script);
?>
</script> 

