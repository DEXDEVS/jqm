<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClassName;
use common\models\StdPersonalInfo;
use common\models\Paraay;
use common\models\StdCourse;
use kartik\date\DatePicker;
use dosamigos\datetimepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\ExamsReport */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="exams-report-form">

    <?php $form = ActiveForm::begin(['id'=>$model->formName()]); ?>
    
    <?php  
        if (isset($_GET['std_id']) && (isset($_GET['class_id']))) { 
            $stdID = $_GET['std_id'];
            $classID = $_GET['class_id'];      

            $student = Yii::$app->db->createCommand("SELECT std_name FROM std_personal_info WHERE std_id = '$stdID'")->queryAll();
            $stdName = $student[0]['std_name'];

            $class = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classID'")->queryAll();

            $className = $class[0]['class_name'];
    ?>
    <div class="row" style="margin-top: -30px">
        <div class="col-md-12">
            <h1 class="well well-sm text-center bg-navy" style="font-family: serif;">Create Exams Report</h1>
        </div>
    </div>
            <div class="row">
                <div class="col-md-6">
                    <label>Class</label>
                    <input type="text" value="<?php echo $className; ?>" readonly class="form-control" id="classId">
                </div>
                <div class="col-md-6">
                    <label>Student</label>
                    <input type="text" value="<?php echo $stdName; ?>" readonly class="form-control" id="stdId">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'para_id')->dropDownList(
                        ArrayHelper::map(Paraay::find()->all(),'id','name'),
                        ['prompt'=>'Select Paraa','id'=>'paraa']
                    )?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'course_id')->dropDownList(
                        ArrayHelper::map(StdCourse::find()->all(),'course_id','course_name'),
                        ['prompt'=>'Select Course','id'=>'course']
                    )?>
                </div>
            </div>
            <div class="row">
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

            <br>

            <?php if (!Yii::$app->request->isAjax){ ?>
                <div class="form-group">
                    <?= Html::submitButton($model->isNewRecord ? 'Save' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success btn-flat' : 'btn btn-primary']) ?>
                </div>
            <?php } ?>
            
            <div class="row invisible">
                <div class="col-md-6">
                    <?= $form->field($model, 'class_id')->textInput(['value'=> $classID]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'std_id')->textInput(['value'=> $stdID]) ?>
                </div>
            </div>

    <?php } else { ?>

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
                ['prompt'=>'Select Paraa','id'=>'paraa']
            )?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'course_id')->dropDownList(
                ArrayHelper::map(StdCourse::find()->all(),'course_id','course_name'),
                ['prompt'=>'Select Course','id'=>'course']
            )?>
        </div>
    </div>
    <div class="row">
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
                        //'startDate' => date('1990-01-01'),
                        //'endDate' => date(''),
                        'todayBtn' => true
                    ],
                    'options' => ['id' => 'endDate',]
                ]);?> 
        </div>
    </div>    

    
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
<?php
//$url = \yii\helpers\Url::to("exams-report/fetch-days-count");

$script = <<< JS

$('#course').on('change',function(){
   var course = $(this).val();
   var paraa = $('#paraa').val();
   var stdId = $('#stdId').val();
   
    $.get('./exams-report/get-record',{course : course, paraa: paraa, stdId: stdId},function(data){
        
        var data =  $.parseJSON(data);
        //console.log(data);
            if( !$.isArray(data) ||  !data.length ){
                alert("Record not Found.!");
            } else {
                alert("Student Already Registered in this Paraa and Course.!");
            }
    });
  
 });


JS;
$this->registerJs($script);
?>
</script> 

