<?php 
    include "connect.php";

    //Tạo mảng
    $length = 0;    

    // $_POST['tenBang'] = "E";
    // Thực hiện truy vấn  
    if (isset($_POST['tenBang'])) {
        $sql = ($_POST['tenBang'] == "A1") ? "SELECT FLOOR(COUNT(ch.id) / 9) as 'length' FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc' and flag = '1'" : $sql = "SELECT FLOOR(COUNT(ch.id) / 9) as 'length' FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc'";
        $result = $conn->query($sql);        
        foreach ($result as $row) {
            //Thêm vào mảng            
            $length = $row['length'];           
        }
    }
    
    //Xuất dạng JSON
    echo json_encode($length);

?>