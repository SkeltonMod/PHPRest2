<?php
include "dbhelper.php";
include "credentialhelper.php";
header("Access-Control-Allow-Origin: *");
$dbhelper = new dbhelper("root","db_user","","localhost");
session_start();

$col1 = explode(",",$dbhelper->stack("Table","Table2","Table3"));
$row1 = explode(",", $dbhelper->stack("id","name","age"));

echo "SELECT ";
for($i = 0; $i < count($col1); ++$i){
    echo $col1[$i].".".$row1[$i]." ";
}