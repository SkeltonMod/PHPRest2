<?php
include "dbhelper.php";
include "credentialhelper.php";
header("Access-Control-Allow-Origin: *");
$key = $_POST['key'];
$dbhelper = new dbhelper("root","db_user","","localhost");
session_start();
if(isset($key)){
    switch ($key){
        case "insert":
            $userid = intval($_POST['userid']);
            $type = $_POST['type'];
            $lat = $_POST['lat'];
            $lng = $_POST['lng'];
            $date = $_POST['date'];
            $time = $_POST['time'];
            $barangay = $_POST['barangay'];
            $station = "Foobar";
            $dbhelper->setImageBin($_FILES['image']['name']);
            $incident_gen = $dbhelper->generateNumber(7);
            $image = $dbhelper->getImage($dbhelper->getImageBin(),$userid."_".$type."_".$date);
            $dbhelper->setFields("informant_id","type","latitude","longitude","date","time","location","police_station_no","image");
            $dbhelper->pushDB("incident",$userid,$type,$lat,$lng,$date,$time,$barangay,$station,$image);
            $dbhelper->setFields("incident_no","datetime_acknowledged","status", "informant_report_id");
            $dbhelper->pushDB("incident_details", $incident_gen, date("Y-m-d h:i:s"), "Pending", $userid);
            $response[] = array(
                "error"=>false,
                "message"=>"Incident Reported Successfully",
            );
            $data = array(
                "data"=>$response
            );
            echo json_encode($data);
        break;
        case "getIncidents":
            $userid = $_POST['userid'];
            $response = $dbhelper->getCurrentData("incident",intval($userid),"informant_id","*");
            echo json_encode($response);
            break;
    }
}