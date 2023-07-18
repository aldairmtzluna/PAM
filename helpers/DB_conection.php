<?php
   /* $DB_host = "10.38.10.25";
    $DB_user = "myudvpam";
    $DB_pass = "&LiD6ZxiGs6xiiU";
    $DB_name = "pam";
    $DB_port = "3306";*/

    $DB_host = "localhost";
    $DB_user = "root";
    $DB_pass = "";
    $DB_name = "pam";
    // Create connection
    $DB_conection = mysqli_connect($DB_host, $DB_user, $DB_pass, $DB_name);
    // Check connection
    $DB_conection = new mysqli($DB_host, $DB_user, $DB_pass, $DB_name); 
    if(mysqli_connect_errno()){
        echo'No se pudo hacer la conexion a la DB: ', mysqli_connect_error();
         exit();
    }
    mysqli_query($DB_conection, "SET NAMES 'utf8', lc_time_names = 'es_MX'");
?>