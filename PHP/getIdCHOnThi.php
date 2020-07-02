<?php 
    include "connect.php";

    //Tạo mảng
    $mang = array();  

    // $_POST['tenBang'] = "E";
    // $_POST['loai'] = "Khái niệm quy tắc";
    // Thực hiện truy vấn  

    if (isset($_POST['loai'])) {
        $loai = $_POST['loai'];
        $sql = (isset($_POST['tenBang']) && $_POST['tenBang'] == "A1") ? "SELECT ch.id FROM CauHoi ch WHERE ch.loai = '$loai' and ch.flag = '1'" : $sql = "SELECT ch.id FROM CauHoi ch WHERE ch.loai = '$loai'";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>