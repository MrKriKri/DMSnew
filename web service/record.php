<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
date_default_timezone_set("Asia/Bangkok");
$sqlRecord = "INSERT INTO `recorder`(`ID`, `SugarBloodRate`, `DateRec`, `TimeRec`) VALUES ('".$_GET["ID"]."','".$_GET["sugar"]."','".date("Y-m-d")."','".date("H:i:s")."')";
mysqli_query($objCon,$sqlRecord);
echo $sqlRecord;
?>