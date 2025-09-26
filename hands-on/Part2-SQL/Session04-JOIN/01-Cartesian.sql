CREATE DATABASE Cartesian
-- DB ~~ KHO ~~ TỦ ~~ THÙNG CHỨA DATA BÊN TRONG 
-- DATA BÊN TRONG CẤT DƯỚI DẠNG KỆ CÓ NGĂN - TABLE

CREATE TABLE EnDict			--DDL: 1 nhánh của SQL
(							--Data Defination Language
	Nmbr int, 
	EnDesc varchar(30)
)

--Từ điển tiếng Anh số đếm
--1 One
--2 Two
-- CHÈN DATA
SELECT * FROM EnDict		--DML Data Manipulation Languages

INSERT INTO EnDict VALUES(1, 'One')
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')

-- PHẦN NÀY THÊM CHO OUTER JOIN 
INSERT INTO EnDict VALUES(4, 'Four')

CREATE TABLE VnDict			--DDL: 1 nhánh của SQL
(							--Data Defination Language
	Nmbr int, 
	VnDesc nvarchar(30)
)

SELECT * FROM VnDict
INSERT INTO VnDict VALUES(1, N'Một')
INSERT INTO VnDict VALUES(2, N'Hai')
INSERT INTO VnDict VALUES(3, N'Ba')
INSERT INTO VnDict VALUES(5, N'Năm')

SELECT * FROM VnDict 
SELECT * FROM EnDict
--BÔI ĐEN CẢ 2 LỆNH NÀY CHẠY, THÌ KHÔNG PHẢI LÀ JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY
--CÙNG LÚC, CHO 2 TẬP KẾT QUẢ RIÊNG BIỆT
--JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RA, KO ẢNH HƯỞNG DỮ LIỆU GỐC CỦA MỖI BẢNG
--JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE

SELECT * FROM VnDict, EnDict --sinh table mới, tạm thời lúc chạy
							 --số cột = tổng 2 bên 
							 --số dòng = tích 2 bên
SELECT * FROM VnDict, EnDict ORDER BY Nmbr --BỐI RỐI TRÙNG TÊN
--GHÉP TABLE, JOIN BỊ TRÙNG TÊN CỘT, DÙNG KHÁI NIỆM ALIAS(AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU
--									 CHỈ ĐỊNH CỘT THUỘC TABLE TRÁNH NHẰM 

SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr --tham chiếu cột qua tên table

SELECT * FROM VnDict vn, EnDict en ORDER BY en.Nmbr --đặt tên giả cho table \
													--dùng nó tham chiếu cho các cột
SELECT vn.Nmbr, vn.VnDesc, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr
SELECT vn.*, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr
SELECT vn.*, en.* FROM VnDict vn, EnDict en ORDER BY en.Nmbr

--CÚ PHÁP VIẾT THỨ 2 
SELECT vn.*, en.EnDesc FROM VnDict vn CROSS JOIN EnDict en ORDER BY en.Nmbr

--tui biết rằng có cặp sài được, vì có tương hợp trong cell nào đó, here nmbr
SELECT * FROM VnDict vn, EnDict en
		 WHERE vn.Nmbr = en.Nmbr --rút 3x3 còn 3
		 -- GHÉP CÓ CHỌN LỌC TÌM TƯƠNG QUAN CỘT/CELL ĐỂ GHÉP -> INNER JOIN/OUTER 
								--EQUI JOIN 
								--ĐA PHẦN GHÉP THEO TOÁN TỬ = 
								--CÒN CÓ THỂ GHÉP THEO > >= < <= =

