<?php
 
 $use=$_GET["use"];
 $ID=$_GET["ID"];
 $name=$_GET["name"];
 
 $BS=$_GET["BS"];

 date_default_timezone_set("Asia/Bangkok");
$strAccessToken = "vP6AKZ8YU/hpx5aev1ZbonArtyg6FiMBkfiSs1C4wTSaH2sHanWyoM46Nmyrqn3US0ggfmaGetScRVg0vsLq7OjvXTQl+GwrGJuoliAaCtKGoukAaWmQR+EyjSVo6NJheAQrsQ9QtjoBZCbzObDGPQdB04t89/1O/w1cDnyilFU=";
 
$strUrl = "https://api.line.me/v2/bot/message/push";
 
$arrHeader = array();
$arrHeader[] = "Content-Type: application/json";
$arrHeader[] = "Authorization: Bearer {$strAccessToken}";
 
$arrPostData = array();
$arrPostData['to'] = $use;
$arrPostData['messages'][0]['type'] = "text";
$arrPostData['messages'][0]['text'] = "patient ID : ".$ID." Name : ".$name."BloodSugar: ".$BS." Time : ".date("H:i:s")." Date : ".date("Y-m-d")." ";
 
 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,$strUrl);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $arrHeader);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($arrPostData));
curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$result = curl_exec($ch);
echo json_encode($arrPostData);
echo $use;
curl_close ($ch);
 
?>