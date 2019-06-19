<!DOCTYPE html>
<html>
<head>
	<title>All Branches</title>
</head>
<body>
<?php 
use yii\helpers\Html;
  $id = $_GET['id'];
  // class info...
  $className = Yii::$app->db->createCommand("SELECT class_name  FROM std_class_name
    WHERE class_name_id = '$id'")->queryAll();
  //var_dump($className);
  // students info....
  $students = Yii::$app->db->createCommand("SELECT * FROM std_personal_info
    WHERE class_id = '$id'")->queryAll();

  $count = count($students);
?>
<div class="container-fluid">
	<section class="content-header">
      	<h1 style="color: #3C8DBC; font-family: arial; font-weight: bolder;">
        	
          <?php 
              echo "<span class='label-success' style='border-radius: 50%; padding: 2px 8px;'> ". $count."</span>" . 'کلاس :'  . $className[0]['class_name'].'   کی تفضیلی معلومات' ;
          ?>
          <i class="fa fa-copyright"></i>
      	</h1>
	    <ol class="breadcrumb" style="color: #3C8DBC;">
	        <li><a href="./home" style="color: #3C8DBC;"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="./std-class-name" style="color: #3C8DBC;">Back</a></li>
	    </ol>
    </section>
    <!--  -->
	<section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-6">
          <table class="table table-bordered table-hover table-condensed table-striped">
            <thead>
              <tr class="label-primary">
                <th style="width: 60px; text-align: center;">Sr #</th>
                <!-- <th style="width: 200px">Registration #</th>
                <th style="width: 200px">Roll #</th> -->
                <th>Student Name</th>
                <th>Father Name</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($students as $key => $value){  ?>
              <tr>
                <td align="center"><b><?php echo $key+1; ?></b></td>
                <!-- <td>
                  <?php  
                    if (empty($value['std_reg_no'])) {
                      echo " ";
                    }
                    else{
                      echo $value['std_reg_no'];
                    }
                  ?>  
                </td> -->
                <!-- <td>
                  <?php  
                    if (empty($value['std_roll_no'])) {
                      echo " ";
                    }
                    else{
                      echo $value['std_roll_no'];
                    }
                  ?>   
                </td> -->
                <td>
                  <a href="./std-personal-info-view?id=<?php echo $value['std_id'];?>">
                    <?php  
                    if (empty($value['std_name'])) {
                      echo " ";
                    }
                    else{
                      echo $value['std_name'];
                    }
                    ?>  
                  </a>
                </td>
                <td>
                  <a href="./std-personal-info-view?id=<?php echo $value['std_id'];?>">
                    <?php  
                    if (empty($value['std_father_name'])) {
                      echo " ";
                    }
                    else{
                      echo $value['std_father_name'];
                    }
                    ?>  
                  </a>
                </td>
                <!-- <td>
                  <?php $stdID = $value['std_id'];?>
                  <?=Html::a('',['std-enrollment-detail/delete','ids'=>$stdID,'id'=>$id],['class'=>'fa fa-trash','role'=> '', 'data-confirm' => 'Are you sure?']) ?>
                </td> -->
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!--  -->
</div>	
</body>
</html>