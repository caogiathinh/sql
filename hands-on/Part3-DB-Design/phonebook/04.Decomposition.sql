--CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30), --ngoài cột này bị lặp lại, mình còn thêm cột
					   --fullname, tên city, chức vụ. 
	--... CompanyName,.. 
	Phone char(11), -- chỉ 1 số hoi, CẦN THÊM SỐ NÀY LÀ SỐ GÌ ? 
	PhoneType nvarchar(20) -- 090x Home; 091x Work
)
-----------------------------------------
-- TÁCH BẢNG
-- THÔNG TIN BỊ PHÂN MẢNH, NẰM NHIỀU NƠI, PHẢI JOIN 
-- NHẬP DATA COI CHỪNG BỊ VÊNH, XÓA DATA COI CHƯỜNG LẠC TRÔI 
-- PHÂN MẢNH PHẢI CÓ LÚC TÁI NHẬP (JOIN) TRÊN CỘT NÀO ??? 
-- FK XUẤT HIỆN 
-- không chơi với Fk có được k ? 
-- nếu chỉ cần join k cần FK, cột = value, khớp là join, nối bảng, ghép ngang 
-- nếu kèm thêm, xóa, sửa, chết chưa, lộn xộn không nhất quán

CREATE TABLE PersonV4_1
(
	Nick nvarchar(30),
	Title nvarchar(30), 
	Company nvarchar(40) 
)

CREATE TABLE PhoneBookV4_1
(
	Phone char(11), 
	PhoneType nvarchar(20),
	Nick nvarchar(30) --không cần fk, chỉ cần join là okie. 
)

SELECT * FROM PhoneBookV4_1
SELECT * FROM PersonV4_1

INSERT INTO PersonV4_1 VALUES(N'thinhcg', 'Student', 'OU HCMC')
INSERT INTO PersonV4_1 VALUES(N'annguyen', 'Student', 'OU HCMC')
INSERT INTO PersonV4_1 VALUES(N'binhle', 'Student', 'OU HCMC')


INSERT INTO PhoneBookV4_1 VALUES('098x', 'Cell', 'thinhcg')
INSERT INTO PhoneBookV4_1 VALUES('090x', 'Cell', N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES('091x', 'Home', N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES('090x', 'Work', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES('091x', 'Cell', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES('092x', 'Cell', N'binhle')

-- PHÂN TÍCH: 
-- **ƯU ĐIỂM: 
-- Cout ngon, group by theo nicl, theo loại phone
-- where theo loại phone ngon 

-- **NHƯỢC ĐIỂM:
-- Tính không nhất quán (inconsistency) của loại phone: có người gõ: Cell, cell, CELL éo sợ vì cùng 1 kiểu
--																     gõ thêm: Di động, DĐ -> cả đám này đều là 1
--																	 máy hiểu là khác nhau
-- query liệt kê các số di động của tất cả mọi người, toang khi WHERE 
-- vì éo biết được có bao nhiêu loại chữ biểu diễn cho DI ĐỘNG
INSERT INTO PhoneBookV4_1 VALUES('093x', 'MOBILE', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES('093x', 'Sugar Daddy', N'binhle')

-- liệt kê các số di động của bạn binhle
SELECT * FROM PhoneBookV4_1
		 WHERE PhoneType = 'Cell' OR PhoneType = 'Cell' OR PhoneType = 'DĐ'

SELECT * FROM PhoneBookV4_1
		 WHERE PhoneType IN('cell', 'Cell', 'DĐ')
		 -- mày tính IN cái tập hợp này đến bao giờ khi người ta gõ từ khác. 
		 -- cùng biểu diễn khái niệm di động

-- QUY TẮC QUAN TRỌNG CÓ NHỮNG LOẠI DỮ LIỆU BIẾT TRƯỚC LÀ NHIỀU, NHƯNG HỮU HẠN VALUE ĐỂ NHẬP 
-- TỈNH THÀNH NHIỀU NHƯNG CHỈ 63, QUỐC GIA NHIỀU NHƯNG CHỈ 239, CHÂU LỤC NHIỀU NHƯNG CHỈ 56, TRƯỜNG THPT, 500 TRƯỜNG
-- CÓ NÊN CHO NGƯỜI TA GÕ TAY HAY KO, KO VÌ NÓ SẼ GÂY NÊN KO NHẤT QUÁN !!! 
-- TỐT NHẤT CHO CHỌN, CHỌN PHẢI TỪ CÁI CÓ SẴN, SẴN TỨC LÀ TỪ TABLE KHÁC. 

-- KO CHO GÕ LUNG TUNG, GÕ TRONG CÁI ĐÃ CÓ - DÍNH 2 THỨ, TABLE KHÁC (ĐÃ NÓI TRÊN)
--						FK ĐỂ ĐẢM BẢO CHỌN ĐÚNG TRONG ĐÓ THÔI 


