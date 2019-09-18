<!DOCTYPE html>
<html>
<head>
	<title>Attendance</title>
</head>
<body>
<div class="container-fluid" style="margin-top: -40px">
	<h1 class="well well-sm" align="center" style="font-family: serif;"><b>Student Attendance  طلباء کی حاضری </b></h1>	
	<form  action = "./attendance" method="POST">
    	<div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <label>Select Class کلاس منتخب کریں </label>
                    <select class="form-control" name="classid" required="">
                    	<option value="">Select Class  کلاس منتخب کریں </option>
							<?php 
								$stdclassName = Yii::$app->db->createCommand("SELECT * FROM std_class_name WHERE status = 'Active'")->queryAll();
								$countClass = count($stdclassName);
								  	for ($i=0; $i <$countClass ; $i++) { ?>	
									<option value="<?php echo $stdclassName[$i]['class_name_id']; ?>">
										<?php echo $stdclassName[$i]['class_name']; ?>	
									</option>
							<?php } ?>
					</select>      
                </div>    
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <label>Select Date</label>
                    <input type="date" name="date" class="form-control" required="">  
                </div>    
            </div> 
            <div class="col-md-2">
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-sm form-control" style="margin-top: 25px; background: #1a4977; color: #dce6ef;">
                    <i class="glyphicon glyphicon-share"></i>	
                	<b>Get Class</b></button>
                </div>    
            </div>    
        </div>
    </form>
<?php
	if(isset($_POST["submit"])){ 
		$classid= $_POST["classid"];
		$date = $_POST["date"];
		//$date = date('Y-m-d');

		$className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classid' AND status = 'Active'")->queryAll();

		$stdAttendance = Yii::$app->db->createCommand("SELECT a.attendance FROM std_attendance as a WHERE a.class_name_id = '$classid' AND a.date = '$date' ")->queryAll();

		if(!empty($stdAttendance)){
			Yii::$app->session->setFlash('warning','Attendance for this class Already taken');
		} else {
			$student = Yii::$app->db->createCommand("SELECT std_id, std_name, std_father_name FROM std_personal_info WHERE class_id = '$classid' AND status = 'Active'")->queryAll();

			if(empty($student)){
				Yii::$app->session->setFlash('warning','Sorry! No Students Found in this Class!');
			} else {

		?>
		<hr>
		<form method="POST" action="./monthly-class-atten-view">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<table width="100%" class="table table-striped table-condensed">
						<tr class="bg-navy">
							<th class="text-center" colspan="4">
								Class: <?php echo $className[0]['class_name']; ?> | 
								Date: <?php echo $date; ?>
							</th>
						</tr>
						<tr class="label-primary" style="color: white;">
							<th class="text-center">Sr.No</th>
							<th>Student Name</th>
							<th>Father Name</th>
							<th style="text-align: center;">Attendance</th>
						</tr>
						<?php 
							$length = count($student);
							
						for( $i=0; $i<$length; $i++) { 
							$stdId = $student[$i]['std_id'];
							?>
							<tr>
								<th class="text-center"><?php echo $i+1 ?></th>
								<td><?php echo $student[$i]['std_name'] ?></td>
								<td><?php echo $student[$i]['std_father_name'] ?></td>
								<td align="center">
									<input type="radio" name="std<?php echo $i+1?>" value="P" checked="checked"/> <b  style="color: green"> Present حاضر </b> &nbsp; &nbsp;| &nbsp; 
									<input type="radio" name="std<?php echo $i+1?>" value="A" /> <b style="color: red"> Absent  غیرحاضر  </b> &nbsp; &nbsp;| &nbsp; 
									<input type="radio" name="std<?php echo $i+1?>" value="L" /><b style="color: #3C8DBC;"> Leave  چھٹی </b>
								</td>
							</tr>
					<?php
						$stdAttendId[$i] = $stdId;
						} //closing for loop
					?>
					</table>
				</div>
			</div><hr>	
			<div class="row">
				<div class="col-md-2">
	                <div class="form-group">
	                	<?php 
                			foreach ($stdAttendId as $value) {
                			echo '<input type="hidden" name="stdAttendance[]" value="'.$value.'">';
	                		}?>
	                	<input type="hidden" name="length" value="<?php echo $length; ?>">
	                	<input type="hidden" name="classid" value="<?php echo $classid; ?>">
	                	<input type="hidden" name="date" value="<?php echo $date; ?>">

	                </div>    
	        	</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-md-offset-5">
					<button type="submit" name="save" class="btn btn-success form-control"><i class="glyphicon glyphicon-saved"></i>
						<b>Save Attendance</b></button>
				</div>
			</div>
		<?php } //(empty($student))
		?>
	    </form> 
		<?php 
		} //(!empty($stdAttendance))
	} // closing of if isset
	?>
</div>
<!-- container-fluid close -->	

</body>
</html>