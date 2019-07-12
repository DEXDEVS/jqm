<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<?php  
  use yii\helpers\Html;
  use yii\bootstrap\Modal;
  use common\models\StdPersonalInfo;

    $id = $_GET['id'];
    // Stduent Personal Info..... 
    $stdPersonalInfo = Yii::$app->db->createCommand("SELECT * FROM std_personal_info WHERE std_id = '$id'")->queryAll();
    $number =  $stdPersonalInfo[0]['std_contact_no'];
    $barcode =  $stdPersonalInfo[0]['barcode'];
    $classID =  $stdPersonalInfo[0]['class_id'];
    // Student Photo...
    $photo = $stdPersonalInfo[0]['std_photo'];

    if (!$stdPersonalInfo[0]['std_leave_date']) {
      $stdLeaveDate = $stdPersonalInfo[0]['std_leave_date'];
    }
    else{
      $stdLeaveDate = date('d-m-Y', strtotime($stdPersonalInfo[0]['std_leave_date']));
    }
    
    // Stduent Academic Info..... 
    $stdAcademicInfo = Yii::$app->db->createCommand("SELECT * FROM std_academic_info WHERE std_id = '$id'")->queryAll();
    if (!empty($stdAcademicInfo)) {
      $stdAcademicId = $stdAcademicInfo[0]['academic_id'];
      $stdAcademicClass = $stdAcademicInfo[0]['class_name_id'];  
      $stdSubjectID = $stdAcademicInfo[0]['subject_combination'];
      
      $stdSubject = Yii::$app->db->createCommand("SELECT std_subject_name FROM std_subjects WHERE std_subject_id = '$stdSubjectID'")->queryAll();
      if (!empty($stdSubject)) {
        $stdSubjects = $stdSubject[0]['std_subject_name'];
      }
      //var_dump($stdSubjects); 
      $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classID'")->queryAll();
    
    }    

    // fetching student roll number from `std_enrollment_detail` against selected student `$id`
    $stdRollNo = Yii::$app->db->createCommand("SELECT sed.std_roll_no,seh.session_id,seh.section_id
    FROM std_enrollment_detail as sed
    INNER JOIN std_enrollment_head as seh
    ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id
    WHERE sed.std_enroll_detail_std_id = '$id'")->queryAll();
    
?>

<div class="container-fluid">
  <div class="row">
  	<section class="content-header">
    	<h1 style="color: #3C8DBC; font-family: arial; font-weight: bolder;">
      	<i class="fa fa-user"></i> Student Profile / طالب علم کی تفصیل
    	</h1>
	    <ol class="breadcrumb">
	        <li><a href="./home"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="./std-personal-info">Back</a></li>
	    </ol>
  </section>
    <!-- Content Start -->
  	<section class="content">
    <?php 
      if (isset($_GET['sms'])) {
        $number = $_GET['to'];
        $num = str_replace('-', '', $number);
        $to = str_replace('+', '', $num);
        $message = $_GET['message'];
        // sms ....
        $type = "xml";
        $id = "jamiaqadria";
        $pass = "jamia105";
        $lang = "Urdu";
        $mask = "JamiaQadria";
        // Data for text message
        $message = urlencode($message);
        // Prepare data for POST request
        $data = "id=".$id."&pass=".$pass."&msg=".$message."&to=".$to."&lang=".$lang."&mask=".$mask."&type=".$type;
        // Send the POST request with cURL
        $ch = curl_init('http://www.sms4connect.com/api/sendsms.php/sendsms/url');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch); //This is the result from SMS4CONNECT
        curl_close($ch);
        
        if ($result) { ?>
            <div id="alert" class="alert alert-success">
              <?php echo $result; ?>
            </div>
        <?php }
      }
    ?>
      <?php 
        // display success message
        if (Yii::$app->session->hasFlash('success')) { ?>
          <div class="row">
            <div class="col-md-6 alert alert-success alert-dismissable">
               <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
               <h4><i class="icon fa fa-check"></i>Saved!</h4>
               <?= Yii::$app->session->getFlash('success') ?>
          </div>
          </div>
      <?php } ?>
        <div class="row">
          <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
              <div class="box-body box-profile">
                <img class="profile-user-img img-responsive img-circle" src="<?php echo $photo; ?>" alt="User profile picture">
                <!-- <div class="photo-edit text-center">
                  <a href="./std-personal-info-std-photo?id=<?php echo $id; ?>"><i class="fa fa-pencil"></i></a>
                </div> -->
                <h3 class="profile-username text-center" style="color: #3C8DBC;"><?php echo $stdPersonalInfo[0]['std_name'] ?></h3>
                <p class="text-muted text-center"><!-- Software Engineer --></p>
                <ul class="list-group list-group-unbordered">
                  <!-- <li class="list-group-item">
                    <b>Roll # رول </b> <a class="pull-right"><?php 
                    if (empty($stdRollNo[0]['std_roll_no'])) {
                      echo "N/A";
                    }
                    else
                    {
                      echo $stdRollNo[0]['std_roll_no'];
                    }
                     ?></a>
                  </li> -->
                  <li class="list-group-item" style="height: 50px;">
                    <b>Class / کلاس</b>
                    <a class="pull-right"><?php echo $className[0]['class_name'] ?></a>
                  </li>
                  <li class="list-group-item" style="height: 50px;">
                    <b>Email / ای میل</b> <a class="pull-right"><br><?php echo $stdPersonalInfo[0]['std_email'] ?></a>
                  </li>
                  <li class="list-group-item" style="height: 50px;">
                    <b>Contact # / رابطہ نمبر</b> <a class="pull-right"><?php echo $stdPersonalInfo[0]['std_contact_no']; ?></a>
                  </li>
                  <li class="list-group-item" style="height: 50px;">
                    <b>Admission Date / داخلہ کی تاریخ </b> <a class="pull-right"><?php echo date('d-m-Y', strtotime($stdPersonalInfo[0]['std_admit_date'])); ?>

                    </a>
                  </li>
                  <li class="list-group-item" style="height: 50px;">
                    <b>Leave Date / رخصت کی تا ریخ </b> <a class="pull-right"><?php echo $stdLeaveDate; ?></a>
                  </li>
                  <li class="list-group-item" style="height: 50px;">
                    <b>Student Residency / طالب علم کی رہائش گاہ </b> <a class="pull-right"><?php echo $stdPersonalInfo[0]['std_residency']; ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Status / حالت</b> <a class="pull-right">
                      
                      <?php 
                        if ($stdPersonalInfo[0]['status'] == "Active") {?>
                        <span class="label label-success"> 
                        <?php echo $stdPersonalInfo[0]['status']; ?> 
                        </span>
                    <?php } else {?>
                        <span class="label label-danger"> 
                        <?php echo $stdPersonalInfo[0]['status']; ?> 
                        </span>
                    <?php } ?>
                  </a>
                  </li>
                  <li class="list-group-item" style="height: 60px">
                    <b>Academic Status / <br>تعلیمی حیثیت </b> <a class="pull-right">
                      
                      <?php 
                        if ($stdPersonalInfo[0]['academic_status'] == "Active") {?>
                        <span class="label label-success"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                    <?php } else if ($stdPersonalInfo[0]['academic_status'] == "Promote"){?>
                        <span class="label label-primary"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                    <?php } else if ($stdPersonalInfo[0]['academic_status'] == "Left"){?>
                      <span class="label label-danger"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                      <?php }else{ ?>
                        <span class="label label-warning"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                      <?php } ?>
                  </a>
                  </li>
                  
                </ul>
                <!-- <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a> -->
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <!-- About Me Box -->
            <!-- /.box -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="nav-tabs-custom">
              <ul class="nav nav-tabs">
                <li class="active">
                  <a href="#personal" data-toggle="tab" style="color: #3C8DBC;">
                    <i class="fa fa-user-circle" ></i> Personal Info
                  </a>
                </li>
                <li>
                  <a href="#academic" data-toggle="tab" style="color: #3C8DBC;">
                    <i class="fa fa-book"></i> Academic Info
                  </a>
                </li>
                <li>
                  <a href="#exams_report" data-toggle="tab" style="color: #3C8DBC;">
                    <i class="fa fa-etsy"></i> Exams Report
                  </a>
                </li>
              </ul>
              <!-- student personal info Tab start -->
              <div class="tab-content">
                <div class="active tab-pane" id="personal">
                  <div class="row">
                    <div class="col-md-7">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> Personal Information / ذاتی معلومات</p>
                    </div>
                    <div class="col-md-5">
                      <div  style="float: right;">
                        <?=Html::a(' Edit',['update','id'=>$id],['class'=>'btn btn-primary btn-sm fa fa-edit','role'=>'modal-remote']) ?>
                        <!-- <a href="./emails-create?id=<?php echo $id;?>" class="btn btn-warning btn-sm fa fa-envelope-o" style='color: white;'> Send Email </a> -->
                        
                        <button type="button" class="btn btn-info btn-sm fa fa-comments" data-toggle="modal" data-target="#modal-default">
                          Send SMS
                        </button>
                        <div class="modal fade" id="modal-default">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">SMS</h4>
                              </div>
                              <form method="get" action="">
                                <div class="modal-body">  
                                  <label>Reciever Name</label>
                                  <input type="hidden" name="to" value="<?php echo $stdPersonalInfo[0]['std_contact_no']; ?>" class="form-control">
                                  <input type="text" name="std_name" value="<?php echo $stdPersonalInfo[0]['std_name']; ?>" class="form-control" readonly=""><br>
                                  <label>SMS Content</label>
                                    <textarea name="message" rows="5" class="form-control" id="message"></textarea>
                                    <p>
                                    <span><b>NOTE:</b> 160 characters = 1 SMS</span>
                                      <span id="remaining" class="pull-right">160 characters remaining </span>
                                    <span id="messages" style="text-align: center;">/ Count SMS(0)</span>
                                    <input type="hidden" value="" id="count"><br>
                                    <input type="text" value="" id="sms" style="border: none; color: green; font-weight: bold;" class="form-control">
                                    <input type="hidden" name="id" value="<?php echo $id; ?>">
                                  </p>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                  <button type="submit" name="sms" class="btn btn-primary btn-sm">Send SMS</button>
                                </div>
                              </form>
                            </div>
                            <!-- /.modal-content -->
                          </div>
                          <!-- /.modal-dialog -->
                        </div>
                      </div>
                    </div>
                  </div><hr>
                  <!-- student info start -->
                    <div class="row">
                      <div class="col-md-6" style="border-right: 1px dashed;">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>Student ID / طالب علم کی شناخت |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_id'] ?></td>
                            </tr>
                            <tr>
                              <th>Student Name / طالب علم کا نام |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_name'] ?></td>
                            </tr>
                            <tr>
                              <th>Father's Name / ولد یت  |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_father_name'] ?></td>
                            </tr>
                            <tr>
                              <th>Gender / جنس |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_gender'] ?></td>
                            </tr>
                            <tr>
                              <th>Date of Birth / تاریخ پیدائش |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_DOB'] ?></td>
                            </tr>
                            <tr>
                              <th colspan="2">Temporary Address / عارضی پتہ |</th>
                            </tr>
                            <tr>
                              <td><?php echo $stdPersonalInfo[0]['std_temporary_address'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                      <div class="col-md-6">
                          <table class="table table-stripped">
                          <thead>
                            <tr>
                              <th>CNIC / شناختی کارڈ |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_b_form'] ?></td>
                            </tr>
                            <tr>
                              <th>District / ضلع |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_district'] ?></td>
                            </tr>
                            <tr>
                              <th>Tehseel / تحصیل |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_tehseel'] ?></td>
                            </tr>
                            <tr>
                              <th>Religion / مذہب |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_religion'] ?></td>
                            </tr>
                            <tr>
                              <th>Nationality / قومیت |</th>
                              <td><?php echo $stdPersonalInfo[0]['std_nationality'] ?></td>
                            </tr>
                            <tr>
                              <th colspan="2">Permanent Address / مستقل پتہ |</th>
                            </tr>
                            <tr>
                              <td><?php echo $stdPersonalInfo[0]['std_permanent_address'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                    </div>
                  <!-- student info close -->
                </div>
                <!-- student personal info Tab close -->
                <!-- ****************** -->
                <!-- Academic tab start here -->
                <div class="tab-pane" id="academic">
                 <div class="row">
                    <div class="col-md-5">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> Academic Information</p>
                    </div>
                    <div class="col-md-2 col-md-offset-5">
                     <!--  <?=Html::a(' Edit',['./std-academic-info-update','id'=>$stdAcademicId,'ids'=>$id],['class'=>'fa fa-edit btn btn-primary btn-sm','title'=>'Edit', 'data-toggle'=>'tooltip']) ?> -->
                    </div>
                  </div>
                  <!-- Academic info start -->
                    <div class="row">
                      <div class="col-md-6" style="border-right:1px dashed; ">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <!-- <th>Session:</th>
                              <td>
                                <?php 
                                if(empty($stdRollNo[0]['session_id'])){
                                  echo 'N/A';
                                } else {
                                        $sessId = $stdRollNo[0]['session_id'];
                                        $sessName = Yii::$app->db->createCommand("SELECT session_name FROM    std_sessions WHERE session_id = '$sessId'")->queryAll();
                                        echo $sessName[0]['session_name'];
                                }
                                ?> -->
                              </td>
                            </tr>
                            <tr>
                              <!-- <th>Section:</th>
                              <td>
                                 <?php 
                                if(empty($stdRollNo[0]['section_id'])){
                                    echo 'N/A';
                                } else {
                                    $secId = $stdRollNo[0]['section_id'];
                                    $secName = Yii::$app->db->createCommand("SELECT section_name FROM std_sections WHERE section_id = '$secId'")->queryAll();
                                    echo $secName[0]['section_name'];
                                  } 
                                ?>  -->
                              </td>
                            </tr>
                            <tr  colspan="2">
                              <th>Class:</th>
                              <td><?php echo $className[0]['class_name']; ?></td>
                            </tr>
                            <!-- <tr>
                              <th>Subject Combination:</th>
                            </tr>
                            <tr>
                              <td colspan="2"><?php //echo $stdSubjects ?></td>
                            </tr> -->
                          </thead>
                        </table>
                      </div>
                    </div>
                  <!-- Academic info close -->
                </div>
                <!-- Academic tab close here -->
                <!-- ****************** -->
                <!-- Exams Report tab start here -->
                <div class="tab-pane" id="exams_report">
                 <div class="row">
                    <div class="col-md-5">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> Exams Report</p>
                    </div>
                    <div class="col-md-3 col-md-offset-4">
                      <?=Html::a(' Add Exams Report',['./exams-report-create','std_id'=>$id,'class_id'=>$classID],['class'=>'fa fa-edit btn btn-primary btn-sm','title'=>'Add Exams Report', 'data-toggle'=>'tooltip']) ?>
                    </div>
                  </div>
                  <!-- Exams Report info start -->
                    <div class="row">
                      <div class="col-md-12">
                        <table class="table table-condensed table-bordered table-hover table-responsive table-striped">
                          <thead>
                            <tr class="bg-primary">
                              <th>Sr.No</th>
                              <th>Class</th>
                              <th>Course</th>
                              <th>Paraa</th>
                              <th>Start Date</th>
                              <th>End Date</th>
                              <th>Duration</th>
                              <th>Remarks</th>
                              <th class="text-center">Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php  
                            // Exams Report...
                              $examsReport = Yii::$app->db->createCommand("SELECT * FROM exams_report WHERE std_id = '$id'")->queryAll();
                              foreach ($examsReport as $key => $value) { 
                                $paraId = $value['para_id'];
                                $paraay = Yii::$app->db->createCommand("SELECT name FROM paraay WHERE id = '$paraId'")->queryAll();
                                $paraName = $paraay[0]['name'];        
                                $classId = $value['class_id'];
                                $class = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classId'")->queryAll();
                                $courseId = $value['course_id'];
                                $course = Yii::$app->db->createCommand("SELECT course_name FROM std_course WHERE course_id = '$courseId'")->queryAll();
                                $className = $class[0]['class_name'];
                                $report = Yii::$app->db->createCommand("SELECT * FROM exams_report WHERE class_id = '$classId' AND std_id = '$id' AND para_id = $paraId")->queryAll();
                            ?>
                            <tr>
                              <th class="text-center"><?php echo $key+1; ?></th>
                              <td><?php echo $className; ?></td>
                              <td><?php echo $course[0]['course_name']; ?></td>
                              <td><?php echo $paraName; ?></td>
                              <td><?php echo $value['start_date']; ?></td>
                              <td><?php echo $value['end_date']; ?></td>
                              <td><?php echo $value['duration']; ?></td>
                              <td><?php echo $value['remarks']; ?></td>
                              <td class="text-center"><?=Html::a('',['./exams-report-update','id'=>$report[0]['id']],['class'=>'fa fa-edit btn btn-primary btn-sm','title'=>'Update Exams Report', 'data-toggle'=>'tooltip']) ?></td>
                            </tr>
                            <?php } ?>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  <!-- Exams Report info close -->
                </div>
                <!-- Exams Report tab close here -->
                <!-- *********************** -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
      <!--  -->
  </div>
</div>
</section>
</div>
</div>

<script>
// textarea sms counter....
$(document).ready(function(){
    var $remaining = $('#remaining'),
    $messages = $remaining.next();
    var numbers = '<?php// echo $countNumbers; ?>';
    $('#message').keyup(function(){
        var chars = this.value.length,
        messages = Math.ceil(chars / 160),
        remaining = messages * 160 - (chars % (messages * 160) || messages * 160);
        $messages.text('/ Count SMS (' + messages + ')');
        $messages.css('color', 'red');
        $remaining.text(remaining + ' characters remaining');
      
        $('#count').val(messages);
      var countSMS = $('#count').val();
        var sms = parseInt(countSMS * numbers);
        $('#sms').val("Your Consumed SMS: (" + countSMS+ ")");
    });
    // for parent sms modal...
    var $remaining = $('#remainingg'),
    $messagess = $remaining.next();
    var numbers = '<?php //echo $countNumbers; ?>';
    $('#messagee').keyup(function(){
        var chars = this.value.length,
        messagess = Math.ceil(chars / 160),
        remaining = messagess * 160 - (chars % (messagess * 160) || messagess * 160);
        $messagess.text('/ Count SMS (' + messagess + ')');
        $messagess.css('color', 'red');
        $remaining.text(remaining + ' characters remaining');
      
        $('#countt').val(messagess);
      var countSMS = $('#countt').val();
        var sms = parseInt(countSMS * numbers);
        $('#smss').val("Your Consumed SMS: (" + countSMS+ ")");
    });
});
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
// Remove Flash Alert....
$( document ).ready(function(){
    $('#alert').fadeIn(function(){
       $('#alert').delay(5000).fadeOut(); 
    });
});
</script>