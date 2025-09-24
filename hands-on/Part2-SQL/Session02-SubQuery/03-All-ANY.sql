USE Northwind

---------------------------------------------
-- Cú pháp chuẩn mệnh đề SELECT
-- SELECT * FROM <TABLE> WHERE ... 
-- WHERE CỘT TOÁN-TỬ-SO-SÁNH VỚI VALUE-CẦN-LỌC
--       CỘT > >= < <= != VALUE
--		 				DÙNG CÂU SUB-QUERY TÙY NGỮ CẢNH 
--		 CỘT			= (SUB CHỈ CÓ MỘT VALUE)

--		 CỘT			> >= < <= ALL(1 CÂU SUB MỘT CỘT NHIỀU VALUE)
--								  ANY(1 CÂU SUB MỘT CỘT NHIỀU VALUE)


---------------------------------------------
-- THỰC HÀNH 
-- tạo 1 table có một cột tên là Numbr, chỉ chứa 1 dòng các số nguyên

CREATE TABLE Num
(
	Numbr int
)

INSERT INTO Num VALUES(1)
INSERT INTO Num VALUES(1)
INSERT INTO Num VALUES(2)
INSERT INTO Num VALUES(9)
INSERT INTO Num VALUES(5)
INSERT INTO Num VALUES(100)
INSERT INTO Num VALUES(101)

SELECT * FROM Num 

--1. In ra những số > 5
SELECT * FROM Num WHERE Numbr > 5

--2. In ra só lớn nhất trong các số đã nhập
-- SỐ LỚN NHẤT TRONG MỘT DÃY SỐ ĐƯỢC ĐỊNH NGHĨA LÀ: MÀY LỚN HƠN HẾT NGUYÊN ĐÁM VÀ BẰNG CHÍNH MÌNH
-- lớn hơn tất cả, ngoại trừ chính mình
SELECT * FROM Num WHERE Numbr >= ALL(SELECT * FROM Num)

--3. Số nhỏ nhất là số nào?
SELECT * FROM Num WHERE Numbr <= ALL(SELECT * FROM Num)

--4. Nhân viên nào lớn tuổi nhất
SELECT * FROM Employees WHERE BirthDate <= ALL(SELECT BirthDate FROM Employees)
--5. Đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL(SELECT Freight FROM Orders)


