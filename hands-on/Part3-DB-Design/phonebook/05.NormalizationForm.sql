--CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PersonV5_1_ 
(
	Nick nvarchar(30),
	Title nvarchar(30), 
	Company nvarchar(40) 
)

CREATE TABLE PhoneBookV5_1_
(
	Phone char(11), 
	PhoneType nvarchar(20), -- cho gõ trực tiếp loại phone, GÂY LỘN XỘN LOẠI PHONE, CELL, DĐ, MOBILLE, 
							-- THỐNG KÊ KHÓ KHĂN VÀ CÒN TIẾP TỤC SỬA OR NỮA DO CHO GÕ TỰ DO 
							-- HẠN CHẾ KHÔNG CHO GÕ LỘN XỘN, TỨC LÀ PHẢI GÕ/CHỌN THEO AI ĐÓ CÓ TRƯỚC , FK
	Nick nvarchar(30) --không cần fk, chỉ cần join là okie. 
)

CREATE TABLE PersonV5_1
(
	Nick nvarchar(30),
	Title nvarchar(30), 
	Company nvarchar(40) 
)

CREATE TABLE PhoneTypeV5_1
(	
	TypeName nvarchar(20)
)

--không muốn xóa table mà vẫn thêm khóa chính
ALTER TABLE PhoneTypeV5_1 ALTER COLUMN TypeName nvarchar(20) NOT NULL

ALTER TABLE PhoneTypeV5_1
	ADD CONSTRAINT PK_PHONETYPEV51 PRIMARY KEY(TypeName)

CREATE TABLE PhoneBookV5_1
(
	Phone char(11), 
	TypeName nvarchar(20) REFERENCES PhoneTypeV5_1(TypeName),
	Nick nvarchar(30) --không cần fk, chỉ cần join là okie. 
)

-- TABLE MỚI XUẤT HIỆN, LƯU LOẠI PHONE, KO CHO GÕ LUNG TUNG ~~~  TABLE PROVINCE, CITY, COUNTRY, SEMESTER
SELECT * FROM PhoneTypeV5_1
SELECT * FROM PhoneBookV5_1
SELECT * FROM PersonV5_1

INSERT INTO PhoneBookV5_1 VALUES('098x', N'Di động', 'hoangnt')
INSERT INTO PhoneBookV5_1 VALUES('098x', N'Nhà để bàn', 'anguyen')
INSERT INTO PhoneBookV5_1 VALUES('098x', N'Cha dượng ngọt ngào', 'binhle')
INSERT INTO PhoneBookV5_1 VALUES('098x', N'Suger daddy', 'binhle') --không có trong drop down - table bên kia
INSERT INTO PhoneBookV5_1 VALUES('092x', N'Công ty', 'binhle')


INSERT INTO PhoneTypeV5_1 VALUES(N'Di động')
INSERT INTO PhoneTypeV5_1 VALUES(N'Nhà để bàn')
INSERT INTO PhoneTypeV5_1 VALUES(N'Công ty')
INSERT INTO PhoneTypeV5_1 VALUES(N'Cha dượng ngọt ngào')
 
INSERT INTO PersonV5_1 VALUES(N'thinhcg', 'Student', 'OU HCMC')
INSERT INTO PersonV5_1 VALUES(N'annguyen', 'Student', 'OU HCMC')
INSERT INTO PersonV5_1 VALUES(N'binhle', 'Student', 'OU HCMC')

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

-- ======================================


SELECT * FROM PhoneTypeV5
SELECT * FROM PhoneBookV5
SELECT * FROM PersonV5

CREATE TABLE PersonV5
(
	Nick nvarchar(30) PRIMARY KEY, --CÒN CẦN BÀN THÊM VỀ PK HERE/PERFORMANCE
	Title nvarchar(30), 
	Company nvarchar(40) 
)

CREATE TABLE PhoneTypeV5
(	
	TypeName nvarchar(20) NOT NULL --CÒN CẦN BÀN THÊM VỀ PK HERE/PERFORMANCE
	PRIMARY KEY(TypeName)
)

CREATE TABLE PhoneBookV5
(
	Phone char(11) NOT NULL,  --số thoại này là số mấy
	TypeName nvarchar(20) REFERENCES PhoneTypeV5(TypeName), --thuộc loại gì
	Nick nvarchar(30) REFERENCES PersonV5(Nick) -- của ai
	CONSTRAINT PK_PHONEBOOKV5 PRIMARY KEY(Phone)
	-- loại gì của ai, không gõ lung tung
)

INSERT INTO PhoneTypeV5 VALUES(N'Di động')
INSERT INTO PhoneTypeV5 VALUES(N'Nhà để bàn')
INSERT INTO PhoneTypeV5 VALUES(N'Công ty')
INSERT INTO PhoneTypeV5 VALUES(N'Cha dượng ngọt ngào')
 
INSERT INTO PersonV5 VALUES(N'thinhcg', 'Student', 'OU HCMC')
INSERT INTO PersonV5 VALUES(N'annguyen', 'Student', 'OU HCMC')
INSERT INTO PersonV5 VALUES(N'binhle', 'Student', 'OU HCMC')

INSERT INTO PhoneBookV5 VALUES('098x', N'Di động', N'thinhcg')
INSERT INTO PhoneBookV5 VALUES('092x', N'Nhà để bàn', N'annguyen')
INSERT INTO PhoneBookV5 VALUES('094x', N'Cha dượng ngọt ngào', N'binhle')
INSERT INTO PhoneBookV5 VALUES('091x', N'Suger daddy', N'binhle') --không có trong table Phone type không cho phép INSERT vào table PhoneBook 
INSERT INTO PhoneBookV5 VALUES('093x', N'Công ty', N'binhle')

SELECT * FROM PersonV5
SELECT * FROM PhoneTypeV5 
SELECT * FROM PhoneBookV5

  

