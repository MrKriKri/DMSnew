<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
date_default_timezone_set("Asia/Bangkok");
$sqlRecord = "INSERT INTO `patient_meal`(`ID`,`Meal`,`Meal_date`,`Meal_time`,`Food`,`Amount`) VALUES ('".$_GET["ID"]."','".$_GET["Meal"]."','".$_GET["DATE"]."','".$_GET["TIME"]."','".$_GET["Food"]."','".$_GET["Amount"]."')";
mysqli_query($objCon,$sqlRecord);
echo $sqlRecord;
?>