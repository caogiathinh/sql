USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA MỆNH ĐỀ SELECT
-- HKI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >= .... AND <=... , TA CÓ THỂ THAY THẾ 
-- BẰNG MỆNH ĐỀ BETWEEN IN
-- *Cú pháp: CỘT BETWEEN VALUE-1 AND VALUE-2 
--						>>>>> BETWEEN THAY THẾ CHO 2 MỆNH DỀ >= AND <=
-- *Cú pháp: IN (Một tập hợp các giá trị được liệt kê cách nhau dấu phẩy)
--						>>>>> IN THAY THẾ CHO MỘT LOẠT CÁC OR

--------------------------------------------------------------
-- 1. Liệt kê danh sách nhân viên sinh trong đoạn 1960-1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 
ORDER BY BirthDate DESC

SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 ORDER BY BirthDate DESC --4

-- 2. Liệt kê các đơn hàng có trọng lượng từ 100 đến 500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500 --174
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500

-- 3. Liệt kê các đơn hàng gửi tới Anh Pháp Mĩ.
SELECT * FROM Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'France' 
												OR ShipCountry = 'UK' --255

SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'France', 'UK')

-- 4. Liệt kê các đơn hàng KO gửi tới Anh Pháp Mĩ.
SELECT * FROM Orders WHERE NOT(ShipCountry = 'USA' OR ShipCountry = 'France' 
												OR ShipCountry = 'UK') --575
SELECT * FROM Orders WHERE ShipCountry NOT IN ('USA', 'France', 'UK') --575

-- 5. Liệt kê các đơn hàng trong năm 1996 loại trừ các tháng 6 7 8 9
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) <> 6 
													AND MONTH(OrderDate) <> 7
													 AND MONTH(OrderDate) <> 8
													  AND MONTH(OrderDate) <> 9

SELECT * FROM Orders WHERE (YEAR(OrderDate) = 1996) 
					   AND (MONTH(OrderDate) NOT IN (6,7,8,9))

-- LƯU Ý IN: CHỈ KHI TA LIỆT KÊ ĐƯỢC TẬP GIÁ TRỊ THÌ MỚI CHƠI IN 
-- KHOẢNG SỐ THỰC KO LÀM ĐƯỢC 
-- 6. Liệt kê đơn hàng có trọng lượng từ 100...110 
SELECT * FROM Orders ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 110 ORDER BY Freight DESC
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 110 ORDER BY Freight DESC
SELECT * FROM Orders WHERE Freight IN () -- 100 ... 110 VÔ SỐ GIÁ TRỊ THỰC

-- CÂU QUERY RẤT DA DẠNG VÀ CHỈ HỌC NHỮNG CÁI CĂN BẢN ĐỂ KHAI THÁC