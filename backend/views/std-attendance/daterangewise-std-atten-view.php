<?php 
    
if(isset($_POST['submit'])){ 
    
    $startDate      = $_POST["start_date"];
    $endDate        = $_POST["end_date"];
    $studentId      = $_POST["studentId"];
    $class_name_id    = $_GET["class_name_id"];
    $branch_id      = $_GET['branch_id'];
    $teacher_id     = $_GET['teacher_id'];

    $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_name_id'")->queryAll();

    $student = Yii::$app->db->createCommand("SELECT std_id, std_name FROM std_personal_info WHERE branch_id = '$branch_id' AND class_id = '$class_name_id'")->queryAll();

    $countstd = count($student); 
?>
<!DOCTYPE html>
<html>
<head>
  <title>View Attendance</title>
</head>
<body>
<div class="container-fluid">
    <form method="POST" action="view-attendance">
    <div class="row">
        <div class="col-md-10">
            <input type="hidden" name="classid" value="<?php echo $class_name_id; ?>">
        </div>
        <div class="col-md-2">
            <button type="submit" name="view-atten" style="float: right; margin-right:2px;background-color:#5CB85C;color: white;padding:3px;border-radius:5px;"><i class="glyphicon glyphicon-backward"></i> Back</button>
        </div>
    </div>
</form>
    <br>
    <div class="row">
        <div class="col-md-3">
            <div class="box box-danger" style="border-color:#5CB85C;">
                <div class="box-header">
                    <h3 class="text-center" style="font-family: georgia;">Student Attendance</h3><hr style="border-color:#d0f2d0;">
                </div>
                <div class="box-body">
                    <li style="list-style-type: none;">
                        <p class="text-center" style="padding:4px;background-color:#5CB85C;color:white;">
                            Date Range
                        </p>
                        <p>
                            <table style="background-color:#d0f2d0;color: red; width: 100%;">
                                <tr>
                                    <td>
                                        <b style="margin-left: 10px;">From:</b>
                                    </td>
                                    <td style="float: right;margin-right: 10px;">
                                        <u><?php echo $startDate;?></u>
                                    </td>
                                </tr><br>
                                <tr>
                                    <td>
                                        <b style="margin-left: 10px;">To:</b>
                                    </td>
                                    <td style="float: right;margin-right: 10px;">
                                        <u><?php echo $endDate;?></u>
                                    </td>
                                </tr>
                            </table>
                        </p>
                    </li><hr style="border-color:#d0f2d0;"><br>
                    <li style="list-style-type: none;margin-top: -20px;">
                        <b>Class:</b>
                        <p>
                            <?php echo $className[0]['class_name']; ?>
                        </p>
                    </li><br>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="box box-danger"style="border-color:#5CB85C;">
                <div class="box-header" style="padding:3px;">
                    <h2 class="text-center text-danger" style="font-family: georgia;color:#5CB85C;">Date Range Wise View</h2><hr style="border-color:#d0f2d0;">
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form method="POST" action="daterangewise-student-attendance">
                                <table class="table table-hover">
                                    <thead>
                                        <?php                                         
                                        $atten = Yii::$app->db->createCommand("SELECT att.date, att.attendance FROM std_attendance as att WHERE att.user_id = '$teacher_id' AND att.class_name_id = '$class_name_id' AND att.std_id = '$studentId' AND att.date >= '$startDate' AND att.date <= '$endDate'")->queryAll(); 
                                        $count = count($atten);
                                         ?>
                                        <tr style="background-color:#d0f2d0; ">
                                            <th >Sr #.</th>
                                            <th >Name</th>
                                            <?php for ($i=0; $i <$count ; $i++) { ?>
                                            <th>
                                                <?php 
                                                $datee = $atten[$i]["date"];
                                                $date = explode('-', $datee);
                                                $date1 = $date[2];
                                                    echo  $date1; 
                                                ?>   
                                            </th>
                                            <?php } ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?php echo 1 ?></td>
                                            <td><?php echo $student[0]['std_name'];?></td>
                                                <?php 
                                               $atten = Yii::$app->db->createCommand("SELECT att.date, att.attendance FROM std_attendance as att WHERE att.user_id = '$teacher_id' AND att.class_name_id = '$class_name_id' AND att.std_id = '$studentId' AND att.date >= '$startDate' AND att.date <= '$endDate'")->queryAll();

                                                for ($j=0; $j <$count ; $j++) { ?>
                                            <td><?php echo $atten[$j]["attendance"]; ?></td>
                                            <?php } ?>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  
<?php
//closing of ifisset
}
?>
</body>
</html>
