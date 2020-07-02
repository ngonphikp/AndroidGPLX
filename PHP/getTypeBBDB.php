<?php 
    include "connect.php";

    //Tạo mảng ---> mảng string
    $mang = array();    

    //Thực hiện truy vấn
    // distinct --> Lấy duy nhất
    $sql = "SELECT DISTINCT loai FROM BBDB";
    $result = $conn->query($sql);
    foreach ($result as $row) {
        //Thêm vào mảng
        $mang[] = $row['loai'];
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>