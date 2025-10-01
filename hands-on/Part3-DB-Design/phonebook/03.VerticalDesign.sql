--CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV3_1
(
	Nick nvarchar(30), 
	Phone char(11), 
)
--MỞ RỘNG TABLE THEO CHIỀU DỌC, AI CÓ NHIỀU SIM THÌ THÊM DÒNG!!!
SELECT * FROM PhoneBookV3_1
INSERT INTO PhoneBookV3_1 VALUES(N'thinhcg', '098x')

INSERT INTO PhoneBookV3_1 VALUES(N'annguyen', '090x')
INSERT INTO PhoneBookV3_1 VALUES(N'annguyen', '091x')

INSERT INTO PhoneBookV3_1 VALUES(N'binhle', '090x')
INSERT INTO PhoneBookV3_1 VALUES(N'binhle', '091x')
INSERT INTO PhoneBookV3_1 VALUES(N'binhle', '092x')


-- *****PHÂN TÍCH: ưu nhược điểm 
-- >>>> ƯU ĐIỂM: SELECT PHONE: LÀ RA ĐƯỢC TẤT CẢ CÁC SỐ DI ĐỘNG LUÔN 
--> Thống kê số lượng số điện thoại mỗi người xài, mấy sim?? NGON
SELECT Nick, COUNT(*) AS [No phones] FROM PhoneBookV3_1 GROUP BY(Nick)
--> Không bị NULL, muốn thêm bao nhiêu số phone thì thêm 

-- >>>> NHƯỢC ĐIỂM 
--1.SQL. Cho tui biết các số di động của mọi người
--> Không biết số phone X nào đó thuộc loại nào ?
-- >>>> Cho tui biết số để bàn, ở nhà của anh binhle???
-- >>>> In cho tui số di động của mọi người??? 
-- vi phạm PK, redundancy, annguyen lặp lại nhiều lần làm gì khi annguyen mới lưu nick 
-- fullname, title, tên công ty, email....


SELECT * FROM PhoneBookV3_1
--> data bị null, phí không gian lưu trữ. 

--> TRIẾT LÝ THIẾT KẾ: CỐ GẮNG GIỮ NGUYÊN CÁI TỦ, CHỈ THÊM ĐỒ,
--					   KHÔNG THÊM CỘT CỦA TABLE, CHỈ CẦN THÊM DÒNG NẾU CÓ BIẾN ĐỘNG. 
--					   SỐ LƯỢNG 

-- TRÁNH BỊ REDUNDANCY, PK -> TÁCH BẢNG, PHẦN LẶP LẠI RA 1 CHỖ KHÁC

------------------------------------------------------
--TA CẦN GIẢI QUYẾT PHONE NÀY THUỘC LOẠI NÀO ???
CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30), 
	Phone char(11), -- chỉ 1 số hoi, CẦN THÊM SỐ NÀY LÀ SỐ GÌ ? 
	PhoneType nvarchar(20) -- 090x Home; 091x Work
)

SELECT * FROM PhoneBookV3_2
INSERT INTO PhoneBookV3_2 VALUES(N'thinhcg', '098x', 'Cell')

INSERT INTO PhoneBookV3_2 VALUES(N'annguyen', '090x', 'Cell')
INSERT INTO PhoneBookV3_2 VALUES(N'annguyen', '091x', 'Home')
INSERT INTO PhoneBookV3_2 VALUES(N'binhle', '090x', 'Work')
INSERT INTO PhoneBookV3_2 VALUES(N'binhle', '091x', 'Cell')
INSERT INTO PhoneBookV3_2 VALUES(N'binhle', '092x', 'Cell')

-- PHÂN TÍCH 
-- *ƯU ĐIỂM
-- Count ngon, group by theo nick, theo loại phone. 
-- where theo loại phone ngon. 
SELECT * FROM PhoneBookV3_2 WHERE PhoneType = 'Cell'

-- *NHƯỢC ĐIỂM 
-- Redundancy trên info của nick/full/city/email/namsinh. 

-- MỘT KHI BỊ LẶP LẠI INFO, LẶP LẠI INFO, REDUNDANCY, CHỈ CÓ 1 SOLUTION 
-- KO CHO TRÙNG, TƯC LÀ XUẤT HIỆN 1 LẦN, LÀ RA BẢNG KHÁC > DECOMPOSITION PHÂN RÃ

