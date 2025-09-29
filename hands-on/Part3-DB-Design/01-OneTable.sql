CREATE DATABASE DBDESIGN_ONETABLE
--CREATE DÙNG ĐẺ TẠO CẤU TRÚC LƯU TRỮ/DÀN KHUNG/THÙNG DÙNG LƯU TRỮ DATA/INFO
--TƯƠNG ĐƯƠNG VIỆC XÂY PHÒNG CHỨA ĐỒ - DATABASE
--			  MUA TỦ ĐỂ TRONG PHÒNG  - TABLE
--1 DB CHỨA NHIỀU TABLE - 1 PHÒNG CÓ NHIỀU TỦ
--						- 1 NHÀ CÓ NHIỀU PHÒNG
--TẠO RA CẤU TRÚC LƯU TRỮ - CHƯA NÓI DATA BỎ VÀO -- DDL (PHÂN NHÁNH CỦA SQL)


USE DBDESIGN_ONETABLE

--Tạo table lưu trữ hồ sơ sinh viên: mã số (phân biệt các sinh viên với nhau), tên, dob, địa chỉ, .. .
-- 1 sv ~~~ OBJECT ~~~ ENTITY
-- 1 TABLE DÙNG LƯU NHIỀU ENTITY
CREATE TABLE StudentV1
(
	StudentID char(8), 
	LastName nvarchar(40), --tại sao không gộp full name cho rồi
	FirstName nvarchar(10), --n, lưu kí tự Unicode tiếng Việt
	DOB datetime, 
	Address nvarchar(50),
)

--SQL Server | Oracle | DB2 | MySQL | PostgresSQL | SQLLite | MS Access

--THAO TÁC TRÊN DATA/MÓN ĐỒ TRONG TỦ/TRONG TABLE - DML/DQL (dành riêng cho SELECT) 
SELECT * FROM StudentV1

--ĐƯA DATA VÀO TABLE/MUA ĐỒ QUẦN ÁO BỎ VÀO TỦ 
INSERT INTO StudentV1 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh');--ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN

-- MỘT SỐ CHƯA THÈM NHẬP INFO, ĐƯỢC QUYỀN BỎ TRỐNG NẾU CỘT CHO PHÉP TRỐNG VALUE
-- DEFAULT KHI ĐÓNG CÁI TỦ/MUA TỦ/THIẾT KẾ TỦ, MẶC ĐỊNH NULL 
INSERT INTO StudentV1 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL);

--TÊN THÀNH PHỐ LÀ NULL, WHERE = 'NULL' OKIE VÌ NÓ LÀ DATA
--NULL Ở CÂU TRÊN WHERE ADDRESS IS NULL 
INSERT INTO StudentV1 VALUES('SE123458', N'Võ', N'Cường', '2003-3-1', N'NULL');

--TUI CHỈ MUỐN LƯU MỘT VÀI INFO, KHÔNG ĐỦ SỐ CỘT, MIỄN CỘT CÒN LẠI CHP PHÉP BỎ TRỐNG
INSERT INTO StudentV1(StudentID, LastName, FirstName)
			  VALUES('SE123459', N'Trần', N'Dũng');

INSERT INTO StudentV1(LastName, FirstName, StudentID)
			  VALUES(N'Phạm', N'Em', 'SE123460');

INSERT INTO StudentV1(LastName, FirstName, StudentID)
			  VALUES(NULL, NULL, NULL);

INSERT INTO StudentV1(LastName, FirstName, StudentID)
			  VALUES(NULL, NULL, NULL); --siêu nguy hiểm, sv toàn info bỏ trống
										--gài cách đưa data vào các cột sao cho hợp lí
										-- CONSTRANTS TRÊN DATA/CELL/COLUMN
-- CÚ NGUY HIỂM NÀY CÒN LỚN HƠN 
-- TRÙNG MÃ SỐ KHÔNG CHẤP NHẬN ĐƯỢC, KHÔNG XÁC ĐỊNH ĐƯỢC 1 SINH VIÊN -- GÀI RÀNG BUỘC DỮ LIỆU QUAN TRỌNG NÀY
--																		CỘT VALUE CẤM TRÙNG TRÊN MỌI CELL CÙNG CỘT
--																		DÙNG LÀM CHÌA KHÓA/KEY ĐỂ TÌM RA/XÁC ĐỊNH 
--																		DUY NHẤT 1 INFO, DÒNG, 1 SV, 1 ENTITY, 1 OBJECT
--																		CỘT NÀY ĐƯỢC GỌI LÀ PRIMARY KEY

INSERT INTO StudentV1(LastName, FirstName, StudentID)
				VALUES(N'Đỗ', N'Giang', 'SE123460')

SELECT * FROM StudentV1 WHERE StudentID = 'se123460'

--GÀI CÁCH ĐƯA DATA VÀO TABLE ĐỂ KO CÓ NHỮNG HIỆN TƯỢNG BẤT THƯỜNG, 1 DÒNG TRỐNG TRƠN, KEY TRÙNG 
--KEY NULL - DEFAULT THIẾT KẾ CHO PHÉP NULL TẤT CẢ
--GÀI - CONSTRAINTS

CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY, --bao hàm luôn NOTNULL rồi -- bắt buộc đưa data, cấm trùng
	LastName nvarchar(40) NOT NULL, --tại sao không gộp full name cho rồi
	FirstName nvarchar(10) NOT NULL,  --n, lưu kí tự Unicode tiếng Việt (* đỏ) registration trong màn hình sign up
	DOB datetime, 
	Address nvarchar(50),
)

INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh');--ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN

SELECT * FROM StudentV2

INSERT INTO StudentV2(StudentID, LastName, FirstName)
			  VALUES(NULL, NULL, NULL);  --gẫy

INSERT INTO StudentV2(StudentID, LastName, FirstName)
			  VALUES('Ahihi', NULL, NULL);  --gẫy

--coi có được trùng mã số sinh viên hay không --gãy luôn
INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh');--ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN
--thử tiếp PK 
INSERT INTO StudentV2 VALUES('JD123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh');--ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN
INSERT INTO StudentV2 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL);
INSERT INTO StudentV2 VALUES('SE123458', N'Võ', N'Cường', NULL, NULL) --OKE

INSERT INTO StudentV2(StudentID, LastName, FirstName)
			  VALUES('SE123459', N'Trần', N'Dũng');

INSERT INTO StudentV2(StudentID, LastName, FirstName)
			  VALUES(NULL, NULL, NULL, NULL, NULL); --3 CHÕ GẪY NULL

CREATE TABLE StudentV3
(
	StudentID char(8) NOT NULL PRIMARY KEY, --bao hàm luôn NOTNULL rồi -- bắt buộc đưa data, cấm trùng
	LastName nvarchar(40) NOT NULL, --tại sao không gộp full name cho rồi
	FirstName nvarchar(10) NOT NULL,  --n, lưu kí tự Unicode tiếng Việt (* đỏ) registration trong màn hình sign up
	DOB datetime NULL, 
	Address nvarchar(50) NULL, --thừa từ NULL, do default là vậy
)

CREATE TABLE StudentV4
(
	StudentID char(8) NOT NULL, --bao hàm luôn NOTNULL rồi -- bắt buộc đưa data, cấm trùng
	LastName nvarchar(40) NOT NULL, --tại sao không gộp full name cho rồi
	FirstName nvarchar(10) NOT NULL,  --n, lưu kí tự Unicode tiếng Việt (* đỏ) registration trong màn hình sign up
	DOB datetime NULL, 
	Address nvarchar(50) NULL, --thừa từ NULL, do default là vậy
	PRIMARY KEY(StudentID)
)

INSERT INTO StudentV4 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh');--ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN
SELECT * FROM StudentV4

--GENERATE TỪ ERD TRONG TOOL THIẾT KẾ
CREATE TABLE StudentV5 (
  StudentID char(8) NOT NULL, 
  LastName  varchar(50) NOT NULL, 
  FirstName varchar(10) NOT NULL, 
  PRIMARY KEY (StudentID)
)

--------------------------------------------
-- HỌC THÊM VỀ CÁI CONSTRAINTS - TRONG ĐÓ PK CONSTRAINT
-- Ràng buộc là cách ta/db designer ép cell/cột nào đó value phải ntn 
-- Đặt ra quy tắc/rule cho việc nhập data
-- Vì có nhiều quy tắc, nên tránh nhằm lẫn, dễ kiểm soát ta sẽ có qui định 
-- đặt tên cho các quy tắc , constraint name 
-- Ví dụ: Má ở nhà có qui định  cho mình
-- Rule #1: vào sg ráng học thật tốt nha con. Tốt: điểm tb >= 8 && không rớt môn, .. 
-- Rule #2: Tối đi chơi về nhà sớm. Sớm: trong tối cùng ngày. 
-- Rule #3: ?? 
-- tên ràng buộc/quy tắc nội		 dung/cái data dc gài vào.
--	PK_????/							PRIMARY KEY
-- Mặc định các DB Engine nó tự đặt tên cho các ràng buộc mà nó thấy khi bạn
-- gõ lệnh DDL 
-- DB Engine cho mình cơ chế tự đặt tên RB

CREATE TABLE StudentV6
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	--PRIMARY KEY(StudentID) -- tự db enigne đặt tên cho rb
	CONSTRAINT PK_STUDENTS PRIMARY KEY(StudentID)
)

-- DÂN PRO ĐÔI KHI CÒN LÀM CÁCH SAU: NGƯỜI TÁCH HẴN VIỆC RB KHÓA CHÍNH, KHÓA NGOẠI. 
-- RA HẲN CẤU TRÚC TABLE, TƯC LÀ CREATE TALBE CHỈ CHỨA TÊN CÂU TRÚC - CỘT - DOMAINS
-- TẠO TABLE XONG RỒI CHỈNH SỬA TABLE - SỬA CÁI TỦ CHỨ KHÔNG PHẢI QUẦN ÁO TRONG TỦ.
CREATE TABLE StudentV7
(
	StudentID char(8) NOT NULL,
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	--PRIMARY KEY(StudentID) -- tự db enigne đặt tên cho rb
	--CONSTRAINT PK_STUDENTV7 PRIMARY KEY(StudentID)
)

ALTER TABLE StudentV7 ADD CONSTRAINT PK_STUDENTV7 PRIMARY KEY(StudentID)

--XÓA 1 RÀNG BUỘC ĐƯỢC KHÔNG, CHO ADD THÌ CHO DROP 
ALTER TABLE StudentV7 DROP CONSTRAINT PK_STUDENTV7

ALTER TABLE StudentV2 DROP CONSTRAINT PK__StudentV__32C52A79727993FA

