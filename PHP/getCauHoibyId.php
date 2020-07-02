<?php 
    include "connect.php";

    //Tạo Class
    class CauHoi{
        function __construct($id, $noiDung, $hinhAnh){
            $this->Id = $id;
            $this->NoiDung = $noiDung;
            $this->HinhAnh = $hinhAnh;
        }
    }

    // $_POST['id'] = 20;

    //Thực hiện truy vấn
    if (isset($_POST['id'])) {
        $id = $_POST['id'];        
        $sql = "SELECT id, noiDung, hinhAnh FROM CauHoi WHERE id = $id ";
        $result = $conn->query($sql);     
        foreach ($result as $row) {
            //Thêm vào mảng
            $cauhoi = new CauHoi($row['id'], $row['noiDung'], $row['hinhAnh']);        
        }
        
        //Xuất dạng JSON
        echo json_encode($cauhoi);
    }

?>