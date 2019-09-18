<?php 
use backend\controllers\SmsController;
if (isset($_POST["save"])) {
		$class_name_id = $_POST["classid"];
		$date = $_POST["date"];
		$length = $_POST["length"];
		$stdAttendId = $_POST["stdAttendance"];
		for($i=0; $i<$length;$i++){
			$q=$i+1;
			$std = "std".$q;
			$status[$i] = $_POST["$std"];
		}

		$transection = Yii::$app->db->beginTransaction();
		try{
			for($i=0; $i<$length; $i++){
				$attendance = Yii::$app->db->createCommand()->insert('std_attendance',[
					'user_id' 		=> Yii::$app->user->identity->id,
					'class_name_id' => $class_name_id,
					'date' 			=> $date,
					'std_id' 		=> $stdAttendId[$i],
					'attendance'	=> $status[$i],
					'created_at'	=> new \yii\db\Expression('NOW()'),
					'created_by'	=> Yii::$app->user->identity->id,
				])->execute();
			} //closing of $i loop

         if($attendance == 1){
            $user_id = Yii::$app->user->identity->id;
                $query = Yii::$app->db->createCommand("SELECT att.std_id, att.attendance 
                     FROM std_attendance as att
                     WHERE att.user_id = '$user_id' 
                     AND att.class_name_id = '$class_name_id'
                     AND CAST(date AS DATE) = '$date'
                     AND att.attendance != 'P'")->queryAll();

                    $c = count($query);
//var_dump($c);
                for ($i=0; $i < $c ; $i++) { 
                     $stdID = $query[$i]['std_id'];
                     $stdStatus = $query[$i]['attendance'];
                     $stdInfo = Yii::$app->db->createCommand("SELECT std.std_reg_no,std.std_name, std.std_father_name, std.std_father_contact_no
                         FROM std_personal_info as std 
                         WHERE std.std_id = '$stdID'
                        AND status = 'Active'")->queryAll();

                    $stdName[$i] = $stdInfo[0]['std_name'];
                    $contact[$i] = $stdInfo[0]['std_father_contact_no'];
                     // if ($stdStatus == 'L') {
                     //     $num = str_replace('-', '', $contact[$i]);
                     //         $to = str_replace('+', '', $num);
                     //         $leaveSMS = Yii::$app->db->createCommand("SELECT sms_template FROM sms WHERE sms_name = 'Leave SMS'")->queryAll();
                     //         $leaveMsg = $leaveSMS[0]['sms_template'];
                     //         $msg = substr($leaveMsg,0,16);
                     //         $msg2 = substr($leaveMsg,17);
                     //         $message = $msg." ".$regNo[$i]." ".$msg2;
                            
                     // //$sms = SmsController::sendSMS($to, $message);
                     // } 
                    if ($stdStatus == 'A') {
                        $num = str_replace('-', '', $contact[$i]);
                        $to = str_replace('+', '', $num);
                        $absentSMS = Yii::$app->db->createCommand("SELECT sms_template FROM sms WHERE sms_name = 'Absent SMS'")->queryAll();
                         $absentMsg = $absentSMS[0]['sms_template'];
                             $msg = substr($absentMsg,0,69);
                             $msg2 = substr($absentMsg,69);
                             $message = $msg." ".$stdName[$i]." ".$msg2;
                             //var_dump($message);
                         $sms = SmsController::sendSMS($to, $message);
                    }
                }
         }
		if($attendance){
			$transection->commit();
			Yii::$app->session->setFlash('success', "Attendance marked successfully...!");
		} //closing of if
    } catch(Exception $e){
        $transection->rollback();
        echo $e;
        Yii::$app->session->setFlash('warning', "Attendance not marked. Try again!");
    } 

    $mon = date('Y-m-d');
    $currentMonth = date("Y - F", strtotime($mon));
    $month  = date("m", strtotime($mon));
    $year  = date("Y", strtotime($mon));
    $days = cal_days_in_month(CAL_GREGORIAN, $month,$year);

    $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_name_id'")->queryAll();

    $user_id = Yii::$app->user->identity->id;
    $branch_id = Yii::$app->user->identity->branch_id;
    $stdInfo = Yii::$app->db->createCommand("SELECT std_id, std_name FROM std_personal_info WHERE branch_id = '$branch_id' AND class_id = '$class_name_id' AND status = 'Active'")->queryAll();
    //print_r($stdInfo);
        $countStd = count($stdInfo);
        
    ?>
<div class="row">
    <div class="col-md-3 col-md-offset-9">
        <a href="./attendance" style="float: right;background-color:#008d4c;color: white;padding:3px;border-radius:5px;"><i class="glyphicon glyphicon-backward"></i> Back</a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header label-success">
                <h3 class="box-title"><?php echo $className[0]['class_name']; ?></h3>
                <h3 class="box-title" style="float: right;"><?php echo "Attendance ( ".$currentMonth." )"; ?></h3>
            </div>
            <!-- /.box-header -->
            <table class="table table-hover table-bordered">
                <thead>
                    <tr style="background-color:#008D4C;color:white;">
                        <th>Sr.#</th>
                        <td style="padding:2px 0px 2px 0px;">Name</td>
                         <?php for ($i=1; $i<=$days; $i++) { 
                               $var = $year."-".$month."-".$i;
                               $day  = date('Y-m-d',strtotime($var));
                               $result = date("D", strtotime($day)); ?>
                        <td style="padding:1px 1px;"><?php echo date("d", strtotime($day)); ?><br><?php echo $result; ?></td>
                        <?php  // closing of $days loop
                            } ?>
                        <td>P</td>
                        <td>A</td>
                        <td>L</td>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    for($i=0; $i <$countStd ; $i++){
                        $stdName = $stdInfo[$i]['std_name'];
                        $stdID = $stdInfo[$i]['std_id'];
                        $presentCount = 0;
                        $absentCount = 0;
                        $leaveCount = 0;
                     ?>
                    <tr>
                        <td><?php echo $i+1; ?></td>
                        <td style="padding:0px ;width: 5px;"><?php echo $stdName; ?></td>
                        <?php for ($j=1; $j <=$days ; $j++) {
                            $var = $year."-".$month."-".$j;
                            $day  = date('Y-m-d',strtotime($var));
                            $result = date("D", strtotime($day));
                           $stdAtten = Yii::$app->db->createCommand("SELECT i.attendance FROM std_attendance as i WHERE i.user_id = '$user_id' AND i.class_name_id = '$class_name_id' AND i.std_id = '$stdID' AND i.date = '$day'")->queryAll();
                            //var_dump($result);
                            if ($result == 'Fri') {
                                 echo "<td class='danger' style='padding:1px 1px;'></td>";
                             } 
                            else if (empty($stdAtten)) {
                                echo "<td style='padding:1px 1px;'></td>";
                            }
                            else{
                                echo "<td style='padding:1px 1px;'>".$stdAtten[0]['attendance']."</td>";
                                if ($stdAtten[0]['attendance'] == 'P') {
                                    $presentCount++;
                                }
                                if ($stdAtten[0]['attendance'] == 'A') {
                                    $absentCount++;
                                }
                                if ($stdAtten[0]['attendance'] == 'L') {
                                    $leaveCount++;
                                }
                            }
                             ?>
                        <?php  // closing of $days loop
                            } ?>
                        <td class="success">
                            <?php echo $presentCount; ?> 
                        </td>
                        <td class="warning">
                            <?php echo $absentCount; ?>
                        </td>
                        <td class="info">
                            <?php echo $leaveCount; ?>
                        </td>
                    </tr>
                <?php // closing of $countStd loop
                    } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php          
// closing of if isset
} else {

    $classIds = Yii::$app->db->createCommand("SELECT * FROM std_class_name WHERE status = 'Active'")->queryAll();        

    $countClassIds = count($classIds); 
 ?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<form method="POST" action="monthly-class-atten-view">
			<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Class</label>
                    <select class="form-control" name="class_name_id">
                        <option value="">Select Class</option>
                        <?php for ($i=0; $i <$countClassIds ; $i++) {
                        $classId = $classIds[$i]['class_name_id'];?>
                            <option value=<?php echo $classIds[$i]['class_name_id']; ?>><?php echo $classIds[$i]['class_name']; ?></option>

                        <?php } ?>
                    </select>
                </div>
            </div>
			<div class="col-md-4">
				<div class="form-group">
					<label><i class="glyphicon glyphicon-calendar"></i> Select Month</label>
					<input type="month" name="att_month" class="form-control">
				</div>
			</div>
			<div class="col-md-3">
				<button type="submit" name="report" class="btn btn-success" style="margin-top:25px;"><i class="glyphicon glyphicon-eye-open"></i> View Report</button>
			</div>
		</form>
	</div>
    <?php   
    if(isset($_POST['report'])){ 
        $mon = $_POST['att_month'];
        $class_name_id = $_POST['class_name_id'];
        $currentMonth = date("Y - F", strtotime($mon));
        $month  = date("m", strtotime($mon));
        $year  = date("Y", strtotime($mon));
        $days = cal_days_in_month(CAL_GREGORIAN, $month,$year);

        $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_name_id'")->queryAll();

        //fetching students
        $branch_id = Yii::$app->user->identity->branch_id;
        $stdInfo = Yii::$app->db->createCommand("SELECT std_id, std_name FROM std_personal_info WHERE branch_id = '$branch_id' AND class_id = '$class_name_id' AND status = 'Active'")->queryAll();
        $countStd = count($stdInfo);

        $user_id = Yii::$app->user->identity->id;
    ?>
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header label-success">
                    <h3 class="box-title"><?php echo $className[0]['class_name']; ?></h3>
                    <h3 class="box-title" style="float: right;"><?php echo "Attendance ( ".$currentMonth." )"; ?></h3>
                </div>
                <!-- /.box-header -->
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr style="background-color:#008D4C;color:white;">
                            <th>Sr.#</th>
                            <td style="padding:2px 0px 2px 0px;">Name</td>
                             <?php for ($i=1; $i<=$days; $i++) { 
                                   $var = $year."-".$month."-".$i;
                                   $day  = date('Y-m-d',strtotime($var));
                                   $result = date("D", strtotime($day)); ?>
                            <td style="padding:1px 1px;"><?php echo date("d", strtotime($day)); ?><br><?php echo $result; ?></td>
                            <?php  // closing of $days loop
                                } ?>
                            <td>P</td>
                            <td>A</td>
                            <td>L</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        for($i=0; $i <$countStd ; $i++){
                            $stdName = $stdInfo[$i]['std_name'];
                            $stdID = $stdInfo[$i]['std_id'];
                            $presentCount = 0;
                            $absentCount = 0;
                            $leaveCount = 0;
                         ?>
                        <tr>
                            <td><?php echo $i+1; ?></td>
                            <td style="padding:0px ;width: 5px;"><?php echo $stdName; ?></td>
                            <?php for ($j=1; $j <=$days ; $j++) {
                                $var = $year."-".$month."-".$j;
                                $day  = date('Y-m-d',strtotime($var));
                                $result = date("D", strtotime($day));
                               $stdAtten = Yii::$app->db->createCommand("SELECT i.attendance FROM std_attendance as i WHERE i.user_id = '$user_id' AND i.class_name_id = '$class_name_id' AND i.std_id = '$stdID' AND i.date = '$day'")->queryAll();
                                
                                if ($result == 'Fri') {
                                     echo "<td class='danger' style='padding:1px 1px;'></td>";
                                 } 
                                else if (empty($stdAtten)) {
                                    echo "<td style='padding:1px 1px;'></td>";
                                }
                                else{
                                    echo "<td style='padding:1px 1px;'>".$stdAtten[0]['attendance']."</td>";
                                    if ($stdAtten[0]['attendance'] == 'P') {
                                        $presentCount++;
                                    }
                                    if ($stdAtten[0]['attendance'] == 'A') {
                                        $absentCount++;
                                    }
                                    if ($stdAtten[0]['attendance'] == 'L') {
                                        $leaveCount++;
                                    }
                                }
                                 ?>
                            <?php  // closing of $days loop
                                } ?>
                            <td class="success">
                                <?php echo $presentCount; ?> 
                            </td>
                            <td class="warning">
                                <?php echo $absentCount; ?>
                            </td>
                            <td class="info">
                                <?php echo $leaveCount; ?>
                            </td>
                        </tr>
                    <?php // closing of $countStd loop
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php //CLOSING OF if(isset($_POST['report']))
    } ?>
</div>

<?php 
} //closing of else ?>
</body>
</html>