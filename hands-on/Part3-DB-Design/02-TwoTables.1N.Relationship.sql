CREATE DATABASE DBDEGSIGN_ONEMANY

USE DBDEGSIGN_ONEMANY

-- TABLE 1 TẠO TRƯỚC, TABLE N TẠO SAU
CREATE TABLE MajorV1
(
	MajorID char(2) PRIMARY KEY, --mặc định dbe tự đặt tên rb
	MajorName nvarchar(40) NOT NULL
)

--CHÈN DATA - MUA QUẦN ÁO BỎ VÔ TỦ 
INSERT INTO MajorV1 VALUES ('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV1 VALUES ('IA', N'An toàn thông tin')


CREATE TABLE StudentV1
(
	StudentID char(8) NOT NULL,
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	MajorID char(2) --tên cột khóa ngoại/tham chiếu không cần trùng bên 1-Key
				--NHƯNG BẮT BUỘC TRÙNG 100% KIỂU DỮ LIỆU, CẦN THAM CHIẾU 
				--DATA HOY
	CONSTRAINT PK_STUDENTV1 PRIMARY KEY(StudentID)
)

--CHÈN DATA SINH VIÊN
SELECT * FROM StudentV1

INSERT INTO StudentV1 VALUES ('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')

-- THIẾT KẾ TRÊN SAI VÌ KHÔNG CÓ THAM CHIẾU GIỮA MAJORID CỦA STUDENT VS. MAJOR PHÍA TRÊN
INSERT INTO StudentV1 VALUES ('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'AH')

CREATE TABLE MajorV2
(
	MajorID char(2) PRIMARY KEY, --mặc định dbe tự đặt tên rb
	MajorName nvarchar(40) NOT NULL
)
DROP TABLE MajorV2

DROP TABLE StudentV2
CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	--MajorID char(2) REFERENCES MajorV2(MajorID)
	MajorID char(2) FOREIGN KEY REFERENCES MajorV2(MajorID)
	--tớ chọn chuyên ngành ở trên kia kìa, xin tham chiếu trên kia 
)

INSERT INTO MajorV2 VALUES ('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV2 VALUES ('IA', N'An toàn thông tin')

INSERT INTO StudentV2 VALUES ('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')
INSERT INTO StudentV2 VALUES ('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'GD')

SELECT * FROM StudentV2

-- KHÔNG ĐƯỢC XÓA TABLE 1 NẾU NÓ ĐANG ĐƯỢC THAM CHIẾU BỞI THẰNG KHÁC
-- NẾU CÓ MỐI QUAN HỆ 1-N, XÓA N TRƯỚC RỒI XÓA 1 SAU




