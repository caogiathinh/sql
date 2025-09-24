USE Northwind

---------------------------------------------
-- LÝ THUYẾT
-- DB ENGNINE hỗ trợ một loạt nhóm hàm dùng thao tác trên nhóm dòng/cột, gom data 
-- và tính toán trên đám data gom này - nhóm hàm gom nhóm - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT(), SUM(), MIN(), MAX(), AVG()
-- *  CÚ PHÁP 
-- SELECT CỘT .. , HÀM GOM NHÓM(), .... FROM <TABLE>

-- * CÚ PHÁP MỞ RỘNG
-- SELECT CỘT ... , HÀM GOM NHÓM(),.... FROM <TABLE>.. WHERE .. GROUP BY (GOM THEO CỤM CỘT NÀO).. 
-- SELECT CỘT ... , HÀM GOM NHÓM(),.... FROM <TABLE>.. WHERE .. GROUP BY (GOM THEO CỤM CỘT NÀO).. HAVING .. 

--  * HÀM COUNT() DỂ ĐẾM SỐ LẦN XUẤT HIỆN CỦA MỘT CÁI GÌ ĐÓ ??
--		  COUNT(*) ĐẾM SỐ DÒNG TRONG MỘT TABLE, ĐẾM TẤT CẢ KHÔNG CARE TIÊU CHUẨN NÀO KHÁC
--		  COUNT(*) FROM .. WHERE .. 
--							CHỌN RA NHỮNG DÒNG THÕA TIÊU CHÍ WHERE NÀO ĐÓ TRƯỚC ĐÃ, RỒI MỚI ĐẾM

--		  COUNT(CỘT NÀO ĐÓ): 

---------------------------------------------
-- THỰC HÀNH 
--1. In ra danh sách các nhân viên 
SELECT * FROM Employees

--2. Đếm xem có bao nhiêu nhân viên
SELECT COUNT(*) AS [No Employees] FROM Employees

--3. Có bao nhiêu nhân viên ở London
SELECT COUNT(*) AS [No Employees] FROM Employees WHERE City = 'London'

--4. Có bao nhiêu lượt thành phố xuất hiện - cứ xuất hiện là đếm, không care lặp lại hay không ?
SELECT COUNT(City) FROM Employees --9

--5. Đếm xem có bao nhiu region 
SELECT COUNT(Region) FROM Employees
-- HÀM COUNT(CỘT), NẾU CELL CỦA CỘT CHỨA NULL THÌ KHÔNG ĐẾM

--6. Đếm xem có bao nhiêu khu vực NUll, có boa nhiêu dòng region null
SELECT COUNT(*) FROM Employees WHERE Region IS NULL -- đếm sự xuất hiện dòng chứa region là null 

SELECT COUNT(Region) FROM Employees WHERE Region IS NULL -- 0, null không đếm được, không value. 

--6. Có bao nhiêu thành phố
SELECT * FROM Employees --9 
SELECT DISTINCT City FROM Employees --5
-- coi kết quả này là 1 table, mất quá trời công sức lọc ra 5 tp

-- SUB QUERY MỚI, COI 1 CÂU SELECT LÀ 1 TABLE, BIẾN TABLE NÀY VÀO TRONG MỆNH ĐỀ FROM
SELECT COUNT(*) AS [No City]
FROM (SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*) FROM Employees
SELECT COUNT(CITY) FROM Employees
SELECT COUNT(DISTINCT City) FROM Employees --5. 

--8. Đếm xem mỗi thành phố có bao nhiêu nhân viên
-- KHI CÂU HỎI CÓ TÍNH TOÁN GOM DATA (HÀM AGGREGATE) MÀ LẠI CHỨA TỪ KHÓA MỖI .. 
-- GẶP TỪ "MỖI", CHÍNH LÀ CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ, CHIA CỤM ĐỂ GOM ĐÉM. 
SELECT * FROM Employees

--Seatle 2 | Tacoma 1 | Kirland 1 | Redmon 1 | London 4
-- Sự xuất hiện của nhóm
-- Đếm theo sự xuất hiện của nhóm, count++ trong nhóm, sau đó reset ở nhóm mới. 
SELECT COUNT(City) FROM Employees GROUP BY City --ĐÉM VALUE CỦA CITY, NHƯNG ĐÊM THEO NHÓM
												--CHIA CITY THÀNH NHÓM RỒI ĐẾM TRONG NHÓM

SELECT City ,COUNT(City) AS [No employees] FROM Employees GROUP BY City
