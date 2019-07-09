<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClassName;
use common\models\StdPersonalInfo;
use common\models\Paraay;
use kartik\date\DatePicker;
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
                ['prompt'=>'Select Class','id'=> 'classId']
            )?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'std_id')->dropDownList(
                ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                ['prompt'=>'Select Student','id'=>'stdent']
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
            <?= $form->field($model, 'start_date')->widget(DatePicker::classname(), [
                'options' => ['placeholder' => 'Enter start date'],
                'pluginOptions' => [
                    'format' => 'yyyy-mm-dd',
                    'autoclose'=>true
                ]
            ]); ?> 
        </div>
    </div>    
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
<?php
//$url = \yii\helpers\Url::to("exams-report/fetch-days-count");

$script = <<< JS

$('#classId').on('change',function(){
   var classId = $(this).val();
    $.get('./std-personal-info/get-student',{classId : classId},function(data){
        
        var data =  $.parseJSON(data);
        $('#stdent').empty();
        var options = '';
        $('#stdent').append("<option>"+"Select Student"+"</option>");
            for(var i=0; i<data.length; i++) { 
                options += '<option value="'+data[i].std_id+'">'+data[i].std_name+'</option>';
            }
            console.log(data);
        // Append to the html
        $('#stdent').append(options);
    });
  
 });

JS;
$this->registerJs($script);
?>
</script> 

