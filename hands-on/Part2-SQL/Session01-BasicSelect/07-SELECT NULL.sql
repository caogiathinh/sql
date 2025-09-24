USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA MỆNH ĐỀ SELECT
-- Trong thực tế có những lúc dữ liệu/info chưa xác định dc nó là gì ?
-- từ từ sẽ có sẽ update
-- hiện tượng dữ liệu chưa xác định, hay từ từ đưa vào sau, hiện nay nhìn vào chưa thấy có data, 
-- thì ta gọi giá trị chưa xác định là NULL 
-- NULL ĐẠI DIỆN COH THỨ CHƯA XĐ, TỨC LÀ CHƯA CÓ GIÁ TRỊ, KHÔNG GIÁ TRỊ 
-- THÌ KHÔNG THỂ SO SÁNH > < >= <= != 
-- CẤM TUYỆT ĐỐI XÀI CÁC TOÁN TỬ SO SÁNH KÈM VỚI GIÁ TRỊ NULL 
-- TA DÙNG CÁC TOÁN TỬ, IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ LỌC CELL Ô CÓ GIÁ TRỊ NULL
--------------------------------------------------------------

-- THỰC HÀNH
-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Ai chưa xác định Region, region null
SELECT * FROM Employees WHERE Region = 'NULL' --0, vì không có ai ở khu vực tên là NULL 
SELECT * FROM Employees WHERE Region = NULL --0, vì NULL không dùng < > = 
SELECT * FROM Employees WHERE Region IS NULL -- 4

-- 3. Những ai dã xác định được khu vực cư trú
SELECT * FROM Employees WHERE Region IS NOT NULL --5
SELECT * FROM Employees WHERE NOT (Region IS NULL)

-- 4. Nhân viên đại diện kinh doanh và xác định được nơi cư trú
SELECT * FROM Employees WHERE (Title = 'Sales Representative') AND (Region IS NOT NULL) --3
SELECT * FROM Employees WHERE (Title = 'Sales Representative') AND NOT(Region IS NULL) --3

-- 5. Liệt kê danh sách khách hàng đến từ Anh Pháp Mĩ, có cả thông tin số fax và region 
SELECT * FROM Customers WHERE Country IN('USA', 'UK', 'France') 
							AND Region IS NOT NULL  
							AND Fax IS NOT NULL






