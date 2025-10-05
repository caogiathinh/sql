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


