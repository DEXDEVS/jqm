<!DOCTYPE html>
<html>
<head>
	<title>Attendance</title>
</head>
<body>
<div class="container-fluid" style="margin-top: -10px">
	<h1 class="well well-sm" align="center">Attendance</h1>	
	<form  action = "./attendance" method="POST">
    	<div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-2">
                <div class="form-group">
                    <label>Select Class</label>
                    <select class="form-control" name="classid" required="">
                    	<option value="">Select Class</option>
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
            <div class="col-md-2">
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-sm form-control" style="margin-top: 25px; background: #1a4977; color: #dce6ef;">
                    <i class="glyphicon glyphicon-share"></i>	
                	<b>Take Attendance</b></button>
                </div>    
            </div>    
        </div>
    </form>
    

<?php
	if(isset($_POST["submit"])){
		 
		$classid= $_POST["classid"];
		$date = date('Y-m-d');

		$className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classid' AND status = 'Active'")->queryAll();

		$student = Yii::$app->db->createCommand("SELECT std_id, std_name FROM std_personal_info WHERE class_id = '$classid'")->queryAll();

		?>
		<hr>
		<form method="POST" action="./attendance">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<table width="100%" class="table table-condensed table-hover">
						<tr>
							<th>Class</th>
							<th>Date</th>
						</tr>
						<tr>
							<td><?php echo $className[0]['class_name']; ?></td>
							<td><?php echo $date; ?></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<table width="100%" class="table table-striped table-condensed">
						<tr></tr>
						<tr class="label-primary" style="color: white;">
							<th>Sr No</th>
							<th>Student Name</th>
							<th style="text-align: center;">Attendance</th>
						</tr>
						
						<?php 
						if(empty($student)){
							Yii::$app->session->setFlash('warning','No students found.');
						} else {
							$length = count($student);
							//$stdId = array(); 
						for( $i=0; $i<$length; $i++) { 
							$stdId = $student[$i]['std_id'];
							?>
							<tr>
								<td><?php echo $i+1 ?></td>
								<td><?php echo $student[$i]['std_name'] ?></td>
								<td align="center">
									<input type="radio" name="std<?php echo $i+1?>" value="P" checked="checked"/> <b  style="color: green">Present </b> &nbsp; &nbsp;| &nbsp; 
									<input type="radio" name="std<?php echo $i+1?>" value="A" /> <b style="color: red">Absent </b> &nbsp; &nbsp;| &nbsp; 
									<input type="radio" name="std<?php echo $i+1?>" value="L" /><b style="color: #F7C564;">Leave</b>
								</td>
							</tr>
					<?php
						$stdAttendId[$i] = $stdId;
						//closing for loop
						}
					} //closing of else
					?>
						</table>
					</div>
				</div>	
			</div><hr>
			<div class="row">
				<div class="col-md-2">
	                <div class="form-group">
	                	<?php foreach ($stdAttendId as $value) {
	                		echo '<input type="hidden" name="stdAttendance[]" value="'.$value.'">';
	                	}
	                	?>
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
	    </form> 
		<?php 
		// closing of if isset
			} ?>
	</div>
	<!-- container-fluid close -->	

<?php 	
	if (isset($_POST["save"])) {
		$classid = $_POST["classid"];
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
					'class_name_id' => $classid,
					'date' 			=> $date,
					'std_id' 		=> $stdAttendId[$i],
					'attendance'	=> $status[$i],
					'created_at'	=> new \yii\db\Expression('NOW()'),
					'created_by'	=> Yii::$app->user->identity->id,
				])->execute();
			} //closing of $i loop

			if($attendance){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Attendance marked successfully...!");
			} //closing of if
		} //closing of try block
		catch(Exception $e){
			$transection->rollback();
			echo $e;
			Yii::$app->session->setFlash('warning', "Attendance not marked. Try again!");
		} //closing of catch
	} //closing of if isset
?>
</body>
</html>