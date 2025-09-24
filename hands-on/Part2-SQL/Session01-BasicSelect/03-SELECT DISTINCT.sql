-------------------------------------------------------------
--LÍ THUYẾT 
-- Dùng lệnh SELECT để xem/in dữ liệu từ table, cũng hiển thị dữ liệu dưới dạng table. 
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc tôi muốn lấy all of columns
-- CÚ PHÁP MỞ RỘNG 
--				SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH-NHAU-DẤU-PHẨY FROM <TÊN-TABLE> 
--				SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--				FROM <TÊN-TABLE>
-- Khi ta SELECT ít cột từ table gốc thì có nguy cơ dữ liệu bị trùng lại. 
-- không phỉa ta bị sai, ko phải người thiết kế table và người nhập liệu bị sai 
-- do chúng ta cso nhiều info trùng nhau/đặc điểm trùng nhau, nên chỉ tập trung vào data này chắc chắn sẽ trùng
-- 100 triệu người dân việt nam dc quản lí info bao gồm: ID, Tên, DOB, ... Tỉnh thành đang sống
--													     <>                  63 tỉnh
-- LỆNH SELECT HỖ TRỢ LOẠI BỎ DÒNG TRÙNG NHAU 
-- SELECT DISTINCT TÊN-CÁC-CỘT FROM <TÊN-TABLE>
---------------------------

-- 1. Liệt kê danh sách nhân viên
SELECT * FROM Employees

-- phân tích: 9 người nhưng chỉ có 4 title 
SELECT TitleOfCourtesy FROM Employees --9 
SELECT DISTINCT TitleOfCourtesy FROM Employees --4   

SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees
-- NẾU DISTINCT ĐI KÈM VỚI KEY VÔ DỤNG, KEY SAO LOẠI TRỪ

-- 2. In ra thông tn khách hàng
SELECT * FROM Customers --92

-- 3. Có bao nhiêu quốc gia xuất hiện trong thông tin kh
SELECT Country FROM Customers --92
SELECT DISTINCT Country FROM Customers --22



