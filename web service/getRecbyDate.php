<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
date_default_timezone_set("Asia/Bangkok");
$sqlRecord ="SELECT `SugarBloodRate`,`DateRec`,`TimeRec` FROM `recorder` WHERE ID = '".$_GET["ID"]."' AND`DateRec` BETWEEN '".$_GET["Begin"]."' AND '".$_GET["End"]."'";
$objResult=mysqli_query($objCon,$sqlRecord);

$response = array();
while($Data=mysqli_fetch_assoc($objResult)){
	
	$response[] = $Data;
	//echo $response["ID"];
	//echo json_encode($response);
}

//echo json_encode($response);
$sbrAll="";

for($i=0;$i<count($response);$i++){
	//echo $i;
	if($i==count($response)-1){
		$sbrAll=$sbrAll.$response[$i]["SugarBloodRate"];
	}
	else{	
		$sbrAll=$sbrAll.$response[$i]["SugarBloodRate"].",";
	}	//echo $sbrAll;
}
//echo $sbrAll;

$datetimeall = "";
for ($i=0;$i<count($response);$i++) { 
	if($i==count($response)-1){
	$datetimeall=$datetimeall.$response[$i]["DateRec"]."".$response[$i]["TimeRec"];	
	}
	else{
	$datetimeall=$datetimeall.$response[$i]["DateRec"]."".$response[$i]["TimeRec"]."|";
	}
}
//echo $datetimeall;
$result = array();
array_push($result,$sbrAll);
array_push($result,$datetimeall);
echo json_encode($result);
?>