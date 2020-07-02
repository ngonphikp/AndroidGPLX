<?php 
    include "connect.php";    

    // Post
    // $_POST['tenBang'] = "B1";

    //Tạo mảng Loai
    $arrLoai = array();   
    if (isset($_POST['tenBang'])) {
        //Thực hiện truy vấn
        $tenBang = $_POST['tenBang'];
        $sql = "SELECT loai FROM CauHinh ch WHERE ch.tenBang = '$tenBang' ";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $arrLoai[] = $row['loai'];
        }
    }

    //Tạo mảng Size
    $arrSize = array();
    foreach ($arrLoai as $loai) {
        $sql = (isset($_POST['tenBang']) && $_POST['tenBang'] == "A1") ? "SELECT COUNT(ch.id) as'size' FROM CauHoi ch WHERE ch.loai = '$loai' and ch.flag = '1'" : $sql = "SELECT COUNT(ch.id) as'size' FROM CauHoi ch WHERE ch.loai = '$loai'";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $arrSize[] = $row['size'];
        }
    }

    //Tạo mảng Hinh Anh  (mảng cố định --> Link URL trên sever)
    $arrHinhAnh = array();
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/knqt.jpg";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/htbb.jpg";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/sh.png";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/vhdd.jpg";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/nvvt.png";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/ktlx.jpg";
    $arrHinhAnh[] = "https://androidwsv.000webhostapp.com/HinhAnh/HLT/ctsc.jpg";

    //Tạo Class
    class HLT{
        function __construct($loai, $hinhAnh, $size){            
            $this->HinhAnh = $hinhAnh;
            $this->Loai = $loai;
            $this->Size = $size;
        }
    }

    //Tạo mảng Học Lý Thuyết
    $arrHLT = array();
    for ($i=0; $i < count($arrLoai); $i++) { 
        $loai = $arrLoai[$i];
        $hinhAnh = $arrHinhAnh[$i];
        $size = $arrSize[$i];
        $arrHLT[] = new HLT($loai, $hinhAnh, $size);
    }

    //Xuất dạng JSON
    // echo json_encode($arrLoai);
    // echo "<br>";
    // echo json_encode($arrSize);
    // echo "<br>";
    // echo json_encode($arrHinhAnh);
    // echo "<br>";
    echo json_encode($arrHLT);

?>