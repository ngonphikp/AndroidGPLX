 <?php 
    include "connect.php";

    //Tạo mảng
    $mang = array();    

    //$_POST['loai'] = "Sa hình";

    //Thực hiện truy vấn
    if (isset($_POST['loai'])) {
        $loai = $_POST['loai'];        
        $sql = "SELECT noiDung FROM MTLT WHERE loai = '$loai'";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['noiDung'];        
        }        
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>