<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\web\UploadedFile;
use dosamigos\datetimepicker\DateTimePicker;
use kartik\select2\Select2;
use common\models\StdPersonalInfo;
use common\models\StdClassName;
use common\models\StdSessions;
use common\models\Concession;
use common\models\StdSubjects;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model common\models\StdRegistration */
/* @var $form yii\widgets\ActiveForm */
?>
<html>
<head>
    <title></title>
     <style>
      * {
          color:#7F7F7F;
          font-family:Arial,sans-serif;
          font-size:12px;
          font-weight:normal;
      }    
      #config{
          overflow: auto;
          margin-bottom: 10px;
      }
      .config{
          float: left;
          width: 200px;
          height: 250px;
          border: 1px solid #000;
          margin-left: 10px;
      }
      .config .title{
          font-weight: bold;
          text-align: center;
      }
      .config .barcode2D,
      #miscCanvas{
        display: none;
      }
      #submit{
          clear: both;
      }
      #barcodeTarget {
        margin: 0px;
      }
      #canvasTarget{
        margin-top: 0px;
      }        
    </style>
</head>
<body>

<div class="std-registration-form">
<?php $form = ActiveForm::begin(); ?>
<?php 
    $branch_id = Yii::$app->user->identity->branch_id;
?>
<div class="row">
    <div class="col-lg-12">
        <!-- box start -->
        <div class="box box-primary">
            <div class="box-header">
                <h2 style="color: #001F3F;"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Student Registration Form / طالب علم  کا  دا خلہ  فارم</h2>
            </div>
            <div class="box-body">  
                <!-- Personal info start -->
            <h3 style="color: #3C8DBC; margin-top: -10px">
                <i class="fa fa-info-circle" aria-hidden="true" style="color: #001E3E;"></i>
                Personal Information / ذاتی معلومات <small> <i>( Fields with <span style="color: red;">red stars </span>are required )</i></small> 
            </h3>
            <div class="row">
                <div class="col-md-4">
                    <?= $form->field($model, 'stdInquiryNo')->textInput(['id' => 'inquiryNo']) ?>
                </div>
            </div> 
            <div class="row">
                <div class="col-md-4">
                    <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 170px; top: 4px"></i>
                    <?= $form->field($model, 'std_name')->textInput(['maxlength' => true,'id' => 'std_name', 'required'=> true]) ?>
                </div>
                <div class="col-md-4">
                   <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 235px; top: 4px"></i>
                    <?= $form->field($model, 'std_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', 'id' => 'std_contact_no']) ?>
                </div> 
                <div class="col-md-4">
                    <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 93px; top: 4px"></i>
                    <label>Student DOB</label>
                    <?= DateTimePicker::widget([
                        'model' => $model,
                        'attribute' => 'std_DOB',
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
            <div class="row">
              <div class="col-md-4">
                   <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 252px; top: 4px"></i>
                  <?= $form->field($model, 'std_father_name')->textInput(['maxlength' => true,'id' => 'std_father_name']) ?>
              </div> 
              <div class="col-md-4">
                <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 305px; top: 4px"></i>
                <?= $form->field($model, 'std_father_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', 'id' => 'std_father_contact_no']) ?>
              </div>  
              <div class="col-md-4">
                <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 300px; top: 4px"></i>
                <?= $form->field($model, 'std_father_cnic')->widget(yii\widgets\MaskedInput::class, ['mask' => '99999-9999999-9']) ?>
              </div>
            </div>  
            
            <div class="row">    
                <div class="col-md-4">
                    <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 90px; top: 4px"></i>
                    <?= $form->field($model, 'std_gender')->dropDownList
                    ([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => '','id' => 'std_gender']) ?>
                </div>
                <div class="col-md-4">
                    <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 120px; top: 6px"></i> -->
                    <?= $form->field($model, 'std_email')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-4">
                    <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 121px; top: 6px"></i> -->
                    <?= $form->field($model, 'std_photo')->fileInput() ?>
                </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                  <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 115px; top: 4px"></i>
                  <?= $form->field($model, 'std_nationality')->textInput(['maxlength' => true]) ?>
              </div>
              <div class="col-md-4">
                  <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 140px; top: 4px"></i> -->
                  <?= $form->field($model, 'std_b_form')->widget(yii\widgets\MaskedInput::class, ['options' => ['id' => 'stdBform', 'onchange' => 'generateBarcode();'], 'mask' => '99999-9999999-9']) ?>
              </div>
              <div class="col-md-4">
                  <?= $form->field($model, 'barcode')->hiddenInput(['id' => 'barcode_ID']) ?>
                  <div id="barcodeTarget" class="barcodeTarget"></div>
                  <canvas id="canvasTarget" width="210" height="90" style="border: none; margin: -20px 80px; position: absolute; left: 56px; top: 5px"></canvas>
              </div>
            </div>
             
            <div class="row">  
              <div class="col-md-4">
                  <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 87px; top: 4px"></i>
                  <?= $form->field($model, 'std_district')->textInput(['maxlength' => true]) ?>
              </div>
              <div class="col-md-4">
                  <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 100px; top: 4px"></i>
                  <?= $form->field($model, 'std_tehseel')->textInput(['maxlength' => true]) ?>
              </div>
              <div class="col-md-4">
                  <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 95px; top: 4px"></i>
                  <?= $form->field($model, 'std_religion')->textInput(['maxlength' => true]) ?>
              </div>   
            </div>
            <div class="row">
              <div class="col-md-4">
                <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 230px; top: 4px"></i>
                    <?= $form->field($model, 'std_residency')->dropDownList
                    ([ 'عکا متی' => 'عکا متی', 'غیر عکا متی' => 'غیر عکا متی']) ?>
              </div>
              <div class="col-md-4">
                    <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 180px; top: 6px"></i>
                    <?= $form->field($model, 'std_permanent_address')->textInput(['maxlength' => true, 'id' => 'std_permanent_address']) ?>
                </div>
              <div class="col-md-4">
                  <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 180px; top: 4px"></i> -->
                  
                    <?= $form->field($model, 'std_temporary_address')->textInput(['maxlength' => true, 'id' => 'std_temporary_address']) ?>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                  <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 180px; top: 4px"></i> -->
                  <label>Student Admission Date</label>
                    <?= DateTimePicker::widget([
                        'model' => $model,
                        'attribute' => 'std_admit_date',
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

              <div class="col-md-8">
                  <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 180px; top: 4px"></i> -->
                  <?= $form->field($model, 'std_other_info')->textInput() ?>
              </div>
            </div>
          <hr>
            <!-- Personal info close -->
            <!-- Academic Info -->
            <h3 style="color: #337AB7; margin-top: -10px">
                <i class="fa fa-info-circle" aria-hidden="true" style="color: #001F3F;"></i>
                Academic Information / تعلیمی معلومات
            </h3>
            <div class="row">
              <div class="col-md-4">
                <!-- <i class="fa fa-star" style="font-size: 8px; color: red; position: absolute; left: 172px; top: 6px"></i> -->
                <?= $form->field($stdAcademicInfo, 'class_name_id')->dropDownList(
                  ArrayHelper::map(StdClassName::find()->where(['delete_status'=>1 , 'status'=>'Active','branch_id'=> $branch_id])->all(),'class_name_id','class_name'),
                    ['prompt'=>'Select Class', 'id'=>'classId']
                )?>
              </div>
            </div>
            <hr>
            <!-- Academic Info end -->
            <div class="form-group">
                <?= Html::submitButton(' Save', ['class' => 'btn btn-success btn-flat']) ?>
                <a href="std-personal-info" class="btn btn-danger btn-flat">Back</a>
            </div>
            </div>
            <!-- box body close -->
        </div>
        <!-- box close -->
        </div>
    </div>  
</div>
<!-- form body close -->
    
    <?php ActiveForm::end(); ?>

</div>
</body>
</html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="jquery-barcode.js"></script>
<script type="text/javascript">
    // showNetMonthlyFee function...!
    function showNetAdmissionFee() {
        var value1 = document.getElementById('admissionFee').value;
        var value2 = document.getElementById('admissionFeeDiscount').value;
        document.getElementById('netAdmissionFee').value = value1 - value2 ;
    }

    function generateBarcode(){
        var value = $("#stdBform").val();
        var btype = 'codabar';
        var renderer = "canvas";
        
        var settings = {
          output:renderer,
          bgColor:'#FFFFFF',
          color:'#000000',
          barWidth:1,
          barHeight: 50,
          moduleSize:5 ,
          posX: 10,
          posY: 20,
          addQuietZone: 1,
          canvas:'canvas'
        };
        if ($("#rectangular").is(':checked') || $("#rectangular").attr('checked')){
          value = {code:value, rect: true};
        }
        if (renderer == 'canvas'){
          clearCanvas();
          $("#barcodeTarget").hide();
          $("#canvasTarget").show().barcode(value, btype, settings);
        } else {
          $("#canvasTarget").hide();
          $("#barcodeTarget").html("").show().barcode(value, btype, settings);
        }
      }
          
      function showConfig1D(){
        $('.config .barcode1D').show();
        $('.config .barcode2D').hide();
      }
      
      function showConfig2D(){
        $('.config .barcode1D').hide();
        $('.config .barcode2D').show();
      }
      
      function clearCanvas(){
        var canvas = $('#canvasTarget').get(0);
        var ctx = canvas.getContext('2d');
        ctx.lineWidth = 1;
        ctx.lineCap = 'butt';
        ctx.fillStyle = '#FFFFFF';
        ctx.strokeStyle  = '#000000';
        ctx.clearRect (0, 0, canvas.width, canvas.height);
        ctx.strokeRect (0, 0, canvas.width, canvas.height);
      }
      
      $(function(){
        $('input[name=btype]').click(function(){
          if ($(this).attr('id') == 'datamatrix') showConfig2D(); else showConfig1D();
        });
        $('input[name=renderer]').click(function(){
          if ($(this).attr('id') == 'canvas') $('#miscCanvas').show(); else $('#miscCanvas').hide();
        });
        generateBarcode();
      });

</script>