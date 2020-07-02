<?php 
    include "connect.php";

    //Tạo Class
    class Bang{
        function __construct($tenBang, $noiDung){
            $this->TenBang = $tenBang;
            $this->NoiDung = $noiDung;
        }
    }

    //Tạo mảng
    $mang = array();    

    //Thực hiện truy vấn
    $sql = "SELECT tenBang, noiDung FROM Bang";
    $result = $conn->query($sql);
    foreach ($result as $row) {
        //Thêm vào mảng
        $mang[] = new Bang($row["tenBang"], $row["noiDung"]);
    }
    
    //Xuất dạng JSON
    echo json_encode($mang);

?>