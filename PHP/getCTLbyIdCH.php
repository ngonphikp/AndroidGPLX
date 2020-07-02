<?php 
    include "connect.php";

    //Tạo Class
    class CauTraLoi{
        function __construct($id, $noiDung, $kiemTra, $idCH){
            $this->Id = $id;
            $this->NoiDung = $noiDung;
            $this->KiemTra = $kiemTra;
            $this->IdCH = $idCH;
        }
    }

    //Tạo mảng
    $mang = array(); 

    // $_POST['id'] = 1;

    //Thực hiện truy vấn
    if (isset($_POST['id'])) {
        $id = $_POST['id'];        
        $sql = "SELECT * FROM CauTraLoi WHERE idCH = $id ";
        $result = $conn->query($sql);     
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = new CauTraLoi($row['id'], $row['noiDung'], $row['kiemTra'], $row['idCH']);        
        }
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>