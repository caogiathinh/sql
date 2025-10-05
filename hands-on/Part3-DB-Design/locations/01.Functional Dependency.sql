CREATE DATABASE DBDESIGN_LOCATIONS

USE DBDESIGN_LOCATIONS

--THIẾT KẾ CSDL lưu được thông tin phường/xã, quận/huyện, tỉnh/thành phố
--chính là 1 phần của địa chỉ được tách ra cho nhu cầu thống kê
--nó lại là 1 phần của Composite Field mỗi thằng một vai trò 
--|SEQ|Dose|InjDate|Vaccinne(PK LK)|Lot|Địa chỉ chích - compo|
--|SEQ|Dose|InjDate|Vaccinne(PK LK)|Lot|Số nhà|Phường-Quận-Tỉnh|

--XÉT RIÊNG PHƯỜNG-QUẬN-TỈNH RÕ RÀNG 3 CỘT LOOKUP
CREATE TABLE Locations
(
	province nvarchar(30), 
	district nvarchar(30), 
	ward nvarchar(30)
)

SELECT * FROM Locations

--PHÂN TÍCH TABLE
--1. TRÙNG LẶP CỤM INFO TỈNH-QUẬN
--2. LOOKUP TRÊN PROVINCE, DISTRICT (WARD)

--3. SỰ PHỤ THUỘC LOGIC GIỮA TỈNH VÀ DISTRICT (WARD) 
--   FUNCTIONAL DEPENDENCY - FD - PHỤ THUỘC HÀM
-- CÓ 1 CÁI ÁNH XẠ, MỐI QUAN HỆ GIỮA A VÀ B, PRIVINCE VS DISTRICT
-- CỨ CHỌN TP.HCM -> Q1, Q2, Q3, .. 
--	ĐN            -> BIÊN HÒA, LONG BÌNH TÂN, LK, .. 

-- CHỌN HỒ CHÍ MINH -> CÁC QUẬN, PHƯỜNG CỦA TPHCM 
-- TÁCH LOOKUP VÌ DỄ NHẤT 
-- RA 1 TABLE, PHẦN TABLE CÒN LẠI THÌ FK SANG LOOKUP 

-- Vaccination (liều, tên vaccine)
--						FK sang vaccine(tên vaccine)

--CHỈ LOOKUP 63 TỈNH KHÔNG CHO CHỌN LỘN XỘN 

CREATE TABLE Province
(
	PName nvarchar(30)
)

SELECT * FROM PROVINCE
SELECT * FROM Locations --10581 dòng tương ứng với 10581 xã phường khác nhau
						--nhưng chỉ có 63 tỉnh thành lặp lại 

SELECT DISTINCT Province FROM Locations --giống cục thống kê

-- dùng nó để insert vào bảng lookup
INSERT INTO Province VALUES (N'Thành phố Hồ Chí Minh')
INSERT INTO Province VALUES (N'Tỉnh Vĩnh Long')
DELETE FROM Province

--CÁCH INSERT THỨ 2
INSERT INTO Province VALUES (N'Tỉnh Vĩnh Long'), (N'Thành phố Hồ Chí Minh')

--TUYỆT CHIÊU THỨ 3
--COPY PASTE

--TUYỆT CHIÊU INSERT THỨ 4
--INSERT INTO Province VALUES CÓ 63 TỈNH THÀNH LÀ NGON - TA XÀI KIỂU SUB QUERY 
--							TRONG LỆNH INSERT
							 
INSERT INTO Province SELECT DISTINCT Province FROM Locations 

SELECT * FROM Province

SELECT COUNT(*) FROM Locations --10581 XÃ PHƯỜNG
SELECT COUNT(Province) FROM Locations 
SELECT COUNT(DISTINCT Province) FROM Locations 

--TẠO TABLE LOOKUP QUẬN/HUYỆN 
CREATE TABLE District
(
	DName nvarchar(30)
)

--có bao nhiu quận ở Việt Nam 
SELECT District FROM Locations -- 10581 quận dc lặp đi lặp lại ứng với 10581 phường khác. 

SELECT COUNT(DISTINCT District) FROM Locations --683, 683 QUẬN KHÁC NHAU 
-- RẤT CẨN THẬN KHI CHƠI VỚI QUẬN/HUYỆN
-- TIỀN GIANG, VĨNH LONG, TRÀ VINH, ĐỀU CÓ HUYỆN "CHÂU THÀNH" 
-- DISTINCT SẼ BỊ HỤT 
-- BẢNG DISTRICT CHỈ CÓ 1 CHÂU THÀNH, LÁT HỒI !!!
-- PK CỦA DISTRICT KHÔNG THỂ LÀ TÊN QUẬN/HUYỆN ĐƯỢC 
-- 

--CHÈN VÀO TABLE QUẬN 
INSERT INTO District SELECT DISTINCT District FROM Locations
SELECT * FROM District

--CITY và DISTRICT CÓ SỰ PHỤ THUỘC LẪN NHAU,  TỪ THẰNG NÀY SUY RA ĐƯỢC THẰNG KIA
--NHÌN QUẬN CÓ THỂ ĐOÁN THÀNH PHỐ (CHIỀU NÀY KHÔNG CHẮC AN TOÀN)
--								   NHÌN CHÂU THÀNH SAO ĐOÁN ĐƯỢC TỈNH ?? 
--NHÌN TP ĐOÁN RA QUẬN (HỢP LÝ VỀ SUY LUẬN)
--							VĨNH LONG -> MANG THÍT, CHÂU THÀNH
--							SÓC TRĂNG -> ...........CHÂU THÀNH

--FD NÊN ĐỌC LÀ CITY -> DISTRICT
--TABLE MÀ CHỨA CÁC FD PHỤ THUỘC NGANG GIỮA CÁC CỘT -> SUY NGHĨ TÁCH BẢNG
--TÁCH THẲNG VẾ TRÁI VÀ PHẢI, RA TABLE KHÁC !!!, TÁCH XONG PHẢI FK CHO PHẦN
--CÒN LẠI

--SAU KHI TÁCH CÓ TRONG TAY 3 TABLE
--PROVINCE( PName)

--	DISTRICT (DName, PName(FK lên trên))

--     WARD (WName phường nào, quận nào DName FK lên Quận)

-- GIẢI PHÁP HƠI BỊ DỞ 1 CHÚT CHO CÁI HUYỆN CHÂU THÀNH CHO CÁC TỈNH MIỀN TÂY !!!! TA SẼ LÀM SAU
-- DÙNG NATURAL KEY, KEY TỰ NHIÊN 
-- DÙNG KEY TỰ GÁN, TỰ TĂNG, KEY THAY THẾ, KEY GIẢ (SURROGATE KEY/ARTIFICIAL KEY)

--PHIÊN BẢN ĐẸP NHƯNG VẪN CÒN CHÚT CHÂU THÀNH 
DROP TABLE Province
DROP TABLE District

CREATE TABLE Province
(
	PName nvarchar(30) PRIMARY KEY,
)

INSERT INTO Province SELECT DISTINCT Province FROM Locations
SELECT * FROM Province

CREATE TABLE District
(
	DName nvarchar(30) NOT NULL, --HONG CÓ 2 CHÂU THÀNH CỦA CÁC TỈNH MIỀN TÂY
	--và thuộc về thành phố nào vậy
	PName nvarchar(30) NOT NULL REFERENCES Province(PName),
						--THAM CHIẾU ĐỂ KHÔNG NHẬP TỈNH KHÔNG TỒN TẠI, TỈNH AHIHI
	PRIMARY KEY(DName, PName)
)

INSERT INTO District
SELECT District, Province FROM Locations

SELECT * FROM Locations

SELECT DISTINCT District, Province FROM Locations ORDER BY District
--699 quận trong đó chứa rất nhiều Châu thành của 6 tỉnh miền tây
INSERT INTO District 
	SELECT DISTINCT District, Province 
	FROM Locations ORDER BY District

SELECT * FROM District

--hỏi thử thành phố hồ chí minh có những quận huyện nào ?
SELECT DName FROM District WHERE PName = N'Thành phố Hồ Chí Minh' 
SELECT DName FROM District WHERE PName = N'Tỉnh Long An' 


--THÀNH PHẦN ĐÔNG NHẤT LÀ PHƯỜNG/XÃ, CÓ 10581 DÒNG 
--ỨNG VỚI VÔ SỐ LẶP LẠI CÁC QUẬN, FK. 
--xã có trùng tên k??
CREATE TABLE Ward
(
	WName nvarchar(30), 
	--xã phường ơi, ở quận nào ?
	DName nvarchar(30) --REFERENCES District(PName)
)
SELECT * FROM Locations --10581 xã/phường có trùng nhay không ??
SELECT COUNT(DISTINCT Ward) FROM Locations  --đếm trùng xã đếm 1 lần
										-- 7884, TRÙNG TÊN 30000 TÊN
SELECT Ward FROM Locations ORDER BY ward 

INSERT INTO Ward SELECT Ward, District FROM Locations
SELECT * FROM Ward

--CHO TUI XEM CÁC PHƯỜNG CỦA Q1 TPHCM 
SELECT * FROM Ward WHERE DName = N'Quận 1'