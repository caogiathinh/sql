-- THIẾT KẾ ĐẦU TIÊN: GOM TẤT TRONG 1 TABLE
-- Đặc điểm chính là cộtm, thông tin đđ là cell 
-- Thông tin chích ngừa bao gồm: tên: An Nguyễn, cccd: 12343535454... ,
CREATE DATABASE DBDESIGN_VACCINATION
USE DBDESIGN_VACCINATION
CREATE TABLE VaccinationV1
(
	ID char(11) PRIMARY KEY, 
	LastName nvarchar(30),
	FirstName nvarchar(10), --sort, FullName là sort theo họ 
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng không phải là PK 
									   --key ứng viên, candidate key. 
	InjectionInfo nvarchar(255)
)
SELECT * FROM VaccinationV1
--cách thiết kế này lưu trữ được các mũi chích của mình không ? được
INSERT INTO VaccinationV1 VALUES('0000000001', N'NGUYỄN', N'AN', '090X', N'AZ Ngày 28.9.2021 ĐH FPT | AZ Ngày 28.9.2021 BV LÊ VĂN THỊNH, Q. TĐ')

--PHÂN TÍCH:
--ƯU   : DỄ LƯU TRỮ, SELECT, CÓ NGAY, đa trị tốt trong vụ này !!!
--NHƯỢC: THỐNG KÊ ÉO ĐƯỢC, ÍT NHẤT ĐI CẮT CHUỖI, CĂNG !!! BỊ CĂNG DO ĐA TRỊ.

--SOLUTION: CẦN QUAN TÂM THỐNG KÊ TÍNH TOÁN SỐ LIỆU (?MŨI, AZ CHO BAO NGƯỜI ... )
--TÁCH CỘT, TÁCH BẢNG. 
CREATE TABLE VaccinationV2
(
	ID char(11) PRIMARY KEY, 
	LastName nvarchar(30),
	FirstName nvarchar(10), --sort, FullName là sort theo họ 
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng không phải là PK 
									   --key ứng viên, candidate key. 
	Dose1 nvarchar(100), --AZ, Astra, .. 25.9.2021, DH FPT -- COMPOSITE (phức hợp)
	Dose2 nvarchar(100), --AZ, Astra, ......
)
--PHÂN TÍCH:
--*ƯU: gọn gàng, select gọn gàng. 
--*NHƯỢC: NULL!!, THÊM MŨI NHẮC 3, 4 HÀNG NĂM THÌ SAO ?? 
--		  CHỈ VÌ VÀI NGƯỜI MÀ TA PHẢI CHỪA CHỖ NULL
--		  THỐNG KÊ!!! COMPOSITE CHƯA CHO MÌNH DC THỐNG KÊ


-- MULTI-VLAUED: MỘT CELL CHỨA NHIỀU INFO ĐỘC LẬP BÌNH ĐẲNG VỀ NGỮ NGHĨA
--				 Ví dụ: Address: 1/1 LL, Q.1, TPHCM ; 1/1 Man Thiện, P.5, TP.TĐ
--							thường trú					 tạm trú
--					NHIỀU ĐỒ TRONG 1 CELL 
--					ĐỌC: có 2 địa chỉ 

-- COMPOSITE VALUE CELL: Một value duy nhất, mỗi value này gom nhiều miếng nhỏ hơn
--						 nhiều miếng nhỏ hơn, mỗi miếng có vai trò riêng
--						 gom chung lại thành 1 thứ khác
--						 Address: 1/1 Man Thiện, p.5, TPHCM 
--						 FullName: Cao   Gia Thịnh -> cả; tên gọi đầy đủ
--								   first last midd 

-- VÌ SỐ LẦN CHÍCH ĐỀU CÓ THỂ GIA TĂNG CHO TỪNG NGƯỜI, MŨI 2, MŨI NHẮC, MŨI THƯỜNG NIÊN
-- AI CHÍCH NHIỀU THÌ NHIỀU DÒNG, HAY HƠN HẲN .
CREATE TABLE PersonV3
(
	ID char(11) PRIMARY KEY, 
	LastName nvarchar(30),
	FirstName nvarchar(10), --sort, FullName là sort theo họ 
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng không phải là PK 
									   --key ứng viên, candidate key. 
)

--COMPOSITE GỘP N INFO VÀO TRONG 1 CELL, DỄ NHANH LÀ ƯU ĐIỂM, NHẬP 1 CHUỖI DÀI LÀ XONG
--				NHƯỢC ĐIỂM: ÉO THỐNG KÊ TỐT, ÉO SORT ĐƯỢC.
--				FullName sort làm sao
-- COMPOSITE SẼ TÁCH CỘT, VÌ MÌNH SẼ CỐ TRƯỚC ĐÓ GOM N THỨ KHÁC NHAU ĐỂ LÀM RA 1 THỨ KHÁC 
--				TÁCH CỘT SẼ TRẢ LẠI ĐÚNG NGỮ NGHĨA CHO TỪNG THẰNG
CREATE TABLE VaccinationV3
(
	Dose nvarchar(100), 
	PersonID char(11) REFERENCES PersonV3(ID)
)
--PHÂN TÍCH: 
--ƯU: CHÍCH THÊM NHÁT NÀO, THÊM DÒNG NHÁT ĐÓ, CHẤP 10 MŨI ĐỦ CHỖ LUÔN, KHÔNG ẢNH HƯỞNG ĐẾN NGƯỜI CHƯA CHÍCH
--NHƯỢC: THỐNG KÊ ÉO DC
-- COMPOSITE TÁCH TIẾP THÀNH CỘT CỘT CỘT, TRẢ LẠI Ý NGHĨA CHO CHO TỪNG MŨI 
-- MIẾNG INFO NHỎ 
CREATE TABLE PersonV4
(
	ID char(11) PRIMARY KEY, 
	LastName nvarchar(30),
	FirstName nvarchar(10), --sort, FullName là sort theo họ 
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng không phải là PK 
									   --key ứng viên, candidate key. 
)
CREATE TABLE VaccinationV4
(
	--Dose nvarchar(100), 
	--tách cột
	Dose int, --liều chích số 1
	InjDate datetime, --giờ chích
	Vaccine nvarchar(50), --tên vaccine
	Lot nvarchar(20),
	[Location] nvarchar(50),
	PersonID char(11) REFERENCES PersonV4(ID)
)
INSERT INTO PersonV4 VALUES('00000000001', N'NGUYỄN', N'AN', '090x')
INSERT INTO PersonV4 VALUES('00000000002', N'BÌNH', N'LÊ', '091x')

INSERT INTO VaccinationV4 VALUES(1, GETDATE(), N'AZ', NULL, NULL, '00000000001')
SELECT * FROM PersonV4
SELECT * FROM VaccinationV4

-- IN RA XANH VÀNG CHO MỖI NGƯỜI
SELECT p.ID, p.FirstName, IIF(COUNT(v.Dose) = 0, 'NOOP', 
							IIF(COUNT(v.Dose) = 1, 'YELLOW', 'GREEN'))
							AS STATUS
FROM PersonV4 p LEFT JOIN VaccinationV4 v
				ON p.ID = v.PersonID
				GROUP BY p.ID, p.FirstName --TOANG COUNT(*) 
										   --BÌNH CÓ 1 DÒNG KHA KHÁ NULL  
 
 INSERT INTO VaccinationV4 VALUES(2, GETDATE(), N'AZ', NULL, NULL, '00000000001')
 ---nhưng còn cần lookup table

-----------------------------------------------------------------------
-----------------------------------------------------------------------
--* PHÂN TÍCH 
-- CỘT TÊN LÀ VACCINE cho phép gõ các giá trị tên VC một cách tự do -> inconsistency 
-- AZ, Astra, AstraZeneca, Astra Zeneca
-- >>>>>> có mùi của drop down, combo box >>> Lookup Table
-- ko cho gõ mà cho chọn từ danh sách có sẵn 
-- tham chiếu từ danh sách có sẵn
-- Vaccine phải tách thành table CHA, TABLE 1, ĐÁM N 
-- PHẢI REFRENCES VỀ 
CREATE TABLE PersonV5
(
	ID char(11) PRIMARY KEY, 
	LastName nvarchar(30),
	FirstName nvarchar(10), --sort, FullName là sort theo họ 
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng không phải là PK 
									   --key ứng viên, candidate key. 
)

INSERT INTO PersonV5 VALUES('00000000001', N'NGUYỄN', N'AN', '090x')
INSERT INTO PersonV5 VALUES('00000000002', N'BÌNH', N'LÊ', '091x')

CREATE TABLE VaccineV5
(
	VaccineName varchar(30) PRIMARY KEY,
	--hãng sản xuất, địa chỉ hãng, thông tin lâm sàng... 
)

INSERT INTO VaccineV5 VALUES('AstraZeneca')
INSERT INTO VaccineV5 VALUES('Pfizer')
INSERT INTO VaccineV5 VALUES('Verocell')
INSERT INTO VaccineV5 VALUES('Moderna')

--PRIMARY KEY MÀ LÀ varchar() LÀM GIẢM HIỆU NĂNG THỰC THI QUERY
--CHẠY CHẬM. THƯỜNG NGƯỜI TA SẼ CHỌN PK LÀ CON SỐ LÀ TỐT NHẤT, TỐT NHÌ THÌ CHAR
--SẼ GIẢNG 1 BUỔI RIÊNG VỀ PRIMARY KEY (PK, FK, CK, SPK, NK, SRK-AK)

CREATE TABLE VaccinationV5
(
	--Dose nvarchar(100), 
	--tách cột
	SEQ int IDENTITY PRIMARY KEY, -- CỨ TĂNG MÃI MÃI ĐI, 2 TỶ MẤY LẦN CHÍCH 
	Dose int, --liều chích số 1,2 có thể lặp lại cho mỗi người, ko thể là key
	InjDate datetime, --giờ chích
	Vaccine varchar(30) REFERENCES VaccineV5(VaccineName),
	Lot nvarchar(20),
	[Location] nvarchar(50), --nơi chích bản chất là COMPOSITE, TÁCH THÀNH CỘT CITY, QUẬN/HUYỆN
							 --lại là lookdup để không gõ lung tung thống kế từng đơn vị
	PersonID char(11) REFERENCES PersonV5(ID),
	--FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName),
	--CONSTRAINT FK_VCN_VC FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName)
)

INSERT INTO VaccinationV5 VALUES(1, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000001') -- ok 
INSERT INTO VaccinationV5 VALUES(2, '2021-12-20', 'AstraZeneca', NULL, NULL, '00000000001') -- ok
INSERT INTO VaccinationV5 VALUES(3, '2021-12-20', 'AZ', NULL, NULL, '00000000001') --THẤT BẠI nhưng SEQ vẫn tự tăng thành 3. 
INSERT INTO VaccinationV5 VALUES(1, '2021-12-20', 'Verocell', NULL, NULL, '00000000002')

SELECT * FROM PersonV5 
SELECT * FROM VaccineV5
SELECT * FROM VaccinationV5

-- THỐNG KÊ ĐƯỢC NHỮNG GÌ ?
-- 1. Có bao nhiêu mũi vaccine AZ đã đc chích (chích bao nhiu nhát)
-- OUTPUT: loại vaccine, tổng số mũi đã chích 

-- 2. Ngày x có bao nhiêu mũi đã được chích

-- 3. Thống kê số mũi chích của mỗi cá nhân 
-- OUPUT: CCCD, Tên (Full), di động, số mũi đã chích (0, 1, 2, 3)

-- 4. In ra thông tin chích của mỗi cá nhân
-- OUPUT: CCCD, Tên (Full), di động, số mũi đã chích (0, 1, 2, 3), MÀU SẮC

-- 5. Có bao nhiêu công dân đã chích ít nhất 1 mũi vaccine

-- 6. Những công dân nào chưa chích vaccine mũi nào cả
-- Output: CCCD, Tên

-- 7. Công dân có CCCD X đã chích những mũi nào
-- Output: CCCD, Tên, Thông tin chích (in gộp + chuỗi, tái nhập composite)

-- 8. Thống kế số mũi vaccine đã chích của mỗi loại vaccine 

-- CHỐT HẠ: TÁCH ĐA TRỊ HAY COMPOSITE DỰA TRÊN NHU CẦU THỐNG KÊ,
--			NẾU CÓ CỦA DỮ LIỆU TA LƯU TRỮ!!!
--			GOM BẢNG -> TÌM ĐA TRỊ, TÌM COMPOSITE, TÌM LOOKUP TÁCH THEO YÊU CẦU
 SELECT v.VaccineName, COUNT(*) FROM VaccineV5 v LEFT JOIN VaccinationV5 vc
					ON v.VaccineName = vc.Vaccine
					GROUP BY v.VaccineName 
					-- gần đúng thoi, coutnt(*) toang cho thằng 
					-- chơi hệ LEFT do có 1 dòng Pfizer chủ yếu null 
					-- do chưa ai chích, NHỚ COUNT(*) KHÁC COUNT(NULL) 
 SELECT v.VaccineName, COUNT(vc.Vaccine) FROM VaccineV5 v LEFT JOIN VaccinationV5 vc
					ON v.VaccineName = vc.Vaccine
					--WHERE DATE CHÍCH LÀ THỐNG KÊ THEO NGÀY 
					--QUẬN HUYỆN NỮA LÀ THEO TỈNH, HUYỆN
					GROUP BY v.VaccineName 
