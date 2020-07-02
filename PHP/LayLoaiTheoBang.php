<?php 
    include "connect.php";

    //Tạo mảng
    $mang = array();    

    // $_POST['tenBang'] = "F";

    //Thực hiện truy vấn
    if (isset($_POST['tenBang'])) {
        //Thực hiện truy vấn
        $tenBang = $_POST['tenBang'];
        $sql = "SELECT loai FROM CauHinh ch WHERE ch.tenBang = '$tenBang' ";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['loai'];
        }      
    }
    
    //Xuất dạng JSON
    echo json_encode($mang);

?>