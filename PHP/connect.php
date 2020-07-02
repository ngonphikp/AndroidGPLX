<?php
    //Kết nối database    
    $hostname = "localhost";
    $username = "id8713292_androidwsv";
    $password = "Phi03473600550";
    $databasename = "id8713292_gplx";

    // $hostname = "fdb25.awardspace.net";
    // $username = "3014080_gplx";
    // $password = "Phi03473600550";
    // $databasename = "3014080_gplx";

    //$conn = mysqli_connect($hostname, "root", "", "db_gplx");
    $conn = mysqli_connect($hostname, $username, $password, $databasename);
    mysqli_query($conn, "SET NAMES 'utf8'");
    if ($conn->connect_error) die("Kết nối thất bại: " . $conn->connect_error);
?>