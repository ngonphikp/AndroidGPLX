<?php 
    include "connect.php";

    //Tạo Class
    class BBDB{
        function __construct($id, $tieuDe, $noiDung, $hinhAnh, $loai){
            $this->Id = $id;
            $this->TieuDe = $tieuDe;
            $this->NoiDung = $noiDung;
            $this->HinhAnh = $hinhAnh;
            $this->Loai = $loai;
        }
    }

    //Tạo mảng --> object kiểu BBDB
    $mang = array();   

    // $_POST['loai'] = "Biển báo cấm";

    //Thực hiện truy vấn
    if (isset($_POST['loai'])) {
        $loai = $_POST['loai'];        
        $sql = "SELECT * FROM BBDB WHERE loai = '$loai'";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = new BBDB($row['id'], $row['tieuDe'], $row['noiDung'], $row['hinhAnh'], $row['loai']);        
        }        
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>