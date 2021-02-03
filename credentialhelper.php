<?php

//this one uses the generic DBHelper

class credentialhelper
{
    private $conn;
    private $userid;
    /**
     * credentialhelper constructor.
     * @param $conn
     */
    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    /**
     * @param mixed $userid
     */
    public function setUserid($userid)
    {
        $this->userid = $userid;
    }

    /**
     * @return mixed
     */
    public function getUserid()
    {
        return $this->userid;
    }

    function getCredential($tablename,$column,$selector){
        //echo "SELECT ". $column ." FROM ".$tablename." WHERE ".$column." = ".'$selector';
        $row = array();
        $result = $this->conn->query("SELECT ".$column." FROM ".$tablename. " WHERE ".$column. "="."\"".$selector."\"");
        if($result->num_rows > 0){
            for($i = 0; $i != $result->num_rows; ++$i){
                $row = mysqli_fetch_assoc($result);
            }

        }
        return $row;
    }
    function checkLogin($tablename,$column,$selector){
        $result = $this->conn->query("SELECT ".$column." FROM ".$tablename. " WHERE ".$column. "="."\"".$selector."\"");
        if($result->num_rows > 0){
            return true;
        }
        return false;
    }

    function createSession(){
        $_SESSION['user_id'] = $this->userid;
    }
    function checkSession(){
        if(isset($_SESSION['user_id'])){
            return true;
        }else{
            return false;
        }
    }
    function getSession(){
        if(isset($_SESSION['user_id'])){
            return $_SESSION['user_id'];
        }else{
            return null;
        }
    }
}