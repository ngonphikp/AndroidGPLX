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

    //Tạo mảng
    $mang = array();    

    //Thực hiện truy vấn
    $sql = "SELECT * FROM BBDB";
    $result = $conn->query($sql);
    foreach ($result as $row) {
        //Thêm vào mảng
        $mang[] = new BBDB($row["id"], $row["tieuDe"], $row["noiDung"], $row["hinhAnh"], $row["loai"]);
    }
    
    //Xuất dạng JSON
    echo json_encode($mang);

?>