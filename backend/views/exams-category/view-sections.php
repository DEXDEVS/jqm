<?php 

	$exam_category 	= $_GET['examcatID'];
	$class_id 		= $_GET['classID'];
	$exam_type 		= $_GET['examType'];
	$startYear		= $_GET['startYear'];
	$endYear		= $_GET['endYear'];

	$ClassName = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_id'")->queryAll();

	$ClassSections = Yii::$app->db->createCommand("SELECT std_enroll_head_id,std_enroll_head_name,branch_id FROM std_enrollment_head WHERE class_name_id = '$class_id'")->queryAll();
	$CountClassSections = count($ClassSections);

 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<!-- back button start -->
	 <ol class="breadcrumb">
      <li><a class="btn btn-primary btn-xs" href="exam-lists?id=<?php echo $exam_category; ?>&class_id=<?php echo $class_id; ?>&examType=<?php echo $exam_type; ?>"><i class="fa fa-backward"></i> Back</a></li>
    </ol>
	<!-- back button close -->
	<div class="row">
		<div class="col-md-12">
			<div class="table">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2">
								<?php echo $ClassName[0]['class_name']; ?>
							</th>
						</tr>
						<tr>
							<th>Sr.#</th>

							<th>Branch</th>
							<th>Sections</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						for ($i=0; $i <$CountClassSections ; $i++) { 
						$headId = $ClassSections[$i]['std_enroll_head_id'];
						$branchID = $ClassSections[$i]['branch_id'];
						$branchName = Yii::$app->db->createCommand("SELECT branch_name FROM branches WHERE branch_id = '$branchID'")->queryAll();
						 ?>
						<tr>
							<td><?php echo $i+1; ?></td>
							<td>
								<?php echo $branchName[0]['branch_name']; ?>
							</td>
							<td>
								<?php echo $ClassSections[$i]['std_enroll_head_name']; ?>	
							</td>
							<td>
								<div class="dropdown">
								    <button class="btn btn-info btn-xs dropdown-toggle" type="button" data-toggle="dropdown">Choose Action
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu">
								      	<li>
								      		<a style="border-bottom-left-radius:20px;border-top-right-radius:20px;" href="./view-datesheet?examcatID=<?php echo $exam_category;?>&class_id=<?php echo $class_id;?>&headID=<?php echo $headId;?>&examType=<?php echo $exam_type;?>&startYear=<?php echo $startYear;?>&endYear=<?php echo $endYear;?>"><i class="fa fa-eye"></i> View Date Sheet</a>
								      	</li>
								      	<li>
								      		<a style="border-bottom-left-radius:20px;border-top-right-radius:20px;" href="./update-datesheet?examcatID=<?php echo $exam_category;?>&class_id=<?php echo $class_id;?>&headID=<?php echo $headId;?>&examType=<?php echo $exam_type;?>&startYear=<?php echo $startYear;?>&endYear=<?php echo $endYear;?>"><i class="fa fa-edit"></i> 
											Update Date Sheet
											</a>
										</li>
								      	<li>
								      		<a style="border-bottom-left-radius:20px;border-top-right-radius:20px;" href="./class-sections-marks-lists?exam_category=<?php //echo $examCateogryId;?>&class_id=<?php //echo $classId;?>&exam_type=<?php //echo $examType;?>&startYear=<?php //echo $startYear;?>&endYear=<?php //echo $endYear;?>"><i class="fa fa-eye"></i> View Marks Sheet</a>
								      	</li>
								    </ul>
								</div>
							</td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>