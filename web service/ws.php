
<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
$newID = "";


$sqlInserch = "INSERT INTO `patient_info`(`Name`, `Surname`, `IDcard`, `DOB`, `Tel.`,`DoctorID`) VALUES ('".$_GET["Name"]."','".$_GET["Surname"]."','".$_GET["IDcard"]."','".$_GET["DOB"]."','".$_GET["Tel"]."','".$_GET["DoctorID"]."')";
mysqli_query($objCon,$sqlInserch);
echo $sqlInserch;

$sqlsearch = "SELECT `ID` FROM `patient_info` WHERE `Name`='".$_GET["Name"]."' AND `Surname` = '".$_GET["Surname"]."' AND `IDcard`='".$_GET["IDcard"]."';";
$objResponse = mysqli_query($objCon,$sqlsearch);
echo $sqlsearch;

$response = array();

while($Data=mysqli_fetch_assoc($objResponse)){

	$response[] = $Data;

	//echo json_encode($response);
	$newID=implode("",$Data);

}
echo $newID;


$sqlInserchUSER="INSERT INTO `patient` (`ID`,`E-mail`, `Password`) VALUES ('".$newID."','".$_GET["E-mail"]."','".$_GET["Password"]."')";
mysqli_query($objCon,$sqlInserchUSER);
echo $sqlInserchUSER;



$sqlForSure = "SELECT * FROM `patient`,`patient_info`,`patient_doctor` WHERE patient.ID=patient_info.ID and patient_doctor.ID=patient.ID and patient.ID='".$newID."'" ;
$objResult=mysqli_query($objCon,$sqlForSure);
echo $sqlForSure;
$result = array();
while($Data1 = mysqli_fetch_array($objResult)){

	$result[] = $Data1;
	echo json_encode($result);
}
?>
