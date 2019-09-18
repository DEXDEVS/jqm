<!DOCTYPE html>
<html>
<head>
  <title>View Attendance</title>

</head>
<body>

    <?php 

    if(isset($_POST["submit"])){

        $class_name_id  = $_GET["class_name_id"];
        $teacher_id     = $_GET["teacher_id"];
        $branch_id     = $_GET["branch_id"];
        $date           = $_POST["date"];
        $studentId      = $_POST["studentId"];

        $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_name_id'")->queryAll();

        $branch_id = Yii::$app->user->identity->branch_id;
        $student = Yii::$app->db->createCommand("SELECT std_id, std_name FROM std_personal_info WHERE branch_id = '$branch_id' AND class_id = '$class_name_id' AND std_id = '$studentId' AND status = 'Active'")->queryAll();

?>
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
    </form><br>
    <div class="row">
        <div class="col-md-3">
           <div class="box box-danger"style="border-color:#5CB85C;">
               <div class="box-header">
                    <h3 class="text-center" style="font-family: georgia;">Student Attendance</h3><hr style="border-color:#d0f2d0;">
               </div>
               <div class="box-body">
                   <li style="list-style-type: none;">
                        <p class="text-center" style="padding:4px; background-color:#5CB85C; color:white;">Date</p>
                        <p style="background-color:#d0f2d0;color: red;text-align: center;">
                            <u><?php echo $date; ?></u>
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
                    <h2 class="text-center text-danger" style="font-family: georgia;color:#5CB85C;">Date Wise View</h2><hr style="border-color:#d0f2d0;">
               </div>
               <div class="box-body">
                   <div class="row">
                        <div class="col-md-12">
                            <form method="POST" action="datewise-std-atten-view">
                                <table class="table table-hover">
                                    <thead>
                                        <tr style="background-color:#d0f2d0; ">
                                            <th >Sr #.</th>
                                            <th >Name</th>
                                            <th>Attendance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?php echo 1; ?></td>
                                            <td><?php echo $student[0]['std_name'];?></td>
                                            <?php 
                                                $atten = Yii::$app->db->createCommand("SELECT att.attendance FROM std_attendance as att WHERE att.user_id = '$teacher_id' AND att.class_name_id = '$class_name_id' AND att.date = '$date' AND att.std_id = '$studentId'")->queryAll();
                                                ?>
                                            <td align="center">
                                                <?php 
                                                if(empty($atten)){
                                                    echo 'Not Marked';
                                                } else {
                                                    echo $atten[0]['attendance']; 
                                                }?>
                                            </td>
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
