<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
date_default_timezone_set("Asia/Bangkok");
$sqlRecord = "SELECT * FROM `patient_doctor`";
$result = mysqli_query($objCon,$sqlRecord);

$response = array();
while($Data=mysqli_fetch_assoc($result)){
	
	$response[] = $Data;
	
}
echo json_encode($response);
?>