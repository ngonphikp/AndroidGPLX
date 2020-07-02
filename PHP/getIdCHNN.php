<?php 
    include "connect.php";

    //Tạo mảng
    $mang = array();  

    // $_POST['tenBang'] = "F";

    // Thực hiện truy vấn
    // Nếu bằng A1
    if (isset($_POST['tenBang']) && $_POST['tenBang'] == "A1") {
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Khái niệm quy tắc' and flag ='1') As random ORDER BY RAND() LIMIT 9;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Hệ thống biển báo' and flag ='1') As random ORDER BY RAND() LIMIT 5;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Sa hình' and flag ='1') As random ORDER BY RAND() LIMIT 5;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Văn hóa đạo đức' and flag ='1') As random ORDER BY RAND() LIMIT 1;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
    } else {
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Khái niệm quy tắc') As random ORDER BY RAND() LIMIT 9;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
        $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Văn hóa đạo đức') As random ORDER BY RAND() LIMIT 1;";
        $result = $conn->query($sql);
        foreach ($result as $row) {
            //Thêm vào mảng
            $mang[] = $row['id'];
        }
        // Nếu bằng A2, A3, A4
        if ($_POST['tenBang'] == "A2" || $_POST['tenBang'] == "A3" || $_POST['tenBang'] == "A4") {           
            $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Hệ thống biển báo') As random ORDER BY RAND() LIMIT 5;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            // Nếu bằng A3, A4
            if ($_POST['tenBang'] == "A3" || $_POST['tenBang'] == "A4") {
                $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Sa hình') As random ORDER BY RAND() LIMIT 4;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
                $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Nghiệp vụ vận tải') As random ORDER BY RAND() LIMIT 1;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
            } 
            // Nếu bằng A2
            else {
                $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Sa hình') As random ORDER BY RAND() LIMIT 5;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
            }
        } else {
            $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Hệ thống biển báo') As random ORDER BY RAND() LIMIT 9;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Sa hình') As random ORDER BY RAND() LIMIT 9;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Nghiệp vụ vận tải') As random ORDER BY RAND() LIMIT 1;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $sql = "SELECT id FROM (SELECT id FROM CauHoi WHERE loai = 'Kỹ thuật lái xe') As random ORDER BY RAND() LIMIT 1;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
        }           
    }
    

    //Xuất dạng JSON
    echo json_encode($mang);

?>