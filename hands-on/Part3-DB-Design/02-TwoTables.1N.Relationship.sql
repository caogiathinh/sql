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

-----------------------------------------------
-- THÊM KĨ THUẬT VIẾT KHÓA NGOẠI, Y CHANG CÁCH VIẾT CỦA PK
DROP TABLE MajorV3 

CREATE TABLE MajorV3
(
	MajorID char(2) PRIMARY KEY, --mặc định dbe tự đặt tên rb
	MajorName nvarchar(40) NOT NULL
)
/*
DROP TABLE StudentV3 
CREATE TABLE StudentV3
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	--MajorID char(2) REFERENCES MajorV2(MajorID)
	MajorID char(2), 
	CONSTRAINT FK_StudentV3_MajorV3
			   FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
)
*/
CREATE TABLE StudentV3
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL, 
	Address nvarchar(50) NULL,
	--MajorID char(2) REFERENCES MajorV2(MajorID)
	MajorID char(2) DEFAULT 'SE', 
	CONSTRAINT FK_StudentV3_MajorV3
			   FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
			   ON DELETE SET DEFAULT
			   ON UPDATE CASCADE
)
INSERT INTO StudentV3(StudentID, LastName, FirstName) VALUES ('SE2', N'PHẠM BÌNH', N'AN')


--TA CÓ QUYỀN GỠ RÀNG BUỘC ĐÃ THIẾT LẬP 
-- 
ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3

-- BỔ SUNG LẠI 1 RÀNG BUỘC KHÁC
ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3
			   FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)



-- INSERT LÀ CHẾT, DO THAM CHIẾU KHÔNG TỒN TẠI 
INSERT INTO StudentV3 VALUES ('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')

INSERT INTO MajorV3 VALUES ('SE', N'Kĩ thuật phần mềm')

INSERT INTO MajorV3 VALUES ('AH', N'Ahihi Đồ Ngok')

INSERT INTO StudentV3 VALUES ('AH1', N'LÊ', N'VUI VẺ', NULL, NULL, 'AH')
-- THAO TÁC MẠNH TAY TRÊN DATA(MÓN ĐỒ QUẦN ÁO TRONG TỦ) --DML (UPDATE & DELETE)
DELETE FROM StudentV3 --CỰC KÌ NGUY HIỂM KHI THIẾU WHERE XÓA HẾT DATA!!!

DELETE FROM StudentV3 WHERE StudentID = 'AH1'
DELETE FROM MajorV3 WHERE MajorID = 'AH'

SELECT * FROM MajorV3
SELECT * FROM StudentV3

-- GÀI THÊM HÀNH XỬ KHI XÓA, SỬA DATA Ở RÀNG BUỘC KHÓA NGOẠI/DÍNH KHÓA CHÍNH LUÔN
-- HIỆU ỨNG DOMINO, SỤP ĐỔ DÂY CHUYỀN, 1 XÓA, 1 N ĐI SẠCH >>> CASCADE DELETE
--									   1 SỬA, N BỊ SỬA THEO >>>> CASCADE CASCADE UPDATE
-- NGAY LÚC THIẾT KẾ TABLE/CREATE TABLE ĐÃ PHẢI TÍNH VỤ NÀY RÒI
-- VẪN CÓ THỂ SỬA SAU KHI CÓ DATA, CÓ THỂ CÓ TROUBLE. 
-- CỤM LỆNH: CREATE / ALTER / DROP
ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3 --XÓA RÀNG BUỘC KHÓA NGOẠI BỊ THIẾU
-- VIỆC GÀI THÊM RULE NHỎ LIÊN QUAN XÓA SỬA DATA

ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3
			   FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
			   ON DELETE CASCADE
			   ON UPDATE CASCADE

UPDATE MajorV3 SET MajorID = 'AK' --CẨN THẬN NẾU KHÔNG CÓ WHERE, TOÀN BỘ TABLE BỊ ẢNH HƯỞNG
								  --TRỪ UPDATE CỘT KEY
UPDATE MajorV3 SET MajorID = 'AK' WHERE MajorID = 'AH'

--SỤP ĐỔ, XÓA 1, N ĐI SẠCH
--XÓA CHUYÊN NGÀNH AHIHI XEM SAO ? CÒN SV NÀO HONG ? 
DELETE FROM MajorV3 WHERE MajorID = 'AK' --SV CÓ MÃ SỐ AH1 LÊN ĐƯỜNG

-- CÒN 2 CÁI GÀI LIÊN QUAN TỚI TÍNH ĐỒNG BỘ CỦA DATA /CONSISTENCY 
-- SET NULL VÀ DEFAULT
-- KHI 1 XÓA N VỀ NULL 
-- KHI 1 XÓA N VỀ DEFAULT
SELECT * FROM MajorV3
SELECT * FROM StudentV3

--******** CHỐT HẠ
-- XÓA BÊN 1 TỨC LÀ MẤT BÊN 1 HONG LẼ SỤP CẢ ĐÁM BÊN N, KO HAY, NÊN CHỌN ĐƯA BÊN N VỀ NULL
-- UPDATE BÊN 1, BÊN 1 VẪN CÒN GIỮ ROW, BÊN N NÊN ĂN THEO CASCADE.

ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3

ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3
			   FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
			   ON DELETE SET NULL --XÓA CHO BƠ VƠ
			   ON UPDATE CASCADE  --SỬA CHO DOMINO

UPDATE MajorV3 SET MajorID = 'AK' WHERE MajorID = 'AH' --kiểm tra
DELETE FROM MajorV3 WHERE MajorID = 'AH'

--CHO SINH VIÊN BƠ VƠ CHUYÊN NGÀNH VỀ HỌC SE
UPDATE StudentV3 SET MajorID = 'SE' --TOÀN TRƯỜNG HỌC SE TOANG
UPDATE StudentV3 SET MajorID = 'SE' WHERE MajorID IS NULL

