<?php
include "dbhelper.php";
include "credentialhelper.php";
$key = $_POST['key'];
$dbhelper = new dbhelper("root","db_user","","localhost");
session_start();
if(isset($key)){
    switch ($key){
        case "insert":
            $credentials = new credentialhelper($dbhelper->DBConn());
            $fname = $_POST['firstName'];
            $lname = $_POST['lastName'];
            $mname = $_POST['middleName'];
            $suffix = $_POST['suffix'];
            $email = $_POST['email'];
            $currentAddress = $_POST['currentAddress'];
            $primaryAddress = $_POST['primaryAddress'];
            $birthPlace = $_POST['birthPlace'];
            $birthDate = $_POST['birthDate'];
            $phoneNumber = $_POST['phoneNumber'];
            $occupation = $_POST['occupation'];
            $workAddress = $_POST['workAddress'];
            $highestEducation = $_POST['highestEducation'];
            $civilStatus = $_POST['civilStatus'];
            $citizenship = $_POST['citizenship'];
            $gender = $_POST['gender'];
            $dbhelper->setImageBin($_FILES['image']['name']);
            $password = $_POST['password'];
            $userid = generateString("user");
            $image = $dbhelper->getImage($dbhelper->getImageBin(),$userid);
            $dbhelper->setFields("userid","firstname","suffix","lastname","middlename","email","password","citizenship",
                "civilstatus","dob","educ","gender","mobilenumber","nickname","pob","currentaddress","homeaddress","occupation","workaddress","image");
            if($credentials->checkLogin("informants","email",$email)){
                $response[] = array(
                    "error"=>true,
                    "message"=>"User with the same Email already Exist!",
                );
            }else{
                $dbhelper->pushDB("informants",$userid,$fname,$suffix,$lname,$mname,$email,$password,$citizenship,$civilStatus,$birthDate
                    ,$highestEducation,$gender,$phoneNumber,$fname,$birthPlace,$currentAddress,$primaryAddress,$occupation,$workAddress,$image);
                $response[] = array(
                    "error"=>false,
                    "message"=>"User Created!",
                );
            }
            $data = array(
                "data"=>$response
            );
            echo json_encode($data);
            break;
        case "login":
            $loginData = array();
            $email = $_POST['email'];
            $password = $_POST['password'];
            $credentials = new credentialhelper($dbhelper->DBConn());
            array_push($loginData,$credentials->getCredential("informants","email",$email),
                $credentials->getCredential("informants","password",$password));
            $userid = $dbhelper->getCurrentData("informants",$email,"email","userid");

            if($credentials->checkLogin("informants","email",$email) && $credentials->checkLogin("informants","password",$password)) {
                $response[] = array(
                    "error"=>false,
                    "message"=>"User logged in!",
                    "userid"=>$userid[0]['userid'],
                    "user"=>$loginData[0]['email']
                );
                $credentials->setUserid($userid[0]['userid']);
                $credentials->createSession();
            }else{
                 $response[] = array(
                    "error"=>true,
                    "message"=>"Something went Wrong",
                    "user"=>$loginData[0]['email'],
                );
            }
            $data = array(
              "data"=>$response
            );
            echo json_encode($data);
            break;
        case "checkSession":
            $credentials = new credentialhelper($dbhelper->DBConn());

            if($credentials->getSession()){
                $response[] = array(
                    "error"=>false,
                    "message"=>"User is ".$credentials->getSession(),
                    "user"=>$credentials->getSession(),
                );
            }else{
                $response[] = array(
                    "error"=>false,
                    "message"=>"null",
                    "user"=>$credentials->getSession(),
                );

            }
            $data = array(
                "data"=>$response
            );
            echo json_encode($data);
            break;
        case "logout":
            session_unset();
            $response[] = array(
                "error"=>false,
                "message"=>"Logged out",
            );
            $data = array(
                "data"=>$response
            );
            echo json_encode($data);
            break;
        case "getProfile":
            $response = $dbhelper->getCurrentData("informants",$_SESSION['user_id'],"userid","*");
            $data = array(
                "data" => $response
            );
            echo json_encode($data);
            break;
        case "editProfile":
            $fname = $_POST['firstName'];
            $lname = $_POST['lastName'];
            $mname = $_POST['middleName'];
            $suffix = $_POST['suffix'];
            $email = $_POST['email'];
            $currentAddress = $_POST['currentAddress'];
            $primaryAddress = $_POST['primaryAddress'];
            $phoneNumber = $_POST['phoneNumber'];
            $occupation = $_POST['occupation'];
            $workAddress = $_POST['workAddress'];
            $highestEducation = $_POST['highestEducation'];
            $citizenship = $_POST['citizenship'];
            $password = $_POST['password'];

            $image = $dbhelper->getImage( isset($_FILES["image"]["name"]) ?  $_FILES["image"]["name"] : null ,$_SESSION['user_id']);
            $dbhelper->setFields("firstname","suffix","lastname","middlename","email","password","citizenship","educ",
                "mobilenumber","nickname","currentaddress","homeaddress","occupation","workaddress","image");
           $edit = $dbhelper->editData("informants",$_SESSION['user_id'],"userid",
                $fname,$suffix,$lname,$mname,$email,$password,$citizenship,$highestEducation,$phoneNumber,$fname,$currentAddress,
                $primaryAddress,$occupation,$workAddress,$image);
            if($edit){
                $response[] = array(
                    "error"=>false,
                    "message"=>"User Record updated!!",
                    "user"=>$_SESSION['user_id']
                );
            }else{
                $response[] = array(
                    "error"=>true,
                    "message"=>"Something went wrong",
                );
            }
            $data = array(
                "data"=>$response
            );
            echo json_encode($data);
            break;
    }

}

function generateString($key){
    $n = 8;
    $characters = ($key === "password") ? '0123456789': "123456789";
    $randomString = '';

    for ($i = 0; $i < $n; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $randomString .= $characters[$index];
    }

    return ($key === "password") ? strval($randomString): intval($randomString);

}