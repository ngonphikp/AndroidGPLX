<?php 
    include "connect.php";

    // $_POST['tenBang'] = "E";

    //Tạo Class
    class ThiSatHach{
        function __construct($current, $size, $time, $condition){
            $this->Current = $current;
            $this->Size = $size;
            $this->Time = $time;
            $this->Condition = $condition;
        }
    }

    //Tạo mảng
    $mang = array();        

    //Tạo biến
    $length = 0;    
    
    // Thực hiện truy vấn  
    if (isset($_POST['tenBang'])) {
        $sql = ($_POST['tenBang'] == "A1") ? "SELECT FLOOR(COUNT(ch.id) / 9) as 'length' FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc' and flag = '1'" : $sql = "SELECT FLOOR(COUNT(ch.id) / 9) as 'length' FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc'";
        $result = $conn->query($sql);        
        foreach ($result as $row) {
            //Thêm vào mảng            
            $length = $row['length'];           
        }

        $tenBang = $_POST['tenBang'];  
        //Thực hiện truy vấn
        $sql = "SELECT soCau, thoiGian, dkDat FROM Bang WHERE tenBang = '$tenBang' ";
        $result = $conn->query($sql);
        $temp;
        foreach ($result as $row) {
            $temp = $row;
        }

        for ($i=0; $i < $length; $i++) { 
            //Thêm vào mảng
            $mang[] = new ThiSatHach(0, $temp["soCau"], $temp["thoiGian"], $temp["dkDat"]);
        }
    }
    
    //Xuất dạng JSON
    echo json_encode($mang);

?>