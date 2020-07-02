<?php 
    include "connect.php";

    //Tạo Class
    class Luat{
        function __construct($id, $tieuDe, $hinhAnh, $noiDung, $loai, $tienPhat){
            $this->Id = $id;
            $this->TieuDe = $tieuDe;            
            $this->HinhAnh = $hinhAnh;
            $this->NoiDung = $noiDung;
            $this->Loai = $loai;
            $this->TienPhat = $tienPhat;
        }
    }

    //Tạo mảng
    $mang = array();  

    // $_POST['loai'] = "Xe Máy";

    //Thực hiện truy vấn
    if (isset($_POST['loai'])) {
        $loai = $_POST['loai'];        
        $sql = "SELECT * FROM Luat WHERE loai = '$loai'";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = new Luat($row["id"], $row["tieuDe"], $row["hinhAnh"], $row["noiDung"], $row["loai"], $row['tienPhat']);
        }       
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>