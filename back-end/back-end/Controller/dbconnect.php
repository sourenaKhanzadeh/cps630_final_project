<?php
class dbconnect{
    public function connect(){
        $host = 'localhost';
        $user = 'suren';
        $pass = 'root';
        $db = 'P2S_WEB_APP';
        $connection = mysqli_connect($host,$user,$pass,$db);

        if ($connection === false) {
          die("ERROR: Could not connect." . mysqli_connect_error());
        }
        return $connection;
     }
}
