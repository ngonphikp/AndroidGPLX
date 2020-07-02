<?php 
    include "connect.php";

    //Tạo mảng
    $mang = array();  

    // $_POST['tenBang'] = "A1";
    // $_POST['stt'] = 0;

    if (isset($_POST['stt'])) {
        $stt = $_POST['stt'];
        // Thực hiện truy vấn
        // Nếu bằng A1
        if (isset($_POST['tenBang']) && $_POST['tenBang'] == "A1") {
            $start = $stt * 9;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc' and ch.flag = '1' LIMIT $start, 9;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $start = $stt * 5;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Hệ thống biển báo' and ch.flag = '1' LIMIT $start, 5;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $start = $stt * 5;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Sa hình' and ch.flag = '1' LIMIT $start, 5;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $start = $stt;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Văn hóa đạo đức' and ch.flag = '1' LIMIT $start, 1;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
        } else {
            $start = $stt * 9;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Khái niệm quy tắc' LIMIT $start, 9;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            $start = $stt;
            $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Văn hóa đạo đức' LIMIT $start, 1;";
            $result = $conn->query($sql);
            foreach ($result as $row) {
                //Thêm vào mảng
                $mang[] = $row['id'];
            }
            // Nếu bằng A2, A3, A4
            if ($_POST['tenBang'] == "A2" || $_POST['tenBang'] == "A3" || $_POST['tenBang'] == "A4") {     
                $start = $stt * 5;       
                $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Hệ thống biển báo' LIMIT $start, 5;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
                // Nếu bằng A3, A4
                if ($_POST['tenBang'] == "A3" || $_POST['tenBang'] == "A4") {
                    $start = $stt * 4;
                    $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Sa hình' LIMIT $start, 4;";
                    $result = $conn->query($sql);
                    foreach ($result as $row) {
                        //Thêm vào mảng
                        $mang[] = $row['id'];
                    }
                    $start = $stt;
                    $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Nghiệp vụ vận tải' LIMIT $start, 1;";
                    $result = $conn->query($sql);
                    foreach ($result as $row) {
                        //Thêm vào mảng
                        $mang[] = $row['id'];
                    }
                } 
                // Nếu bằng A2
                else {
                    $start = $stt * 5;
                    $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Sa hình' LIMIT $start, 5;";
                    $result = $conn->query($sql);
                    foreach ($result as $row) {
                        //Thêm vào mảng
                        $mang[] = $row['id'];
                    }
                }
            } else {
                $start = $stt * 9;
                $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Hệ thống biển báo' LIMIT $start, 9;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
                $start = $stt * 9;
                $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Sa hình' LIMIT $start, 9;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
                $start = $stt;
                $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Nghiệp vụ vận tải' LIMIT $start, 1;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
                $start = $stt;
                $sql = "SELECT ch.id FROM CauHoi ch WHERE loai = 'Kỹ thuật lái xe' or loai = 'Cấu tạo sửa chữa' LIMIT $start, 1;";
                $result = $conn->query($sql);
                foreach ($result as $row) {
                    //Thêm vào mảng
                    $mang[] = $row['id'];
                }
            }           
        }
    }

    //Xuất dạng JSON
    echo json_encode($mang);

?>