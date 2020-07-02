-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 11, 2019 lúc 01:11 PM
-- Phiên bản máy phục vụ: 10.3.14-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `id8713292_gplx`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Bang`
--

CREATE TABLE `Bang` (
  `tenBang` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `soCau` int(11) NOT NULL,
  `thoiGian` int(11) NOT NULL,
  `dkDat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Bang`
--

INSERT INTO `Bang` (`tenBang`, `noiDung`, `soCau`, `thoiGian`, `dkDat`) VALUES
('A1', 'Xe mô tô 2 bánh có dung tích xilanh từ 50 đến dưới 175 cm3.', 20, 15, 16),
('A2', 'Xe mô tô 2 bánh có dung tích xilanh từ 175 cm3 trở lên và các loại xe quy định cho giấy phép hạng A1.', 20, 15, 16),
('A3', 'Cấp cho người lái xe để điều khiển xe mô tô ba bánh, bao gồm cả xe lam, xích lô máy và các loại xe quy định cho giấy phép lối xe hạng A1.', 20, 15, 18),
('A4', 'Cấp cho người lái xe để điều khiển các loại máy kéo nhỏ có trọng tải đến 1000 kg.', 20, 15, 18),
('B1', 'Ô tô chở người đến 9 chỗ ngồi, ô tô tải dưới 3500 Kg không kinh\r\ndoanh vận tải.', 30, 20, 26),
('B2', 'Ô tô chở người đến 9 chỗ ngồi, ô tải đầu kéo có 1 rơ móoc dưới 3500 Kg kinh doanh vận tải và các loại xe quy định cho giấy phép hạng B1.', 30, 20, 26),
('C', 'Ô tô tải trên 3500kg.', 30, 20, 28),
('D', 'Ô tô chở người từ 10-30 chỗ.', 30, 20, 28),
('E', 'Ô tô chở người trên 30 chỗ.', 30, 20, 28),
('F', 'Điều khiển các loại kéo, móc.', 30, 20, 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `BBDB`
--

CREATE TABLE `BBDB` (
  `id` int(11) NOT NULL,
  `tieuDe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhAnh` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `BBDB`
--

INSERT INTO `BBDB` (`id`, `tieuDe`, `noiDung`, `hinhAnh`, `loai`) VALUES
(1, 'Cấm máy kéo', 'Để báo đường cấm tất cả các loại máy kéo, kể cả máy kéo bánh hơi và bánh xích đi qua.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c1.PNG', 'Biển báo cấm'),
(2, 'Cấm xe người kéo, đẩy', 'Để báo đường cấm xe người kéo, đẩy đi qua. Biển không có giá trị cấm những xe nôi của trẻ em và phương tiện chuyên dùng để đi lại của người tàn tật', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c2.PNG', 'Biển báo cấm'),
(3, 'Cấm ô tô rẽ trái', 'Đường cấm tất cả các loại xe cơ giới kể cả mô tô 3 bánh có thùng xe rẽ trái, trừ mô tô hai bánh, xe gắn máy và các xe được ưu tiên theo luật lệ nhà nước', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c3.PNG', 'Biển báo cấm'),
(4, 'Đường cấm', 'Đường cấm tất cả các loại phương tiện (cơ giới và thôi sơ) đi lại cả hai hướng, trừ các xe được ưu tiên theo luật lệ nhà nước quy định', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c4.PNG', 'Biển báo cấm'),
(5, 'Ấn còi', 'Biểu thị xe cộ đi đến chỗ cắm biển đó thì phải ấn còi', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/hl5.PNG', 'Biển báo hiệu lệnh'),
(6, 'Hướng đi phải theo', 'để báo cho các loại xe (thô sơ và cơ giới) chỉ được đi thẳng', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/hl6.PNG', 'Biển báo hiệu lệnh'),
(7, 'Tuyến đường cầu vượt cắt qua', 'biểu thị tại cầu vượt, xe có thể đi thẳng hoặc theo chỉ dẫn trên hình vẽ để rẽ trái. Biển đặt tại vị trí thích hợp ngay trước khi vào đường rẽ trái hoặc qua cầu vượt', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/hl7.PNG', 'Biển báo hiệu lệnh'),
(8, 'Khách sạn', 'Để chỉ dẫn những nơi có khách sạn phục vụ khách đi đường', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd8.PNG', 'Biển báo chỉ dẫn'),
(9, 'Đường cụt', 'Để chỉ lối rẽ vào đường cụt', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd9.PNG', 'Biển báo chỉ dẫn'),
(10, 'Trạm sửa chữa', 'Để chỉ dẫn những nơi có đặt xưởng chuyên phục vụ sửa chữa ô tô, mô tô hỏng trên đường', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd10.PNG', 'Biển báo chỉ dẫn'),
(11, 'Đường một chiều', 'Để chỉ dẫn những đoạn đường chạy một chiều đặt sau ngã ba, ngã tư', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd11.PNG', 'Biển báo chỉ dẫn'),
(12, 'Bến xe buýt', 'Để chỉ dẫn những chỗ xe buýt dừng cho hành khách lên xuống', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd12.PNG', 'Biển báo chỉ dẫn'),
(13, 'Đường cao tốc', 'Để chỉ dẫn bắt đầu đường cao tốc. Quy chế sử dụng đường cao tốc phải được thực hiện nghiêm ngặt', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd13.PNG', 'Biển báo chỉ dẫn'),
(14, 'Biển báo phần đường cho người', 'Dùng để biểu thị vị trí thiết bị chuyên dùng cho người tàn tật', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd14.PNG', 'Biển báo chỉ dẫn'),
(15, 'Hết đường cao tốc', 'Để chỉ dẫn hết đường cao tốc', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/cd15.PNG', 'Biển báo chỉ dẫn '),
(16, 'Giao nhau với đường sắt không rào chắn', 'Báo trước sắp đến chỗ giao nhau giữa đường bộ và đường sắt không có rào chắn, không có người điểu khiển giao thông', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/nh16.PNG', 'Biển báo nguy hiểm'),
(17, 'Trẻ em', 'Báo trước là gần đến đoạn đường thường có trẻ em đi ngang qua hoặc tụ tập trên đường như vườn trẻ, trường học, câu lạc bộ đi qua.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/nh17.PNG', 'Biển báo nguy hiểm'),
(18, 'Giao nhau với đường ưu tiên', 'Trên đường không ưu tiên, biển này để báo trước sắp đến nơi giao nhau với đường ưu tiên.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/nh18.PNG', 'Biển báo nguy hiểm'),
(19, 'Cấm đi thằng và rẽ trái', 'Biểu thị ở ngã tư, ngã năm đường phía trước cấm tất cả các loại xe đi thẳng và rẽ trái', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c19.PNG', 'Biển báo cấm'),
(20, 'Tốc độ tối đa cho phép', 'Cấm tất cả các loại xe cơ giới chạy với tốc độ tối đa vượt quá trị số ghi trê biển, trừ các xe được ưu tiên theo luật lệ Nhà nước quy định.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/c20.PNG', 'Biển báo cấm'),
(21, 'Đường dành cho người đi bộ ', 'Báo đường dành cho người đi bộ. Các loại xe cơ giới và thô sở kể cả các xe được ưu tiên theo luật lệ Nhà nước quy định không được phép đi vào đường đã đặt biển báo này, trừ trường hợp đi cắt ngang qua nhưng phải đảm bảo tuyệt đối an toàn cho người đi bộ.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/hl21.PNG', 'Biển báo hiệu lệnh'),
(22, 'Nơi giao nhau chạy theo vòng', 'Báo cho các loại xe (cơ giới và thô sơ) phải chạy theo vòng đảo an toàn ở các ngã ba, ngã tư. Biển có hiệu lực bắt buộc các loại xe muốn chuyển hướng phải chạy vòng theo đảo an toàn, theo hướng mũi tên chỉ.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/hl22.PNG', 'Biển báo hiệu lệnh'),
(23, 'Gia súc', 'Để báo trước gần tới đoạn đường thường có gia súc thả rông hoặc lùa qua ngang đường nguy hiểm, đường ở vùng đồng cỏ của nông trường chăn nuôi, vùng thảo nguyên. Người lái xe có trách nhiệm dừng lại bảo đảm cho gia súc có thể qua đường không bị nguy hiểm.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/nh23.PNG', 'Biển báo nguy hiểm'),
(24, 'Đường trơn', 'Để báo trước sắp tới đoạn đường có thể xảy ra trơn trượt đặc biệt là khi thời tiết xấu, mưa phùn cần tránh hãm phanh, tăng ga, sang số đột ngột hoặc xe chạy với tốc độ cao sẽ nguy hiểm. Khi gặp biển này tốc độ xe chạy phải giảm kịp thời và thận trọng', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/nh24.PNG', 'Biển báo nguy hiểm'),
(25, 'Vạch nằm ngang 13', 'Là vạch hình tam giác cân màu trắng vạch chỉ rõ vĩ trí mà lái xe phải dừng để nhường cho các phương tiện khác ở đường ưu tiên.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd25.PNG', 'Vạch kẻ đường'),
(26, 'Vạch nằm ngang 2', 'Vạch liền, màu trắng, rộng 20cm, dùng để xác định mép phần xe chạy trên các trục đường. Xe chạy được phép cắt ngang hoặc đè lên vạch khi cần thiết.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd26.PNG', 'Vạch kẻ đường'),
(27, 'Vạch nằm đứng 3', 'Là vạch đen trắng xen kẽ nằm ngang. Vạch kẻ xung quanh các cột tròn đặt trên các đảo an toàn hoặc trên giải phân cách và các nơi khác', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd27.PNG', 'Vạch kẻ đường'),
(28, 'Vạch nằm ngang 16.1', '\"Ngựa vằn\" màu trắng, xác định đảo phân chia dòng phương tiện ngược chiều nhau', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd28.PNG', 'Vạch kẻ đường'),
(29, 'Vạch nằm đứng 5', 'Kẻ ở thành rào có chắn, chỗ đường vòng có bán kính nhỏ, đường cao hơn so với khu vực xung quanh, dốc xuống với những nơi nguy hiểm khác.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd29.PNG', 'Vạch kẻ đường'),
(30, 'Vạch nằm ngang 17', 'Vạch sơn sóng màu vàng quay định vị trí dừng của xe các phương tiện vận tại. Theo tuyến quay định hoặc nơi tập kết của taxi, cấm dừng hoặc đỗ của bất kì một loại phương tiện nào về cả hai phía và cách vạch 15cm.', 'https://androidwsv.000webhostapp.com/HinhAnh/BBDB/kd30.PNG', 'Vạch kẻ đường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CauHinh`
--

CREATE TABLE `CauHinh` (
  `id` int(11) NOT NULL,
  `tenBang` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `CauHinh`
--

INSERT INTO `CauHinh` (`id`, `tenBang`, `loai`) VALUES
(1, 'A1', 'Khái niệm quy tắc'),
(2, 'A1', 'Hệ thống biển báo'),
(3, 'A1', 'Sa hình'),
(4, 'A1', 'Văn hóa đạo đức'),
(5, 'A2', 'Khái niệm quy tắc'),
(6, 'A2', 'Hệ thống biển báo'),
(7, 'A2', 'Sa hình'),
(8, 'A2', 'Văn hóa đạo đức'),
(9, 'A3', 'Khái niệm quy tắc'),
(10, 'A3', 'Hệ thống biển báo'),
(11, 'A3', 'Sa hình'),
(12, 'A3', 'Văn hóa đạo đức'),
(13, 'A3', 'Nghiệp vụ vận tải'),
(14, 'A4', 'Khái niệm quy tắc'),
(15, 'A4', 'Hệ thống biển báo'),
(16, 'A4', 'Sa hình'),
(17, 'A4', 'Văn hóa đạo đức'),
(18, 'A4', 'Nghiệp vụ vận tải'),
(19, 'B1', 'Khái niệm quy tắc'),
(20, 'B1', 'Hệ thống biển báo'),
(21, 'B1', 'Sa hình'),
(22, 'B1', 'Văn hóa đạo đức'),
(23, 'B1', 'Nghiệp vụ vận tải'),
(24, 'B1', 'Kỹ thuật lái xe'),
(25, 'B1', 'Cấu tạo sửa chữa'),
(26, 'B2', 'Khái niệm quy tắc'),
(27, 'B2', 'Hệ thống biển báo'),
(28, 'B2', 'Sa hình'),
(29, 'B2', 'Văn hóa đạo đức'),
(30, 'B2', 'Nghiệp vụ vận tải'),
(31, 'B2', 'Kỹ thuật lái xe'),
(32, 'B2', 'Cấu tạo sửa chữa'),
(33, 'C', 'Khái niệm quy tắc'),
(34, 'C', 'Hệ thống biển báo'),
(35, 'C', 'Sa hình'),
(36, 'C', 'Văn hóa đạo đức'),
(37, 'C', 'Nghiệp vụ vận tải'),
(38, 'C', 'Kỹ thuật lái xe'),
(39, 'C', 'Cấu tạo sửa chữa'),
(40, 'D', 'Khái niệm quy tắc'),
(41, 'D', 'Hệ thống biển báo'),
(42, 'D', 'Sa hình'),
(43, 'D', 'Văn hóa đạo đức'),
(44, 'D', 'Nghiệp vụ vận tải'),
(45, 'D', 'Kỹ thuật lái xe'),
(46, 'D', 'Cấu tạo sửa chữa'),
(47, 'E', 'Khái niệm quy tắc'),
(48, 'E', 'Hệ thống biển báo'),
(49, 'E', 'Sa hình'),
(50, 'E', 'Văn hóa đạo đức'),
(51, 'E', 'Nghiệp vụ vận tải'),
(52, 'E', 'Kỹ thuật lái xe'),
(53, 'E', 'Cấu tạo sửa chữa'),
(54, 'F', 'Khái niệm quy tắc'),
(55, 'F', 'Hệ thống biển báo'),
(56, 'F', 'Sa hình'),
(57, 'F', 'Văn hóa đạo đức'),
(58, 'F', 'Nghiệp vụ vận tải'),
(59, 'F', 'Kỹ thuật lái xe'),
(60, 'F', 'Cấu tạo sửa chữa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CauHoi`
--

CREATE TABLE `CauHoi` (
  `id` int(11) NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhAnh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loai` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `CauHoi`
--

INSERT INTO `CauHoi` (`id`, `noiDung`, `hinhAnh`, `loai`, `flag`) VALUES
(1, 'Khái niệm \"phần đường xe chạy\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(2, '\"Vạch kẻ đường\" được hiểu thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(3, 'Khái niệm \"làn đường\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(4, 'Khái niệm \"đường bộ\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(5, 'Khái niệm \"đường bộ\" được hiểu như thế là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(6, 'Khái niệm \"dải phân cách\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(7, 'Dải phân cách trên đường bộ có những loại nào?', NULL, 'Khái niệm quy tắc', '1'),
(8, 'Khái niệm \"đường ưu tiên\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(9, 'Khái niệm \"phương tiện giao thông cơ giới đường bộ\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(10, '\"Phương tiện giao thông đường bộ\" gồm những loại nào?', NULL, 'Khái niệm quy tắc', '1'),
(11, '\"Phương tiện tham gia giao thông đường bộ\" gồm những loại nào?', NULL, 'Khái niệm quy tắc', '1'),
(12, '\"Người tham gia giao thông đường bộ\" gồm những đối tượng nào?', NULL, 'Khái niệm quy tắc', '1'),
(13, 'Khái niệm \"người điều khiển giao thông\" được hiểu như thế nào là đúng?', NULL, 'Khái niệm quy tắc', '1'),
(14, 'Các hành vi nào ghi ở dưới đây bị nghiêm cấm?', NULL, 'Khái niệm quy tắc', '1'),
(15, 'Những hành vi nào ghi ở dưới đây bị nghiêm cấm', NULL, 'Khái niệm quy tắc', '1'),
(16, 'Người điều khiển phương tiện giao thông đường bộ mà trong cơ thể có chất ma túy có bị nghiêm cấm hay không?', NULL, 'Khái niệm quy tắc', '1'),
(17, 'Người điều khiển xe mô tô, xe gắn máy trê đường mà trong máu có nồng độ cồn vượt quá bao nhiêu thì bị cấm?', NULL, 'Khái niệm quy tắc', '1'),
(18, 'Người điều khiển xe ô tô, máy kéo, xe máy chuyên dùng trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá bao nhiêu thì bị cấm?', NULL, 'Khái niệm quy tắc', '1'),
(19, 'Người điều khiển xe mô tô, xe gắn máy trên đường mà trong khí thở có nồng độ cồn vượt quá bao nhiêu thì bị cấm?', NULL, 'Khái niệm quy tắc', '1'),
(20, 'Hành vi giao xe cơ giới, xe máy chuyên dùng cho người không đủ điều kiện để điều khiển xe tham gia giao thông có bị nghiêm cấm hay không?', NULL, 'Khái niệm quy tắc', '1'),
(21, 'Biển nào cấm người đi bộ', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb1.PNG', 'Hệ thống biển báo', '1'),
(22, 'Gặp biển nào người lái xe phải nhường đường cho người đi bộ?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb2.PNG', 'Hệ thống biển báo', '1'),
(23, 'Biển nào chỉ đường dành cho người đi bộ, các loại xe không được đi vào khi gặp biển này?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb3.PNG', 'Hệ thống biển báo', '1'),
(24, 'Biển nào báo hiệu sắp đến chỗ giao nhau nguy hiểm', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb4.PNG', 'Hệ thống biển báo', '1'),
(25, 'Biển nào báo hiệu giao nhau có tín hiệu đèn?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb5.PNG', 'Hệ thống biển báo', '1'),
(26, 'Biển nào báo hiệu sắp đến chỗ giao nhau với đường sắt có rào chắn?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb6.PNG', 'Hệ thống biển báo', '1'),
(27, 'Biển nào báo hiệu nguy hiểm giao nhau với đường sắt', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb7.PNG', 'Hệ thống biển báo', '1'),
(28, 'Biển nào báo hiệu đường sắt giao nhau với đường bộ không có rào chắn?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb8.PNG', 'Hệ thống biển báo', '1'),
(29, 'Biển nào báo hiệu \"Hết đoạn đường ưu tiên\"?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb9.PNG', 'Hệ thống biển báo', '1'),
(30, 'Biển nào báo hiệu, chỉ dẫn xe đi trên đường này được quyền ưu tiên qua nơi giao nhau?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb10.PNG', 'Hệ thống biển báo', '1'),
(31, 'Biển nào báo hiệu giao nhau với đường không ưu tiên', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb11.PNG', 'Hệ thống biển báo', '1'),
(32, 'Biển nào báo hiệu giao nhau với đường ưu tiên?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb12.PNG', 'Hệ thống biển báo', '1'),
(33, 'Biển nào báo hiệu giao nhau với đường ưu tiên?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb13.PNG', 'Hệ thống biển báo', '1'),
(34, 'Biển nào báo hiệu \"Đường giao nhau\" của các tuyến đường cùng cấp?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb14.PNG', 'Hệ thống biển báo', '1'),
(35, 'Biển nào báo hiệu giao nhau với đường không ưu tiên?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb15.PNG', 'Hệ thống biển báo', '1'),
(36, 'Biển nào báo hiệu đường hai chiều?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb16.PNG', 'Hệ thống biển báo', ''),
(37, 'Biển nào báo hiệu phải giảm tốc độ, nhường đường cho xe cơ giới đi ngược chiều qua đường hẹp?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb17.PNG', 'Hệ thống biển báo', ''),
(38, 'Biển nào chỉ dẫn được ưu tiên qua đường hẹp?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb18.PNG', 'Hệ thống biển báo', ''),
(39, 'Biển nào báo hiệu cấm xe mô tô ba bánh đi vào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb19.PNG', 'Hệ thống biển báo', ''),
(40, 'Biển nào báo hiệu cấm xe mô tô hai bánh đi vào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb20.PNG', 'Hệ thống biển báo', ''),
(41, 'Hành vi điều khiển xe cơ giới chạy quá tốc độ quy định, giành đường, vượt ẩu có bị nghiêm cấm hay không?', NULL, 'Khái niệm quy tắc', '1'),
(42, 'Các hành vi nào sau đây bị nghiêm cấm?', NULL, 'Khái niệm quy tắc', '1'),
(43, 'Những hành vi nào sau đây bị cấm?', NULL, 'Khái niệm quy tắc', '1'),
(44, 'Khi xảy ra tai nạn giao thông, những hành vi nào ghi ở dưới đây bị nghiêm cấm', NULL, 'Khái niệm quy tắc', '1'),
(45, 'Hành vi bỏ trốn sau khi gây tai nạn để trốn tránh trách nhiệm hoặc khi có điều kiện mà cố ý không cứu giúp người bị tai nạn giao thông có bị nghiêm cấm hay không?', NULL, 'Khái niệm quy tắc', '1'),
(46, 'Việc sản xuất, mua bán, sử dụng biển số xe cơ giới, xe máy chuyên dùng được quy định như nào trong Luật giao thông đường bộ?', NULL, 'Khái niệm quy tắc', '1'),
(47, 'Người lái xe không được vượt xe khác khi gặp trường hợp nào ghi ở dưới đây?', NULL, 'Khái niệm quy tắc', '1'),
(48, 'Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông không được thực hiện những hành vi nào dưới đây?', NULL, 'Khái niệm quy tắc', ''),
(49, 'Khi điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy, những hành vi nào không được phép?', NULL, 'Khái niệm quy tắc', ''),
(50, 'Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông có được mang, vác vật cồng kềnh hay không?', NULL, 'Khái niệm quy tắc', ''),
(51, 'Người điều khiển xe mô tô hai bánh, ba bánh, xe gắn máy có được phép sử dụng xe để kéo, đầy các xe khác, vật khác khi tham gia giao thông không?', NULL, 'Khái niệm quy tắc', ''),
(52, 'Tại nơi đường giao nhau, khi đèn điều khiển giao thông có tín hiệu vàng, người điều khiển phương tiện phải thực hiện như thế nào?', NULL, 'Khái niệm quy tắc', ''),
(53, 'Bảo đảm trật tự, an toàn giao thông đường bộ là trách nhiệm của ai?', NULL, 'Khái niệm quy tắc', ''),
(54, 'Biển báo hiệu đường bộ gồm những nhóm nào, ý nghĩa từng nhóm?', NULL, 'Khái niệm quy tắc', ''),
(55, 'Tại nơi đường giao nhau, khi người điều khiển giao thông ra hiệu lệnh bằng hai tay hoặc một tay giang ngang để báo hiệu thì người tham gia giao thông phải đi như thế nào là đúng quy tắc giao thông?', NULL, 'Khái niệm quy tắc', ''),
(56, 'Tại nơi đường giao nhau, khi người điều khiển giao thông ra hiệu lệnh giơ tay thẳng đứng để báo hiệu thì người tham gia giao thông phải đi như thế nào?', NULL, 'Khái niệm quy tắc', ''),
(57, 'Tại nơi đường giao nhau, khi người điều khiển giao thông ra hiệu lệnh bằng tay phải giơ về phía trước để báo hiệu thì người tham gia giao thông phải đi như thế nào?', NULL, 'Khái niệm quy tắc', ''),
(58, 'Trên đường giao thông, khi hiệu lệnh của người điều khiển giao thông trái với hiệu lệnh của đèn hoặc biển báo hiệu thì người tham gia giao thông phải chấp hành theo hiệu lệnh nào?', NULL, 'Khái niệm quy tắc', ''),
(59, 'Tại nơi có biển hiệu cố định lại có báo hiệu tạm thời thì người tham gia giao thông phải chấp hành hiệu lệnh của báo hiệu nào?', NULL, 'Khái niệm quy tắc', ''),
(60, 'Trên đường một chiều có vạch kẻ phân làn đường, xe thô sơ và xe cơ giới phải đi như thế nào là đúng quy tắc giao thông?', NULL, 'Khái niệm quy tắc', ''),
(61, 'Một số nét đẹp về truyền thống đạo đức của mỗi con nguời Việt Nam theo tư tưởng của Chủ tịch Hồ Chí Minh là?', NULL, 'Văn hóa đạo đức', ''),
(62, 'Đạo đức cơ bản của mỗi con người, của con người lái xe thể hiện ở những điểm nào ghi ở dưới đây?', NULL, 'Văn hóa đạo đức', ''),
(64, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh1.PNG', 'Sa hình', '1'),
(65, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh2.PNG', 'Sa hình', '1'),
(66, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh3.PNG', 'Sa hình', '1'),
(67, 'Trường hợp này xe nào được quyền đi trước?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh4.PNG', 'Sa hình', '1'),
(68, 'Xe nào phải nhường đường trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh5.PNG', 'Sa hình', '1'),
(69, 'Theo hướng mũi tên, thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh6.PNG', 'Sa hình', '1'),
(70, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh7.PNG', 'Sa hình', '1'),
(71, 'Xe nào được quyền đi trước trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh8.PNG', 'Sa hình', '1'),
(72, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh9.PNG', 'Sa hình', '1'),
(73, 'Xe nào phải nhường đường là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh10.PNG', 'Sa hình', '1'),
(74, 'Xe nào phải nhường đường đi cuối cùng qua nới giao nhau này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh11.PNG', 'Sa hình', '1'),
(75, 'Theo tín hiệu đèn, xe nào được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh12.PNG', 'Sa hình', '1'),
(76, 'Xe nào được quyền đi trước trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh13.PNG', 'Sa hình', '1'),
(77, 'Theo tín hiệu đèn, xe nào được quyền đi là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh14.PNG', 'Sa hình', '1'),
(78, 'Trong trường hợp này xe nào được quyền đi trước?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh15.PNG', 'Sa hình', '1'),
(79, 'Theo tín hiệu đen, xe tải đi theo hướng nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh16.PNG', 'Sa hình', NULL),
(80, 'Các xe đi theo hướng mũi tên , xe nào vi phạm quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh17.PNG', 'Sa hình', ''),
(81, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh18.PNG', 'Sa hình', ''),
(82, 'Trong trường hợp này xe nào đỗ vi phạm quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh19.PNG', 'Sa hình', ''),
(83, 'Xe nào được quyền đi trước?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh20.PNG', 'Sa hình', ''),
(84, 'Khái niệm về dao đúc nghe nghiệp của người lái xe kinh doanh vận tải được hiểu như thế nào?', NULL, 'Văn hóa đạo đức', ''),
(85, 'Người lái xe kinh doanh vận tải khi thực hiện tốt việc rèn luyên, nâng cao trách nhiêm, đạp đức nghề nghiệp sẽ thu đuợc kết quả như thế nào?', NULL, 'Văn hóa đạo đức', ''),
(86, 'Hãy nêu trách nhiệm cơ bản của các tổ chức trong việc quản lý, giáo duc và nâng cao đạp đức nghề nghiệp của người lái xe? ', NULL, 'Văn hóa đạo đức', ''),
(87, 'Người lái xe khách, xe buýt cần thực hiện những nhiệm vụ gì ghi dưới đây?', NULL, 'Văn hóa đạo đức', ''),
(88, 'Người lái xe vận tái hàng hóa cần thực hiện những nhiệm vụ gì ghi ở dưới đây? ', NULL, 'Văn hóa đạo đức', ''),
(89, 'Ngườii lái xe kinh doanh vận tải cần thưc hiện những công việc gì ghi ở dưới đây để thường xuyên rèn luyện nâng cao đạo đức nghề nghiệp?', NULL, 'Văn hóa đạo đức', ''),
(90, 'Ngoài các phẩm chất của con người mới xã hội chủ nghĩa, người lái xe can phái có phẩm chất đạo đức nghề ngiệp gì ghi ở dưới đây? ', NULL, 'Văn hóa đạo đức', ''),
(91, 'Người lái xe và nhân viên phục vụ trên xe ô tô vân tái hành khách phái có nhung trách nhiệm gi theo quy định được ghi ở dưới đây?', NULL, 'Văn hóa đạo đức', ''),
(92, 'Xe ô tô tham gia giao thông đường bộ phải bảo đảm các quy định về chất lượng, an toàn kỹ thuật và bảo vệ môi trường nào ghi dưới đây?', NULL, 'Cấu tạo sửa chữa ', NULL),
(93, 'Xe ô tô tham gia giao thông trên đường bộ phải bắt buộc có đủ bộ phận giảm thanh giảm khói không', NULL, 'Cấu tạo sửa chữa ', NULL),
(94, 'Xe ô tô tham gia giao thông trên đường bộ phải có các loại đường gì?', NULL, 'Cấu tạo sửa chữa ', NULL),
(95, 'Hãy nêu yêu cầu cửa kính chắn gió 6 tô? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(96, 'Hãy nêu yêu cầu về an toàn kỹ thuật đối với bánh xe låp cho ô tô? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(97, 'Äm luong của còi điện lap trên ôtô (do àđộ cao 1,2m vói khoâng cách 2m tính tir dau xe) là bao nhiêu? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(98, 'Mục đích của báo đường thường xuyên đối với xe ô tô có tác dụng gì? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(99, 'Trong các nguyên nhân nêu dưới đây , nguyên nhân nào làm động cơ diezen không nổ ?', NULL, 'Cấu tạo sửa chữa ', NULL),
(100, 'Hãy nêu yêu cầu về an toàn kỹ thuật đối với gạt nước lắp trên ô tô ? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(101, 'Hãy nêu yêu cầu về an toàn kỹ thuật đối với dây đai an toàn lắp trên ô tô ? ', NULL, 'Cấu tạo sửa chữa ', NULL),
(102, 'Khi vào số để tiến hoặc lùi xe ô tô có số tự động , người lái xe phải thực hiện các thao tác nào để đảm bảo an toàn ?', NULL, 'Kỹ thuật lái xe', NULL),
(103, 'Khi nhả phanh tay , người lái xe cần phải thực hiện các thao tác nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(104, 'Khi quay đầu xe , người lái xe cần phải quan sát và thực hiện các thao tác nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(105, 'Khi khởi hành ô tô trên đường bằng , người lái xe cần thực hiện các thao tác nào theo trình tự dưới đây ?', NULL, 'Kỹ thuật lái xe', NULL),
(106, 'Khi tránh nhau trên đường hẹp , người lái xe cần phải chú ý những điểm nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(107, 'Khi điều khiển ô tô lên dốc cao , người lái xe cần thực hiện các thao tác nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(108, 'Khi điều khiển ô tô xuống dốc cao , người lái xe cần thực hiện các thao tác nào dưới đây ? ', NULL, 'Kỹ thuật lái xe', NULL),
(109, 'Khi điều khiển xe ô tô rẽ phải ở chỗ đường giao nhau , người lái xe cần thực hiện các thao tác nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(110, 'Khi điều khiển xe trên đường vòng người lái xe cần phải làm gì ? ', NULL, 'Kỹ thuật lái xe', NULL),
(111, 'Khi xuống dốc , muốn dừng xe , người lái xe cần thực hiện các thao tác nào ? ', NULL, 'Kỹ thuật lái xe', NULL),
(112, 'Khái niệm xe quá tải trọng của đường bộ được hiểu như thế nào là đúng ? ', '', 'Nghiệp vụ vận tải', ''),
(113, 'Vận tải đa phương thức được hiểu như thế nào là đúng ?', NULL, 'Nghiệp vụ vận tải', NULL),
(114, 'Trong trường hợp đặc biệt , xe quá tải trọng , quá khổ giới hạn của đường bộ , xe bánh xích có thể lưu hành trên đường nhưng phải xin phép cơ quan nào ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(115, 'Khái niệm \" hàng nguy hiểm \" được hiểu như thế nào là đúng ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(116, 'Hoạt động vận tải đường bộ được hiểu như thế nào là đúng ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(117, 'Thời gian làm việc trong một ngày của người lái xe được quy định là bao nhiêu ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(118, 'Kinh doanh vận tải hành khách bằng xe ô tô bao gồm những loại hình nào ghi ở dưới đây ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(119, 'Hàng nguy hiểm , hàng có mùi hôi thối hoặc động vật , hàng hóa khác có ảnh hưởng đến sức khỏe hành khách được nhận chở trên xe khách hay không ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(120, 'Người vận tải , người lái xe khách phải chấp hành những quy định nào ghi ở dưới đây ?', NULL, 'Nghiệp vụ vận tải', NULL),
(121, 'Người kinh doanh vận tải hành khách có những nghĩa vụ nào theo quy định ? ', NULL, 'Nghiệp vụ vận tải', NULL),
(122, 'Khái niệm về văn hóa giao thông được hiểu như thế nào là đúng?', NULL, 'Văn hóa đạo đức', ''),
(123, 'Người lá xe cố tình vi phạm Luật Giao thông đường bộ, không phân biệt làn đường, vạch phân làn, phóng nhanh, vượt ẩu, vượt đèn đỏ, đi vào đường cấm, đường một chiều được coi là hành vi nào trong các hành vi sau đây?', NULL, 'Văn hóa đạo đức', ''),
(124, 'Trong các hành vi dưới đây, người lái xe mô tô có văn hóa giao thông phải ứng xử như thế nào?', NULL, 'Văn hóa đạo đức', '1'),
(125, 'Trong các hành vi dưới đây, người lái xe mô tô có văn hóa giao thông phải ứng xử thế nào?', NULL, 'Văn hóa đạo đức', '1'),
(126, 'Người có văn hóa giao thông khi điều khiển xe cơ giới tham gia giao thông đường bộ phải đảm bảo các điều kiện gì?', NULL, 'Văn hóa đạo đức', '1'),
(127, 'Khi gặp biển nào thì xe mô tô hai bánh được đi vào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb21.PNG', 'Hệ thống biển báo ', '1'),
(128, 'Biển nào xe mô tô hai bánh được đi vào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb22.PNG', 'Hệ thống biển báo ', '1'),
(129, 'Biển nào xe mô tô hai bánh không được đi vào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb23.PNG', 'Hệ thống biển báo ', '1'),
(130, 'Ba biển này có ý nghĩa hiệu lực như thế nào?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb24.PNG', 'Hệ thống biển báo ', '1'),
(131, 'Biển nào cấm xe rẽ trái?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb25.PNG', 'Hệ thống biển báo ', '1'),
(132, 'Biển nào cấm quay xe?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb26.PNG', 'Hệ thống biển báo ', '1'),
(133, 'Khi gặp biể nào xe được rẽ trái?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb27.PNG', 'Hệ thống biển báo ', '1'),
(134, 'Khi gặp biển nào xe ưu tiên theo luật định vẫn phải dừng lại?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb28.PNG', 'Hệ thống biển báo ', '1'),
(135, 'Khi đến chỗ giao nhau, gặp biển nào thì người lái xe không được cho xe đi thằng, phải rẽ sang hướng khác', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb29.PNG', 'Hệ thống biển báo ', '1'),
(136, 'Biển này có hiệu lực đối với xe mô tô hai, ba bánh không?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb30.PNG', 'Hệ thống biển báo ', '1'),
(137, 'Khi gặp biển này, xe lam và mô tô ba bánh có được phép rẽ trái hay rẽ phải hay không?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb31.PNG', 'Hệ thống biển báo ', '1'),
(138, 'Biển phụ đặt dưới biển cẩm bóp còi có ý nghĩa gì?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb32.PNG', 'Hệ thống biển báo ', '1'),
(139, 'Biển nào báo hiệu cầu vượt liên thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb33.PNG', 'Hệ thống biển báo ', '1'),
(140, 'Biển nào báo hiệu đoạn đường hay xảy ra tai nạn?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb34.PNG', 'Hệ thống biển báo', '1'),
(141, 'Biển nào báo hiệu tuyến đường cầu vượt cắt qua?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb35.PNG', 'Hệ thống biển báo', '1'),
(142, 'Biển nào chỉ dẫn tên đường trên các tuyến đường đối ngoại?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb36.PNG', 'Hệ thống biển báo', '1'),
(143, 'Theo hướng mũi tên, những hướng nào xe gắn máy đi được?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh21.PNG', 'Sa hình', '1'),
(144, 'Xe nào đỗ vi phạm quy tắc giao thông', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh22.PNG', 'Sa hình', '1'),
(145, 'Xe nào đỗ vi phạm quy tắ giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh23.PNG', 'Sa hình', '1'),
(146, 'Xe tải kéo mô tô ba bánh như hình này có đúng quy tắc giao thông không?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh24.PNG', 'Sa hình', '1'),
(147, 'Theo hướng mũi tên, hướng nào xe không được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh25.PNG', 'Sa hình', '1'),
(148, 'Theo hướng mũi tên, những hướng nào ô tô không được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh26.PNG', 'Sa hình', '1'),
(149, 'Xe nào vượt đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh27.PNG', 'Sa hình', '1'),
(150, 'Theo hướng mũi tên, gặp biển hướng đi phải theo đặt trước ngã tư, những hướng nào xe được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh28.PNG', 'Sa hình', '1'),
(151, 'Xe kéo nhau như hình này có vi phạm quy tắc giao thông không?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh29.PNG', 'Sa hình', '1'),
(152, 'Xe nào phải nhường đường trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh30.PNG', 'Sa hình', '1'),
(153, 'Xe kéo nhau trong trường hợp này đúng quy định không?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh31.PNG', 'Sa hình', '1'),
(154, 'Theo hướng mũi tên, những hướng nào ô tô con được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh32.PNG', 'Sa hình', '1'),
(155, 'Xe nào được quyền đi trước trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh33.PNG', 'Sa hình', '1'),
(156, 'Thứ tự các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh34.PNG', 'Sa hình', '1'),
(157, 'Trên đường có nhiều làn đường cho xe đi cùng chiều được phân biệt bằng vạch kẻ phân làn đường, người điều khiển phương tiện phải cho xe đi như thế nào?', NULL, 'Khái niệm quy tắc', NULL),
(158, 'Trên đường có nhiều làn đường, người điều khiển phương tiện tham gia giao thông sử dụng làn đường như thế nào là đúng?', NULL, 'Khái niệm quy tắc', NULL),
(159, 'Xe sau có thể vượt lên bên phải xe khác đang chạy phía trước trong trường hợp nào?', NULL, 'Khái niệm quy tắc', NULL),
(160, 'Người lái xe phải làm gì khi quay đầu xe trên cầu, gầm cầu vượt, đường ngầm hay khu vực đường bộ giao nhau cùng mức với đường sắt?', NULL, 'Khái niệm quy tắc', NULL),
(161, 'Khi muốn chuyển hướng, người lái xe phải thực hiện như thế nào?', NULL, 'Khái niệm quy tắc', NULL),
(162, 'Biển nào xe quay đầy không bị cấm?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb37.PNG', 'Hệ thống biển báo', NULL),
(163, 'Biển nào cho phép rẽ trái?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb38.PNG', 'Hệ thống biển báo', NULL),
(164, 'Biển nào là biển báo hiệu cấm đi ngược chiều?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb39.PNG', 'Hệ thống biển báo', NULL),
(165, 'Biển nào xe được phép quay đầu nhưng không được rẽ trái?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb40.PNG', 'Hệ thống biển báo', NULL),
(166, 'Biển nào báo hiệu chiều dài đoạn đường phải giữ cự ly tối thiểu giữa hai xe?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb41.PNG', 'Hệ thống biển báo', NULL),
(167, 'Trong các trường hợp dưới đây, người lái xe phải xử lý như thế nào khi gặp biển 2 \"Stop\"?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb42.PNG', 'Hệ thống biển báo', NULL),
(168, 'Khi gặp biển nào xe ưu tiên theo luật định vẫn phải dừng lại?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb43.PNG', 'Hệ thống biển báo', NULL),
(169, 'Biển nào báo hiệu khoảng cách thực tế từ nơi đặt biển đến nơi cần cự ly tối thiểu giữa hai xe?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb44.PNG', 'Hệ thống biển báo', NULL),
(170, 'Biển nào cấm tất cả các loại xe cơ giới và thô sơ đi lại trên đường, trừ xe ưu tiên theo luật định (nếu đường vẫn cho xe chạy được)?', 'https://androidwsv.000webhostapp.com/HinhAnh/CHBB/bb45.PNG', 'Hệ thống biển báo', NULL),
(171, 'Theo hướng mũi tên, những hướng nào xe tải được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh35.PNG', 'Sa hình', NULL),
(172, 'Những hướng nào ô tô tải được phép đi', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh36.PNG', 'Sa hình', NULL),
(173, 'Những hướng nào xe tải được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh37.PNG', 'Sa hình', NULL),
(174, 'Những hướng nào ô tô tải được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh38.PNG', 'Sa hình', NULL),
(175, 'Ô tô con đi theo chiều mũi tên có vi phạm quy tắc giao thông không?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh39.PNG', 'Sa hình', NULL),
(176, 'Xe nào được quyền đi trước trong trường hợp này?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh40.PNG', 'Sa hình', NULL),
(177, 'Xe nào vi phạm quy tắc giao thông', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh41.PNG', 'Sa hình', NULL),
(178, 'Các xe đi như thế nào là đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh42.PNG', 'Sa hình', NULL),
(179, 'Theo hướng mũi tên, xe nào được phép đi?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh43.PNG', 'Sa hình', NULL),
(180, 'Xe nào vượt đúng quy tắc giao thông?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh44.PNG', 'Sa hình', NULL),
(181, 'Xe con vượt xe tải như trường hợp này có đúng không?', 'https://androidwsv.000webhostapp.com/HinhAnh/SH/sh45.PNG', 'Sa hình', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CauTraLoi`
--

CREATE TABLE `CauTraLoi` (
  `id` int(11) NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `kiemTra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `CauTraLoi`
--

INSERT INTO `CauTraLoi` (`id`, `noiDung`, `kiemTra`, `idCH`) VALUES
(1, 'Là phần đường của đường bộ được sử dụng cho các phương tiện giao thông qua lại.', 'true', 1),
(2, 'Là phần đường bộ được sử dụng cho các phương tiện giao thông qua lại, dải đất dọc hai bên đường để bảo đảm an toàn giao thông', 'false', 1),
(3, 'Là phần đường bộ được sử dụng cho các phương tiện giao thông qua lại, các công trình, thiết bị phụ trợ khác và dải đất dọc hai bên đường để bảo đảm an toàn giao thông.', 'false', 1),
(4, 'Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại.', 'true', 2),
(5, 'Vạch kẻ đường là vạch chỉ sự phân biệt vị trí dừng, đỗ trên đường', 'false', 2),
(6, 'Tất cả các ý nêu trên', 'false', 2),
(7, 'Là một phần của đường được chia theo chiều ngang của đường, có bề rộng đủ cho xe đỗ an toàn', 'false', 3),
(8, 'Là một phần của đường xe chạy được chia theo chiều dọc của đường, có bề rộng đủ cho xe chạy an toàn', 'true', 3),
(9, 'Cả 2 ý trên', 'false', 3),
(10, 'Đường, cầu đường bộ.', 'true', 4),
(11, 'Hầm đường bộ, bến phà đường bộ.', 'true', 4),
(12, 'Đường, cầu đường bộ, hầm đường bộ, bến phà đường bộ và các công trình phụ trợ khác.', 'false', 4),
(13, 'Đường phố là đường đô thị, gồm lòng đường và hè phố.', 'true', 5),
(14, 'Đường phố là đường bộ ngoài đô thị có lòng đường đủ rộng cho các phương tiện giao thông qua lại.', 'false', 5),
(15, 'Cả hai ý nêu trên.', 'false', 5),
(16, 'Là bộ phận của đường để phân chia mặt đường thành hai chiều xe chạy riêng biệt hoặc để phân chia phần đường của xe cơ giới và xe thô sơ.', 'true', 6),
(17, 'Là bộ phận của đường để xác định ranh giới của đất dành cho đường bộ theo chiều ngang của đường.', 'false', 6),
(18, 'Là bộ phận của đường để ngăn cách không cho các loại xe vào những nơi không được phép.', 'false', 6),
(20, 'Loại cố định.', 'true', 7),
(21, 'Loại di động.', 'true', 7),
(22, 'Đường ưu tiên là đường mà trên đó phương tiện tham gia giao thông đường bộ phải nhường đường cho các phương tiện đến từ hướng khác khi qua nơi đường giao nhau, có thể cắm biển báo hiệu đường ưu tiên.', 'false', 8),
(23, 'Đường ưu tiên là đường mà trên đó phương tiện tham gia giao thông đường bộ được các phương tiện đến từ hướng khác nhường đường khi qua nơi đường giao nhau, được cắm biển báo hiệu đường ưu tiên.', 'true', 8),
(24, 'Đường ưu tiên là đường chỉ dành cho một số phương tiện tham gia giao thông, được cắm biển báo hiệu đường ưu tiên.', 'false', 8),
(25, 'Gồm xe ô tô; máy kéo; xe mô tô hai bánh; xe mô tô ba bánh; xe gắn máy; xe cơ giới dùng cho người khuyết tật và xe máy chuyên dùng.', 'false', 9),
(26, 'Gồm xe ô tô; máy kéo; rơ moóc hoặc sơ mi rơ moóc được kéo bởi xe ô tô, máy kéo; xe mô tô hai bánh; xe mô tô ba bánh; xe gắn máy (kể cả xe máy điện) và các loại xe tương tự.', 'true', 9),
(27, 'Phương tiện giao thông cơ giới đường bộ, phương tiện giao thông thô sơ đường bộ.', 'true', 10),
(28, 'Phương tiện giao thông thô sơ đường bộ, phương tiện giao thông cơ giới đường bộ và xe máy chuyên dùng.', 'false', 10),
(29, 'Cả hai ý nêu trên.', 'false', 10),
(30, 'Biển 1.', 'false', 21),
(31, 'Biển 1 và 3.', 'false', 21),
(32, 'Biển 2.', 'true', 21),
(33, 'Biển 2 và 3.', 'false', 21),
(34, 'Biển 1.', 'true', 22),
(35, 'Biển 3.', 'false', 22),
(36, 'Biển 2.', 'false', 22),
(37, 'Biển 1 và 3.', 'false', 22),
(38, 'Biển 1.', 'false', 23),
(39, 'Biển 1 và 3.', 'false', 23),
(40, 'Biển 3.', 'true', 23),
(41, 'Cả 3 biển.', 'false', 23),
(42, 'Biển 1 và 2.', 'false', 24),
(43, 'Biển 2 và 3.', 'true', 24),
(44, 'Biển 1.', 'false', 24),
(45, 'Cả 3 biển.', 'false', 24),
(46, 'Biển 2.', 'false', 25),
(47, 'Biển 1.', 'false', 25),
(48, 'Biển 3.', 'true', 25),
(49, 'Cả ba biển.', 'false', 25),
(50, 'Biển 1.', 'true', 26),
(51, 'Biển 2 và 3.', 'false', 26),
(52, 'Biển 3.', 'false', 26),
(53, 'Biển 1 và 3.', 'true', 27),
(54, 'Biển 1 và 2.', 'false', 27),
(55, 'Biển 2 và 3.', 'false', 27),
(56, 'Cả ba biển.', 'false', 27),
(57, 'Biển 1 và 2.', 'false', 28),
(58, 'Biển 2 và 3.', 'true', 28),
(59, 'Biển 1 và 3.', 'false', 28),
(60, 'Cả ba biển.', 'false', 28),
(61, 'Biển 3.', 'true', 29),
(62, 'Biển 1.', 'false', 29),
(63, 'Biển 2.', 'false', 29),
(64, 'Biển 1 và 2.', 'false', 30),
(65, 'Biển 1 và 3.', 'true', 30),
(66, 'Cả ba biển.', 'false', 30),
(67, 'Biển 2 và 3.', 'false', 30),
(68, 'Cần kiệm: Là lao động cần cù, siêng năng; làm viêc có ke hoach, sáng tao có năng suat cao, với tinh thần tự lực cánh sinh, không lười biếng, không ỷ lại, không dựa dẫm; tiết kiệm sức lao dộng, tiet kiêm thì giò, tiết kiêm tien cúa dân, của nước, của bản thân mình, không hao phí, khong bữa bai, khong pho trương hình thức.', 'true', 61),
(69, 'Liêm chính: Là không tham ô va luôn luôn tôn trọng, giû gin cua công, của nhân dân; ngay thắng, không tà, đúng đắn, chính trực, việc phải dù nhó cung làm, viec trái dù nhó cüng tránh', 'true', 61),
(70, 'Tính trung thực và tính nguyên tắc; tính khiêm ton và lòng düng cám', 'true', 62),
(71, 'Tinh yêu lao dong và tinh thuong yêu con người', 'true', 62),
(72, 'Luôn ghi nhớ và thực hiện lời dạy của Bác: \"Yêu xe như con, quý xăng như máu\"; nắm vững quy dinh cúa pháp luat, nghiêm chinh chap hành Luật Giao thông đường bộ, lái xe an toàn; có ý thức tổ chức kỷ luật, chấp hành nội quy, quy chế xây dựng đơn vị nơi mình công tác; có tính thần hợp tác, giúp đỡ đồng nghiệp; có ý thức bảo vệ môi trường; luôn tu dưỡng bản thân, có loi sõng lành manh, tác phong công nghiệp. ', 'true', 84),
(73, 'Đoi vói hành khách phai kinh trong, thân á, giúp đỡ, đối với khách hàng phải có trách nhiệm, hợp tác, thực hiện đầy đủ hợp đồng vận tải, đối với người tham gia giao thông phải tôn trong, báo vê.', 'true', 84),
(74, 'Được khách hàng, xã hội tôn trọng; được đồng nghiệp quý mến, giúp đỡ, được doanh nghiệp tin dùng và dóng góp nhieu cho xã hoi.', 'true', 85),
(75, 'Thu hút được khách hàng, góp phần quan trọng trong xây dựng thương hiệu, kinh doanh có hiệu quá cao.', 'true', 85),
(76, 'Tuyên truyen pho bien các quy đinh của pháp luât đặc biêt là các quy dinh cúa Luât Giao thông đường bộ, các văn bản quản lý về vận tải để người lái xe biết và thực hiện; thường xuyên kiểm tra giám sát người lái xe thực hiện các nội quy, quy chế của đơn vị. 0% ', 'true', 86),
(77, 'Hiếu tâm lý, nguyện vọng người lái xe, đông viên họ trong lúc khó khăn, thực hiện đầy đủ các quy dinh cua pháp luât ve quyen loi cua người lao động, quan tâm đến đời sống vật chất tinh thần của họ, có chế độ thưởng phạt nghiêm minh giúp ho hoàn thành nhiêm vu', 'true', 86),
(78, 'Luôn có ý thức về tính tổ chức, kỷ luật, thực hiện nghiêm biểu đồ xe chạy được phân công; thực hiện đúng hành trình, lịch trình, đón trả khách đúng nơi quy định, vạn hành phương tiện theo dúng quy trinh ký thuat dám báo an toàn cho người và phương tiện với tinh thần trách nhiêm cao. ', 'true', 87),
(79, 'Giúp đỡ hành khách khi đi xe đặc biệt là những người khuyết tật, người già, trẻ em và phụ nu có thai, có con nhó; tôn trong và có trách nhięm cao vai khach hang', 'true', 87),
(80, 'Thực hiện nghiêm chỉnh những nội dung hợp đồng giữa chủ phương tiện với chủ hàng trong việc vân chuyen và bảo quản hàng hóa trong quá trình vận chuyến; không chở hàng canm không xep hàng quá trong tái cúa xe, quá trong tải cho phép của cầu, đường. ', 'true', 87),
(81, 'Khi vận chuyên hàng quá khõ, quá tái, hàng nguy hiểm, hàng siêu trường, siêu trọng phải có giấy phép, phải tôn trọng và thực hiện nghiêm ngat những quy dinh ve van chuyen hàng quá khổ, quá tải, hàng siêu trường, siêu trong, hàng nguy hiem', 'true', 87),
(82, 'Phải yêu quý xe, quản lý và sử dụng xe tốt; bảo dưỡng xe đúng định kỳ, thực hành tiết kiệm vật tư, nhiên liệu; luôn tu dưỡng bản thân, có loi song lành manh, tác phong làm viêc công nghięp', 'true', 89),
(83, 'Nắm vững các quy định của pháp luật, tự giác chap hành pháp luât, lái xe an toàn; coi hành khach như người than, la doi tac tin cậy; co y thức tổ chức kỷ luật và xây dựng doanh nghiệp vững mạnh, có tinh thần hợp tác, tương trợ. giúp đỡ đồng nghiệp.', 'true', 89),
(84, 'Tính tổ chức kỷ luật, tuân theo pháp luật; có tác phong làm việc công nghiệp, giúp đỡ mọi nguoi ', 'true', 90),
(85, 'Dộc lâp công tác và có tinh thần khãc phyc khó khăn.', 'true', 90),
(86, 'Kiem tra các dieu kiện bảo đảm an toàn của xe trước khi khởi hành; có thái độ văn minh, lịch sự, hướng dẫn hành khách ngồi đúng nơi quy dinh; kiem tra viêc såp xếp, chăng buộc hành lý báo đám an toàn.', 'true', 91),
(87, 'Có biện pháp báo vê tính mang, súc khoe, tài sản của hành khách đi xe, giữ gìn trật tự, vệ sinh trong xe, đóng cửa lên xuống của xe trước và trong khi xe chay.', 'true', 91),
(88, 'Kính chắn gió, kính cửa phải là loại kính an toàn, bảo đảm tầm nhìn cho người điều khiển; có đủ hệ thống hãm và hệ thống chuyển hướng có hiệu lực, tay lái của xe ô tô ở bên trái của xe, có còi với âm lượng đúng quy chuẩn kỹ thuật. \r\n', 'true', 92),
(89, 'Có đů đèn chieu sáng gan và xa, dèn soi bien số, đèn báo hãm, đèn tín hieu; có du bộ phân giám thanh, giám khôi, các kêt câu phải đú độ ben và bảo đám tính năng vận hành on dinh', 'true', 92),
(90, 'Không bắt buộc', 'false', 93),
(91, 'Bắt buộc', 'true', 93),
(92, 'Đèn chiếu sáng gần và xa', 'true', 94),
(93, 'Đèn soi biển số và đèn váo hãm , đèn tin hiệu', 'true', 94),
(94, 'Dàn đèn pha trên nóc xe', 'false', 94),
(95, 'Là loai kính an toàn, kính nhieu lóp, dúng quy  cách, không ran nút, đám báo hinh ánh quan sát rõ ràng, không bi méo mó. ', 'true', 95),
(96, 'Là loai kính trong suot, dúng quy cách, không rạn nứt, đảm bảo tầm nhìn cho người điều khiển về phía trước mặt và hai bên. ', 'false', 95),
(97, 'Cả hai ý nêu trên.', 'false', 95),
(98, 'Đủ số lượng, đủ áp suất, đúng cỡ lốp của nhà sản xuat hoặc tài liệu ký thuât quy dinh; lõp bánh dẫn hướng hai bên cùng kiểu hoa lốp, chiều cao hoa lốp đồng đều; không sử dụng lop dåp; lop không mòn dến dãu chi báo do môn của nhà sản xuất, không nứt, vỡ, phồng rộp làm hở lớp soi mành. ', 'true', 96),
(99, 'Đủ số lượng, đủ áp suất, đúng cỡ lốp của nhà sản xuat hoặc tài liệu ký thuât quy dinh; lõp bánh dẫn hướng hai bên cùng kiểu hoa lốp, chiều cao hoa lốp đồng đều; không sử dụng lop dåp; lop không mòn dến dãu chi báo do môn của nhà sản xuất, không nứt, vỡ, phồng rộp làm hở lớp soi mành. ', 'true', 96),
(100, 'Không nhỏ hơn 90dB (A), không lớn hơn 115dB ', 'true', 97),
(101, 'Không nhỏ hơn 80dB (A), không lớn hơn 105dB ', 'false', 97),
(102, 'Không nhỏ hơn 70dB (A), không lớn hơn 90dB', 'false', 97),
(103, 'Bảo dưỡng ô tô thường xuyên làm cho ô tô luôn luôn có tính năng kỹ thuật tốt, giảm cường dộ hao mòn của các chi tiet.', 'true', 98),
(104, ' Ngăn ngừa và phát biên kịp thời các hư hỏng và sai lêch ký thuat de khãc phuc, gir gin duoc hinh thúc bên ngoài', 'true', 98),
(105, 'Hết nhiên liệu , lõi lọc nhiên liệu bị tắc , lọc khí bị tắc , nhiên liệu lẫn không khí , \r\n\r\n', 'true', 99),
(106, 'Hết nhiên liệu , lõi lọc nhiên liệu bị tắc , lọc khí bị tắc , nhiên liệu lẫn không khí , không có tia lửa . điện . ', 'false', 99),
(107, 'Hết nhiên liệu , lõi lọc nhiên liệu bị tắc , lọc khí bị tắc , nhiên liệu lẫn không khí và nước , không có tia điện .\r\n', 'false', 99),
(108, 'Đầy đủ số lượng , lắp đặt chắc chắn , hoạt động bình thường . ', 'true', 100),
(109, 'Lưỡi gạt không quá mòn , diện tích quét đảm bảo tầm nhìn của người lái', 'true', 100),
(110, 'Đủ số lượng , lắp đặt chắc chắn không bị rách , đút , khóa cài đóng , mở nhẹ nhàng , không tự mở , không bị kẹt , kéo ra thu vào dễ dàng , cơ cấu hãm giữ chặt dây khi giật dây đột ngột . \r\n\r\n', 'true', 101),
(111, 'Đủ số lượng , lắp đặt chắc chắn không bị rách , đứt , khóa cải đóng , mở nhẹ nhàng , không tự mở , không bị kẹt ; kéo ra thu vào dễ dàng , cơ cấu hãm mở ra khi giật dây đột ngột . ', 'false', 101),
(112, 'Cả hai ý nêu trên', 'false', 101),
(113, 'Đạp bàn đạp phanh chân hết hành trình , vào số và kiểm tra lại xem có bị nhầm số không rồi mới cho xe lăn bánh ', 'true', 102),
(114, 'Đạp bàn đạp để tăng ga với mức độ phù hợp , vào số và kiểm tra lại xem có bị nhầm số không rồi mới cho xe lăn bánh . ', 'false', 102),
(115, 'Cả hai ý nêu trên ', 'false', 102),
(116, 'Dùng lực tay phải kéo cần phanh tay về phía sau hết hành trình ; nếu khóa hãm bị kẹt cứng phải đẩy mạnh phanh tay về phía trước , sau đó bóp khóa hãm ', 'false', 103),
(117, 'Dùng lực tay phải bóp khóa hãm đẩy cần phanh tay về phía trước hết hành trình ; nếu khóa hãm bị kẹt cứng phải kéo cần phanh tay về phía sau đồng thời bóp khóa hãm . ', 'true', 103),
(118, 'Dùng lực tay phải đẩy cần phanh tay về phía trước hết hành trình , nếu khóa hãm bị kẹt cứng phải đẩy mạnh cần phanh tay về phía trước , sau đó bóp khóa hãm .', 'false', 103),
(119, 'Quan sát biển báo hiệu để biết nơi được phép quay đầu , quan sát kỹ địa hình nơi chọn để quay đầu , lựa chọn quỹ đạo quay đầu xe cho thích hợp , quay đầu xe với tốc độ nhỏ nhất thường xuyên báo tín hiệu để người , các phương tiện xung quanh được biết , nếu quay đầu xe ở nơi nguy hiểm thì đưa đầu xe về phía nguy hiểm đưa đuôi xe về phía an toàn .', 'true', 104),
(120, 'Quan sát biển báo hiệu để biết nơi được phép quay đầu , quan sát kỹ địa hình nơi chọn để quay đầu , lựa chọn quỹ đạo quay đầu xe cho thích hợp ; quay đầu xe với tốc độ nhỏ nhất ; thường xuyên bảo tín hiệu để người , các phương tiện xung quanh được biết , nếu quay đầu xe ở nơi nguy hiểm thì đưa đuôi xe về phía nguy hiểm và đầu xe về phía an toàn	', 'false', 104),
(121, 'Kiểm tra an toàn xung quanh xe ô tô , nhả từ từ đến 1 / 2 hành trình bàn đạp ly hợp và giữ trong khoảng 3 giây , vào số 1 ; nhả hết phanh tay , báo hiệu bảng còi , đèn trước khi xuất phát ; tăng ga đủ để xuất phát , sau đó vừa tăng ga vừa phải hết ly hợp để cho xe ô tô chuyển động . ', 'false', 105),
(122, 'Kiểm tra an toàn xung quanh xe ô tô ; đạp ly hợp hết hành trình ; vào số 1 ; nhả hết phanh tay , bảo hiệu bằng còi , đèn trước khi xuất phát tăng ga đủ để xuất phát , nhả từ từ đến 1 / 2 hành trình bàn đạp ly hợp và giữ trong khoảng 3 giây , sau đó vừa tăng ga vừa nhả hết ly hợp để cho xe ô tô chuyển động .', 'true', 105),
(123, 'Không nên đi cổ vào đường hẹp ; xe đi ở phía sườn núi nên dừng lại trước để nhường đường ; khi dừng xe nhường đường phải đỗ ngay ngân . ', 'true', 106),
(124, 'Trong khi tránh nhau không nên đổi số ; khi tránh nhau ban đêm , phải tắt đèn pha bật đèn cốt . ', 'true', 106),
(125, 'Khi tránh nhau ban đêm , phải bật đèn pha tắt đèn cốt .', 'false', 106),
(126, 'Điều chỉnh ga cho xe từ từ lên dốc , đến gần . đỉnh dốc phải tăng ga để xe nhanh chóng qua dốc ; về số thấp , đi sát về phía bên phải đường , có tín hiệu ( còi , đèn ) để bán cho người lái xe đi ngược chiều biết , ', 'false', 107),
(127, 'Về số thấp từ chân dốc , điều chỉnh ga cho xe từ từ lên dốc ; đến gần đỉnh dốc phải đi chậm , đi sát về phía bên phải đường có tín hiệu ( còi , đèn ) để bảo cho người lái xe đi ngược chiều biết ', 'true', 107),
(128, 'Tất cả hai ý trên .', 'false', 107),
(129, 'Tăng lên số cao , nhả bàn đạp ga ở mức độ phù hợp , kết hợp với phanh chân để khống chế tốc độ .', 'false', 108),
(130, 'Về số thấp , nhả bàn đạp ga ở mức độ phù hợp , kết hợp với nhanh chân để khống chế tốc độ .', 'true', 108),
(131, 'Về số không ( 0 ) , nhả bàn đạp ga ở mức độ phù hợp , kết hợp với nhanh chân để khống chế tốc độ . ', 'false', 108),
(132, 'Cả ba ý nêu trên .', 'false', 108),
(133, 'Có tín hiệu rẽ phải , quan sát an toàn phía sau điều khiển xe sang làn đường bên trái , giảm tốc độ và quan sát an toàn phía bên phải để điều khiển xe qua chỗ đường giao nhau .', 'false', 109),
(134, 'Cách chỗ rẽ khoảng 30m có tín hiệu rẽ phải ; quan sát an toàn phía sau điều khiển xe bám sát vào phía phải đường ; giảm tốc độ và quan sát an toàn phía bên phải để điều khiển xe qua chỗ đường giao nhau .', 'true', 109),
(135, 'Cách chỗ rẽ khoảng 30m có tín hiệu rẽ phải quan sát an toàn phía sau điều khiển xe bám sát vào phía phải đường , tăng tốc độ và quan sát an toàn phía bên trái để điều khiển xe qua chỗ đường giao nhau .', 'false', 109),
(136, 'Quan sát cẩn thận các chướng ngại vật và báo hiệu bảng còi , đèn ; giảm tốc độ tới mức cần . thiết , về số thấp và thực hiện quay vòng với tốc độ phù hợp với bán kính đường vàng .', 'true', 110),
(137, 'Quan sát cẩn thận các chướng ngại vật và bảo hiệu bằng còi , đèn ; tăng tốc để nhanh chóng qua đường vòng , đạp ly hợp và giảm tốc độ sau khi qua đường vòng . ', 'false', 110),
(138, 'Cả hai ý nêu trên .', 'false', 110),
(139, 'Có tín hiệu rẽ phải , điều khiển xe sát vào lề đường bên phải , đạp phanh sớm và mạnh hơn lúc dừng xe trên đường bằng để xe đi với tốc độ chậm đến mức dễ dàng dừng lại được , về số 1 , đạp nửa ly hợp cho xe đến chỗ dừng , khi xe đã dừng , về số không, đạp phanh chân và kéo phanh tay . ', 'true', 111),
(140, 'Có tín hiệu rẽ phải , điều khiển xe sát vào lề đường bên phải ; đạp hết hành trình ly hợp và nhả bàn đạp ga đế xe đi với tốc độ chậm đến mức dễ dàng dừng lại được tại chỗ dừng ; khi xe đã dừng , đạp và giữ phanh chân . ', 'false', 111),
(141, 'Có tín hiệu rẽ phải , điều khiển xe sát vào lề đường bên phải đạp phanh sớm và mạnh hơn lúc dừng xe trên đường bằng để xe đi với tốc độ chậm đến mức dễ dàng dừng lại được ; về số không để xe đi đến cho dừng , khi xe đã dừng , kéo phanh tay .', 'false', 111),
(142, 'Là xe có tổng trọng lượng vượt quá khả năng chịu tải của cầu hoặc có tải trọng trục xe vượt quá khả năng chịu tải của đường .\r\n\r\n', 'true', 112),
(143, 'Là xe có trọng lượng hàng hóa vượt quả khả năng chịu tải của cầu hoặc có tải trọng trục xe vượt quả khả năng chịu tải của đường . ', 'false', 112),
(144, 'Cả hai ý nêu trên .', 'false', 112),
(145, 'Là việc vận chuyển hàng hóa từ địa điểm nhận hàng đến địa điểm trả hàng cho người nhận hàng bằng phương thức vận tải bằng đường bộ trên cơ sở một hợp đồng vận tải đa phương thức . \r\n', 'false', 113),
(146, 'Là việc vận chuyển hàng hóa từ địa điểm nhận hàng đến địa điểm trả hàng cho người nhận hàng bằng ít nhất hai phương thức vận tải , trong đó có phương thức vận tải bằng đường bộ trên cơ sở một hợp đồng vận tải đa phương thức .\r\n', 'true', 113),
(147, 'Cơ quan Cảnh sát giao thông có thẩm quyền . \r\n\r\n', 'false', 114),
(148, 'Cơ quan quản lý giao thông có thẩm quyền .', 'true', 114),
(149, 'Ủy ban nhân dân tỉnh .', 'false', 114),
(150, 'Là hàng hóa dễ gây cháy , nổ và cấm vận chuyển trên đường vì có khả năng gây nguy hại cho con người , trong trường hợp đặc biệt cần vận chuyến phải có các xe chuyên dùng để bảo đảm an toàn . \r\n\r\n', 'false', 115),
(151, 'Là hàng hóa có chứa các chất nguy hiểm , khi chở trên đường có khả năng gây nguy hại tới tính mạng , sức khỏe con người , môi trường , an toàn và an ninh quốc gia .', 'true', 115),
(152, 'Cả ý trả lời 1 và 2', 'false', 115),
(153, 'Hoạt động vận tải đường bộ là hoạt động kinh doanh vận tải đường bộ , kinh doanh vận tải đường bộ là ngành nghề kinh doanh có điều kiện theo quy định của pháp luật .\r\n', 'false', 116),
(154, 'Hoạt động vận tải đường bộ gồm hoạt động vận tải không kinh doanh và hoạt động kinh doanh vận tải đường bộ ; kinh doanh vận tải đường bộ là ngành nghề kinh doanh có điều kiện theo quy định của pháp luật . \r\n\r\n', 'true', 116),
(155, 'Cả 02 ý nêu trên', 'false', 116),
(156, 'Không quá 8 giờ và không được lái xe liên tục quá 5 giờ . \r\n', 'false', 117),
(157, 'Không quá 10 giờ và không được lái xe liên tục quả 4 giờ .\r\n\r\n', 'true', 117),
(158, 'Không quá 8 giờ và không được lái xe liên tục quá 3 giờ', 'false', 117),
(159, 'Theo tuyến cố định có xác định bến đi , bển đến với lịch trình , hành trình nhất định , theo hợp đồng không theo tuyến cố định được thực hiện theo hợp đồng vận tải ; vận tải khách du lịch theo tuyến , chương trình và địa điểm du lịch , \r\n', 'true', 118),
(160, 'Bằng xe buýt theo tuyến cố định có các điểm dừng đón , trả khách và xe chạy theo biểu đồ vận hành theo cự ly phạm vi hoạt động nhất định ; bằng xe taxi có lịch trình và hành trình theo yêu cầu của khách hàng , cước tính theo đồng hồ tính tiền\r\n', 'true', 118),
(161, 'Được chở . \r\n\r\n', 'false', 119),
(162, 'Không được chở .', 'true', 119),
(163, 'Đón , trả khách đúng nơi quy định , không chở hành khách trên mui , trong khoang hành lý hoặc để hành khách đu bám bên ngoài xe ; không chở hàng nguy hiểm , hàng có mùi hôi thổi hoặc động vật , hàng hóa khác có ảnh hưởng đến sức khỏe của hành khách .\r\n\r\n', 'true', 120),
(164, 'Không chở hành khách , hành lý hàng hóa vượt quả trọng tải , số người theo quy định ; không để hàng hóa trong khoang chở khách ; có biện pháp giữ gìn vệ sinh trong xe', 'true', 120),
(165, 'Thực hiện đúng , đầy đủ các cam kết về chất lượng dịch vụ vận tải , các nội dung ghi trong hợp đồng vận tải , mua bảo hiểm cho hành khách ; phí bảo hiểm được tính vào giá vé khách hàng .\r\n\r\n\r\n', 'true', 121),
(166, 'Không phải bồi thường thiệt hại do người làm công , người đại diện gây ra do thực hiện yêu cầu của người kinh doanh vận tải trải quy định của Luật Giao thông đường bộ . ', 'false', 121),
(167, 'Giao vé , chứng từ thu cước , phí vận tải cho hành khách ; bồi thường thiệt hại do người làm công , người đại diện gây ra do thực hiện yêu . cầu của người kinh doanh vận tải trái quy định của Luật Giao thông đường bộ', 'true', 121),
(168, 'Phương tiện giao thông cơ giới đường bộ', 'true', 11),
(169, 'Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng', 'true', 11),
(170, 'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ', 'true', 12),
(171, 'Người điều khiển, dẫn dắt súc vật, người đi bộ trên đường bộ', 'true', 12),
(172, 'Là người điều khiển phương tiện tham gia giao thông', 'false', 13),
(173, 'Là người được giao nhiệm vụ hướng dẫn giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt', 'true', 13),
(174, 'Là cảnh sát giao thông', 'true', 13),
(175, 'Tất cả các ý nêu trên', 'false', 13),
(176, 'Phá hoại đường, cầu, hầm, bến phà đường bộ, phá hoại đèn tín hiệu, cọc tiêu, biển báo hiệu, gương cầu, dải phân cách', 'true', 14),
(177, 'Phá hoại hệ thống thoát nước và các công trình, thiết bị khác thuộc kết cấu hạ tầng giao thông đường bộ.', 'true', 14),
(178, 'Đua xe, cổ vũ đua xe, tổ chức đua xe trái phép', 'true', 15),
(179, 'Lạng lách, đánh võng', 'true', 15),
(180, 'Bị nghiêm cấm', 'true', 16),
(181, 'Không bị nghiêm cấm', 'false', 16),
(182, 'Nồng độ cồn vượt quá 50 miligam/100mililit máu', 'true', 17),
(183, 'Nồng độ cồn vượt quá 40 miligam/100mililit máu', 'false', 17),
(184, 'Nồng độ cồn vượt quá 30 miligam/100mililit máu', 'false', 17),
(185, 'Người điều khiển xe ô tô, máy kéo, xe máy chuyên dùng trên đường mà trong máu có nồng độ cồn vượt quá 50 miligam/100mililit máu hoặc 0,25 miligam/1 lít khí thở', 'false', 18),
(186, 'Người điều khiển xe ô tô, máy kéo, xe máy chuyên dùng trên đường trong máu hoặc hơi thở có nồng độ cồn', 'true', 18),
(187, 'Người điều khiển xe ô tô, máy kéo, xe máy chuyên dùng trên đường mà trong máu có nồng độ cồn vượt quá 80 miligam/100mililit máu hoặc 40 miligam/1 lít khí thở', 'false', 18),
(188, 'Nồng độ cồn vượt quá 0,25 miligam/1 lít khí thở', 'true', 19),
(189, 'Nồng độ cồn vượt quá 0,20 miligam/1 lít khí thở', 'false', 19),
(190, 'Nồng độ cồn vượt quá 0,15 miligam/1 lít khí thở', 'false', 19),
(191, 'Không bị nghiêm cấm', 'false', 20),
(192, 'Bị nghiêm cấm', 'true', 20),
(193, 'Nghiêm cấm tùy từng trường hợp', 'false', 20),
(194, 'Biển 1', 'true', 31),
(195, 'Biển 2 và 3', 'false', 31),
(196, 'Biển 2', 'false', 31),
(197, 'Biển 3', 'false', 31),
(198, 'Biển 1 và 3', 'false', 32),
(199, 'Biển 2', 'true', 32),
(200, 'Biển 3', 'false', 32),
(201, 'Biển 1', 'false', 33),
(202, 'Biển 3', 'true', 33),
(203, 'Biển 2', 'false', 33),
(204, 'Cả 3 biển', 'false', 33),
(205, 'Biển 1', 'true', 34),
(206, 'Biển 3', 'false', 34),
(207, 'Biển 2', 'false', 34),
(208, 'Biển 1', 'false', 35),
(209, 'Biển 2', 'true', 35),
(210, 'Biển 3', 'false', 35),
(211, 'Biển 1', 'true', 36),
(212, 'Biển 2', 'false', 36),
(213, 'Biển 3', 'false', 36),
(214, 'Biển 1', 'false', 37),
(215, 'Biển 2', 'true', 37),
(216, 'Biển 3', 'false', 37),
(217, 'Biển 1', 'false', 38),
(218, 'Biển 2', 'false', 38),
(219, 'Biển 3', 'true', 38),
(220, 'Biển 2 và 3', 'false', 38),
(221, 'Biển 1 và 3', 'false', 39),
(222, 'Biển 1 và 2', 'true', 39),
(223, 'Biển 2 và 3', 'false', 39),
(224, 'Biển 1', 'true', 40),
(225, 'Biển 2', 'false', 40),
(226, 'Biển 3', 'false', 40),
(227, 'Bị nghiêm cấm', 'true', 41),
(228, 'Bị nghiêm cấm tùy từng trường hợp', 'false', 41),
(229, 'Không bị nghiêm cấm', 'false', 41),
(230, 'Lắp đặt, sử dụng còi, đèn không đúng thiết kế của nhà sản xuất đối với từng loại xe cơ giới.', 'true', 42),
(231, 'Sử dụng thiết bị âm thanh gây mất trật tự an toàn giao thông, trật tự công cộng', 'true', 42),
(232, 'Bấm còi, rú ga liên tục, bấm còi trong thời gian từ 22 giờ đến 5 giờ', 'true', 43),
(233, 'Bấm còi hơi, sử dụng đèn chiếu xa trong khu đô thị và khi dân cư, trừ các xe ưu tiên đang làm nhiệm vụ', 'true', 43),
(234, 'Xâm phạm tính mạng, sức khỏe, tài sản của người bị tai nạn giao thông; xâm phạm tính mạng, sức khỏe, tài sản của người gây tai nạn giao thông', 'true', 44),
(235, 'Lợi dụng việc xảy ra tai nạn giao thông để hành hung, đe dọa, xúi giục, gây sức ép, làm mất trật tự, cản trở việc xử lý tai nạn giao thông', 'true', 44),
(236, 'Không bị nghiêm cấm', 'false', 45),
(237, 'Nghiêm cấm tùy từng trường hợp cụ thể', 'false', 45),
(238, 'Bị nghiêm cấm', 'true', 45),
(239, 'Nghiêm cấm sản xuất, được phép sử dụng', 'false', 46),
(240, 'Nghiêm cấm mua bán, cho phép sử dụng', 'false', 46),
(241, 'Nghiêm cấm sản xuất, mua bán, sử dụng trái phép', 'true', 46),
(242, 'Trên cầu hẹp có một làn xe; nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt', 'true', 47),
(243, 'Điều kiện thời tiết hoặc đường không đảm bảo an toàn cho việc vượt; xe ưu tiên đang phát tín hiệu ưu tiên làm nhiệm vụ', 'true', 47),
(244, 'Đội mũ bảo hiểm và cài quai đúng quy cách', 'false', 48),
(245, 'Sử dụng ô; bám, kéo hoặc đẩy các phương tiện khác.', 'true', 48),
(246, 'Đứng trên yên, giá đèo hàng hoặc ngồi trên tay lái; các hành vi khác gây mất trật tự an toàn giao thông', 'true', 48),
(247, 'Buông cả hai tay hoặc đi xe bằng một bánh đối với xe hai bánh, bằng hai bánh đối với xe ba bánh; chạy quá tốc độ quy định', 'true', 49),
(248, 'Sử dụng xe để kéo, đẩy xe khác, vật khác và chở vật cồng kềnh; để chân chống quẹt xuống đất và các hành vi khác gây mất trật tự an toàn giao thông', 'true', 49),
(249, 'Chạy đúng tốc độ quy định và chấp hành đúng quy tắc giao thông đường bộ', 'false', 49),
(250, 'Được mang, vác tùy trường hợp cụ thể', 'false', 50),
(251, 'Không được mang, vác', 'true', 50),
(252, 'Được mang, vác nhưng phải đảm bảo an toàn', 'false', 50),
(253, 'Được phép', 'false', 51),
(254, 'Tùy trường hợp', 'false', 51),
(255, 'Không được phép', 'true', 51),
(256, 'Phải cho xe dừng lại trước vạch dùng, trừ trường hợp đã đi quá vạch dừng thì được đi tiếp; trong trường hợp tín hiệu vàng nhấp nháy là được đi nhưng phải giảm tốc độ, chú ý quan sát, nhường đường cho người đi bộ qua đường.', 'true', 52),
(257, 'Phải cho xe nhanh chóng vượt qua vạch đường để đi qua đường giao nhau và chú ý đảm bảo an toàn; khi đèn tín hiệu vàng nhấp nháy là được đi nhưng phải giảm tốc độ, chú ý quan sát người đi bộ để đảm bảo an toàn', 'false', 52),
(258, 'Cả hai ý trên', 'false', 52),
(259, 'Là trách nhiệm của ngành Giao thông vận tải và ngành Công an', 'false', 53),
(260, 'Là trách nhiệm của cơ quan, tổ chức, cá nhân', 'true', 53),
(261, 'Là trách nhiệm của cảnh sát giao thông', 'false', 53),
(262, 'Xe tải, xe lam, xe con, mô tô.', 'false', 64),
(263, 'Xe tải, mô tô, xe lam, xe con.', 'true', 64),
(264, 'Xe lam, xe tải, xe con, mô tô.', 'false', 64),
(265, 'Mô tô, xe lam, xe tải, xe con.', 'false', 64),
(266, 'Xe công an, xe con, xe tải, xe lam.', 'true', 65),
(267, 'Xe công an, xe lam, xe con, xe tải.', 'false', 65),
(268, 'Xe công an, xe tải, xe lam, xe con', 'false', 65),
(269, 'Xe con, xe công an, xe tải, xe lam.', 'false', 65),
(270, 'Xe tải, xe lam, mô tô.', 'false', 66),
(271, 'Xe lam, xe tải, mô tô.', 'false', 66),
(272, 'Mô tô, xe lam, xe tải.', 'true', 66),
(273, 'Xe lam, mô tô, xe tải.', 'false', 66),
(274, 'Mô tô', 'false', 67),
(275, 'Xe con', 'true', 67),
(276, 'Xe con', 'true', 68),
(277, 'Xe tải', 'false', 68),
(278, 'Điều khiển xe đi trên phần đường, làn đường có ít phương tiện tham gia giao thông, đội mũ bảo hiểm ở nơi có biển báo bắt buộc đội mũ bảo hiểm.', 'false', 124),
(279, 'Chấp hành quy định về tốc độ, đèn tín hiệu, biển báo hiệu, vạch kẻ đường khi lái xe.', 'true', 124),
(280, 'Chấp hành hiệu lệnh, chỉ dẫn của người điều khiển giao thông; nhường đường cho người đi bộ, người già, trẻ em, người khuyết tật.', 'true', 124),
(281, 'Ca ba ý nêu trên.', 'false', 124),
(282, 'Xe tải, xe công an, xe khách, xe con.', 'false', 69),
(283, 'Xe công an, xe khách, xe con, xe tải.', 'false', 69),
(284, 'Xe công an, xe con, xe tải, xe khách.', 'false', 69),
(285, 'Xe công an, xe tải, xe khách, xe con.', 'true', 69),
(286, 'Xe lam, xe cứu thương, xe con.', 'true', 70),
(287, 'Xe cứu thương, xe con, xe lam.', 'false', 70),
(288, 'Xe con, xe lam, xe cứu thương.', 'false', 70),
(289, 'Mô tô.', 'false', 71),
(290, 'Xe cứu thương', 'true', 71);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Luat`
--

CREATE TABLE `Luat` (
  `id` int(11) NOT NULL,
  `tieuDe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhAnh` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tienPhat` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Luat`
--

INSERT INTO `Luat` (`id`, `tieuDe`, `hinhAnh`, `noiDung`, `loai`, `tienPhat`) VALUES
(1, 'Lỗi đội mũ bảo hiểm', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm1.png', 'Chở người trên xe không đội mũ bảo hiểm hoặc không cài quai, trừ trường hợp chở người đi cấp cứu, trẻ dưới 6 tuổi, áp giải người vi phạm pháp luật', 'Xe Máy', '100.000Đ-200.000Đ'),
(2, 'Điều khiển xe chạy quá tốc độ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm2.png', 'Điều khiển xe máy chạy quá tốc độ quy định trên 20km/h', 'Xe Máy', '3.000.000 Đ - 4.000.000 Đ'),
(3, 'Điều khiển xe chạy quá tốc độ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm2.png', 'Điều khiển xe chạy quá tốc độ quy định từ 10km/h đến 20km/h', 'Xe Máy', '500.000 Đ - 1.000.000 Đ'),
(4, 'Dừng xe, đỗ xe trong hầm', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định', 'Xe Máy', '500.000 Đ - 1.000.000 Đ'),
(5, 'Dừng xe, đỗ xe trên cầu', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Dừng xe, đỗ xe không đúng vị trí, đỗ xe trên cầu, giữa cầu', 'Xe Máy', '300.000 Đ - 400.000 Đ'),
(6, 'Không có báo hiệu xin vượt', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Không có tín hiệu xin vượt trước khi vượt phương tiện phía trước', 'Xe Máy', '60.000 Đ - 80.000 Đ'),
(7, 'Tự ý thay đổi nhãn hiệu, màu sơn xe', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm4.png', 'Tự ý thay đổi nhãn hiệu, màu sơn của xe không đúng với giấy tờ đăng kí xe.', 'Xe Máy', '100.000 Đ - 200.000 Đ'),
(8, 'Không có giấy đăng ký xe', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm5.png', 'Điều khiển xe không có Giấy đăng ký xe theo quy định', 'Xe Máy', '300.000 Đ - 400.000 Đ'),
(9, 'Chuyển làn không có tín hiệu báo trước', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước', 'Ô Tô', '300.000 Đ - 400.000 Đ'),
(10, 'Điều khiển xe chạy quá tốc độ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm2.png', 'Điều khiển xe chạy quá tốc độ  quy định từ 05km/h đến dưới 10km/h', 'Ô Tô', '600.000 Đ - 800.000 Đ'),
(11, 'Điều khiển xe chạy quá tốc độ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Điều khiển xe chạy quá tốc độ quy định trên 35km/h', 'Ô Tô', '7.000.000 Đ - 8.000.000 Đ'),
(12, 'Quay đầu xe gầy ùn tắc giao thông', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Dừng xe, đỗ xe, quay đầu xe trái quy định gây ùn tắc giao thông', 'Ô Tô', '800.000 Đ - 1.200.000 Đ'),
(13, 'Dừng xe, đỗ xe trong hầm đường bộ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định', 'Ô Tô', '800.000 Đ - 1.200.000 Đ'),
(14, 'Quay đầu xe tại giao nhau với đường sắt', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Quay đầu xe tại nơi đường bộ giao nhau cùng mức với đường sắt', 'Ô Tô', '600.000 Đ - 800.000 Đ'),
(15, 'Thu tiền vé cao hơn quy định', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/ot1.png', 'Thu tiền vé nhưng không trao vé cho hành khách; thu tiền vé cao hơn quy định', 'Ô Tô', '300.000 Đ - 400.000 Đ'),
(16, 'Thu tiền vé cao hơn quy định', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/ot1.png', 'Thu tieefnves nhưng không trao vé cho hành khách, thu tiền vé cao hơn quy định', 'Xe Khách', '300.000 Đ - 400.000 Đ'),
(17, 'Điều khiển xe liên tục quá 4 giờ', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/ot1.png', 'Điều khiển xe ô tô quá 10 giờ trong một ngày hoặc 4 liên tục trong giờ liền ', 'Xe Khách', '3.000.000 Đ- 4.000.000 Đ'),
(18, 'Không đóng cửa xe khi xe đang chạy', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Không đóng cửa lên xuống khi xe đang chạy', 'Xe Khách', '100.000 Đ - 200.000 Đ'),
(19, 'Không mặc đúng trang phụ quy định', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/ot1.png', 'Không mặc đồng phục, không đeo thẻ tên của lái xe theo quy định', 'Xe Khách', '100.000 Đ - 200.000 Đ'),
(20, 'Không chạy đúng tuyến đường quy định', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Không chạy đúng tuyến đường, lịch trình,  hành trình vận tải quy định', 'Xe Khách', '600.000 Đ - 800.000 Đ'),
(21, 'Hành hung hành khách trên xe', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Thái độ không phù hợp,, bắt nạt, hành hùng hành khách trên xe', 'Xe Khách', '3.000.000 Đ - 5.000.000 Đ'),
(22, 'Đón trả hành khách trên đường cao tốc', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Đón trả hành khách trên đường cao tốc', 'Xe Khách', '5.000.000 Đ - 6.000.000 Đ'),
(23, 'Bắt, trả hành khách khi xe đang chạy', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Để người lên, xuống xe khi xe đang chạy', 'Xe Khách', '1.000.000 Đ - 2.000.000 Đ'),
(24, 'Xe có phù hiệu quốc tế vận tải bị hết hạn', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm5.png', 'Điều khiển xe có có giấy phép vận tải quốc tế hoặc đã hết hạn sử dụng', 'Xe Tải', '3.000.000 Đ - 5.000.000 Đ'),
(25, 'Chở hàng vượt quá chiều cao xếp cho phép', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Chở hàng vượt quá chiều cao xếp hàng cho phép đối với xe ô tô tải', 'Xe Tải', '2.000.000 Đ - 3.000.000 Đ'),
(26, 'Chở hàng vượt chiều dài phía trước, sau thùng xe', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Chở hàng trên nóc thùng xe, chở hàng vượt quá bề rộng thùng xe; chở hàng vượt phía trước, phía sau thùng xe trên 10% chiều dài xe', 'Xe Tải', '800.000 Đ - 1.000.000 Đ'),
(27, 'Không thực hiện theo đúng quy định Giấy phép lưu hành', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Không thực hiện đúng quy định trong giấy phéo lưu hành', 'Xe Tải', '1.000.000 Đ - 2.000.000 Đ'),
(28, 'Vận chuyển hàng hóa nguye hiểm dừng ở nơi đông người', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Vận hành hàng nguye hiểm mà dừng, đỗ xe nơi đông người, khu dân cư, công trình quan trọng; không có báo hiệu hàng nguy hiểm theo quy định', 'Xe Tải', '1.000.000 Đ - 2.000.000 Đ'),
(29, 'Điều khiển xe chở hàng vượt giới hạn cầu, đường', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Trực tiếp điều khiển phương tiện chở hàng vượt khổ giới hạn của cầu, đường ghi trong giấy phép lưu hành', 'Xe Tải', '6.000.000 Đ - 8.000.000 Đ'),
(30, 'Giao xe cho người chưa đủ 27 tuổi điều khiển xe hạng D', 'https://androidwsv.000webhostapp.com/HinhAnh/TCL/xm3.png', 'Giao hoặc để cho người không đủ 27 tuổi điều khiển xe hạng D kéo rơ móoc', 'Xe Tải', '2.000.000 Đ - 4.000.000 Đ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `MTLT`
--

CREATE TABLE `MTLT` (
  `id` int(11) NOT NULL,
  `noiDung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `MTLT`
--

INSERT INTO `MTLT` (`id`, `noiDung`, `loai`) VALUES
(1, 'Câu khái niệm \"Phương tiện giao thông cơ giới đường bộ\" chọn \"Kể cả xe máy điện\"', 'Khái niệm quy tắc'),
(2, 'Câu khái niệm \"Phương tiện giao thông thô sơ đường bộ\" chọn \"Kể cả xe đạp máy\"', 'Khái niệm quy tắc'),
(3, 'Câu khái niệm \"Người điều khiển giao thông\" là \"Cảnh sát giao thông\".', 'Khái niệm quy tắc'),
(4, 'Câu khái niệm \"Phần đường xe chạy\" chọn câu không có chữ \"An toàn giao thông\".', 'Khái niệm quy tắc'),
(5, 'Câu khái niệm \"Làn đường\" chọn câu có chữ \"An toàn giao thông\".', 'Khái niệm quy tắc'),
(6, 'Các câu \"Đỗ xe: không có giới hạn về thời gian và Dừng xe có giới hạn thời gian\" chọn câu số 2.', 'Khái niệm quy tắc'),
(7, 'Về nồng độ cồn, trong máu = 50, trong khí thở = 0,25 hoặc không có gì cả trong máu và khí thở', 'Khái niệm quy tắc'),
(8, 'Dừng xe, đỗ xe cách lề đường, hè phố không quá 0,25 mét.', 'Khái niệm quy tắc'),
(9, 'Giữ khoảng cách 5 mét với đường sắt', 'Khái niệm quy tắc'),
(10, 'Sử dụng giấy phép lái xe giả cấp 5 năm', 'Khái niệm quy tắc'),
(11, 'Chọn \"Cơ quan quản lý giao thông\" đối với các trường hợp Xe quá tải, xe quá khổ và xe vận chuyển nguy hiểm', 'Khái niệm quy tắc'),
(12, 'Chọn \"UBND cấp tỉnh\" đối với trường hợp cấm đi, cấm đỗ, cấm dừng, đường ngược chiều', 'Khái niệm quy tắc'),
(13, 'Loại giấy tờ mang theo: Giấy phép lái xe phù hợp với loại xe', 'Khái niệm quy tắc'),
(14, 'Độ tuổi lấy bằng theo hạng (mỗi hạng cách nhau 3 tuổi): 16: Xe dưới 50cm3; 18: Hạng A,B; 21: Hạng C; 24: Hạng D,F; 27: Hạng E.', 'Khái niệm quy tắc'),
(15, 'Độ tuổi tối đa người lái xe ô tô hạng E: Nam 55 tuổi và Nữ 50 tuổi.', 'Khái niệm quy tắc'),
(16, 'Không lái xe liên tục quá 4 giờ.', 'Khái niệm quy tắc'),
(17, 'Gặp câu hỏi về hạng FE thì chọn câu 1, hạng FC thì chọn câu 2.', 'Khái niệm quy tắc'),
(18, 'Tốc độ giới hạn của xe: Bên ngoài khu dân cư 80km/h <3,5 tấn, 70km/h>3,5 tấn.', 'Khái niệm quy tắc'),
(19, 'Tốc độ của xe ô tô trên đường cao tốc, bạn lấy tốc độ (lớn nhất) trong câu hỏi rồi trừ cho 30 thì sẽ ra đáp án đúng.', 'Khái niệm quy tắc'),
(20, 'Đối với các câu có biển báo hiệu lệnh được đặt trước ngã ba, ngã tư. Chọn câu 1 nếu câu hỏi 1 dòng, câu 3 nếu câu hỏi có 2 dòng.', 'Hệ thống biển báo'),
(21, 'Biển báo cấm máy kéo thì không cấm ô tô tải và ngược lại', 'Hệ thống biển báo'),
(22, 'Biển báo cấm rẽ trái thì cấm quay đầu và biển cấm quay đầu thì không cấm rẽ trái.', 'Hệ thống biển báo'),
(23, 'Đối với câu hỏi liên quan đến việc điều khiển của CSGT, CSGT giơ tay thẳng lên thì các loại xe phải đứng lại, đưa 1 hoặc 2 tay giang ngang thì xe trước và đằng sau phải đứng lại.', 'Sa hình'),
(24, 'Đường giao nhau có vòng xuyến nhường bên trái, không có vòng xuyến nhường bên phải', 'Sa hình'),
(25, 'Thấy xuất hiện \"công an\" thì chọn câu số 3', 'Sa hình'),
(26, 'Xe nào đã vào ngã tư thì xe đó có quyền ưu tiên đi trước cao nhất', 'Sa hình'),
(27, 'Tiếp đó đến các xe ưu tiên. Trong các xe ưu tiên thì xe cứu hỏa có ưu tiên xe quân sự, xe công an, xe cứu thương.', 'Sa hình'),
(28, 'Tiếp đó nếu cùng là xe ưu tiên hoặc cùng là xe không ưu tiên thì xét đến đường ưu tiên, tức là xe nào nằm trên đường ưu tiên thì có quyền đi trước (Xem biển báo hoặc tín hiệu đèn)', 'Sa hình'),
(29, 'Xe nào không vướng xe khác ở bên phải có quyền đi trước ', 'Sa hình'),
(30, 'Thứ tự ưu tiên tiếp theo: xe rẽ phải, xe đi thằng, xe rẽ trái', 'Sa hình'),
(31, 'Hàng siêu trường, siêu trọng không thể tháo rời', 'Nghiệp vụ vận tải'),
(32, 'Xe quá tải trọng có tải trọng trục xe vượt quá năng lực chịu tải của mặt đường', 'Nghiệp vụ vận tải'),
(33, 'Hàng nguy hiểm: an ninh quốc gia và vận chuyển phải có giấy phép.', 'Nghiệp vụ vận tải'),
(34, 'Xe quá khổ, quá tải: xin phép cơ quan quản lý giao thông. ', 'Nghiệp vụ vận tải'),
(35, 'Vận chuyển động vật sống: bảo vệ mồi trường và chăm sóc.', 'Nghiệp vụ vận tải'),
(36, 'Xe vệ sinh môi trường: che phủ kín và thời gian phù hợp', 'Nghiệp vụ vận tải'),
(37, 'Lùi xe có số tự động: Đạp chân phanh hết hành trình', 'Kỹ thuật lái xe '),
(38, 'Quay đầu xe: Chọn đầu nguy hiểm, đuôi an toàn.', 'Kỹ thuật lái xe '),
(39, 'Xuống dốc muốn dừng xe: về số 1', 'Kỹ thuật lái xe '),
(40, 'Niên hạn sử dụng xe ô tô tải = 25 năm, xe ô tô trên 9 chỗ = 20 năm.', 'Cấu tạo sửa chữa'),
(41, 'Còi của xe ô tô, không lớn hơn 115dB.', 'Cấu tạo sửa chữa'),
(42, 'Điều khiển xe tăng số câu 1, điều khiển xe giảm số câu 2 (tăng 1 giảm 2).', 'Cấu tạo sửa chữa'),
(43, 'Yêu cầu của kính chắn gió, chọn \"Loại kính an toàn\"', 'Cấu tạo sửa chữa'),
(44, 'Mục đích của bảo dưỡng xe để giữ hình thức bên ngoài.', 'Cấu tạo sửa chữa'),
(45, 'Xăng không vào được buồng phao của bộ chế hòa khí do tắc bầu lọc xăng.', 'Cấu tạo sửa chữa'),
(46, 'Khắc phục giclo bằng không khí nén.', 'Cấu tạo sửa chữa'),
(47, 'Động cơ diezen không nổ không có tia lửa điện (chọn câu không có đoạn \"không có tia lửa điện\").', 'Cấu tạo sửa chữa'),
(48, 'Điều chỉnh đánh lửa \"sớm sang muộn\" chọn \"cùng chiều\" [đáp án 1], \"muộn sang sớm\" chọn \"ngược chiều\" [đáp án 2] (sớm 1 muộn 2 hoặc sớm cùng muộn ngược).', 'Cấu tạo sửa chữa'),
(49, 'Thử phanh xe ô tô 6m.', 'Cấu tạo sửa chữa'),
(50, 'Động cơ 2 kì thực hiện 2 hành trình, 4 kì thực hiện 4 hành trình.', 'Cấu tạo sửa chữa'),
(51, 'Động cơ đốt trong có thứ tự hút, nén, nổ, xả.', 'Cấu tạo sửa chữa'),
(52, 'Hộp số đảm bảo cho ô tô chuyển động lùi.', 'Cấu tạo sửa chữa'),
(53, 'Hệ thống lái dùng để thay đổi hướng chuyển động', 'Cấu tạo sửa chữa'),
(54, 'Công dụng của hệ thống lái: chọn câu nào không có chữ mô men.', 'Cấu tạo sửa chữa'),
(55, 'Công dụng hệ thống truyền lực: truyền mô men.', 'Cấu tạo sửa chữa'),
(56, 'Công dụng của ly hợp: truyền hoặc ngắt truyền động.', 'Cấu tạo sửa chữa'),
(57, 'Hệ thống phanh giữ cho ô tô đứng trên dốc', 'Cấu tạo sửa chữa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Bang`
--
ALTER TABLE `Bang`
  ADD PRIMARY KEY (`tenBang`);

--
-- Chỉ mục cho bảng `BBDB`
--
ALTER TABLE `BBDB`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `CauHinh`
--
ALTER TABLE `CauHinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenBang` (`tenBang`);

--
-- Chỉ mục cho bảng `CauHoi`
--
ALTER TABLE `CauHoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `CauTraLoi`
--
ALTER TABLE `CauTraLoi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCH` (`idCH`);

--
-- Chỉ mục cho bảng `Luat`
--
ALTER TABLE `Luat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `MTLT`
--
ALTER TABLE `MTLT`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `BBDB`
--
ALTER TABLE `BBDB`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `CauHinh`
--
ALTER TABLE `CauHinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `CauHoi`
--
ALTER TABLE `CauHoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT cho bảng `CauTraLoi`
--
ALTER TABLE `CauTraLoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT cho bảng `Luat`
--
ALTER TABLE `Luat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `MTLT`
--
ALTER TABLE `MTLT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `CauHinh`
--
ALTER TABLE `CauHinh`
  ADD CONSTRAINT `CauHinh_ibfk_1` FOREIGN KEY (`tenBang`) REFERENCES `Bang` (`tenBang`);

--
-- Các ràng buộc cho bảng `CauTraLoi`
--
ALTER TABLE `CauTraLoi`
  ADD CONSTRAINT `CauTraLoi_ibfk_1` FOREIGN KEY (`idCH`) REFERENCES `CauHoi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
