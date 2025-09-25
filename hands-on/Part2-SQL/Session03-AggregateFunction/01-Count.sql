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

SELECT EmployeeID ,City ,COUNT(City) AS [No employees] FROM Employees GROUP BY City, EmployeeID
-- vô nghĩa, chia nhóm theo key, mssv vô nghĩa. 
--CHỐT HẠ: KHI XÀI HÀM GOM NHÓM, CÓ QUYỀN LIỆT KÊ TÊN CỘT LẺ Ở SELECT NHƯNG 
--		   NHƯNG CỘT LẺ ĐÓ BẮT BUỘC PHẢI XUẤT HIỆN TRONG MỆNH ĐỀ GROUP BY
--		   ĐỂ ĐẢM BẢO LOGIC: CỘT HIỂN THỊ | SỐ LƯỢNG ĐI KÈM, ĐẾM GOM THEO CỘT HIỂN THỊ MỚI LOGIC 
--CỨ THEO CỘT CITY MÀ GOM, CỘT CITY NẰM Ở SELECT HỢP LÝ
-- MUỐN HIỂN THỊ SỐ LƯỢNG CỦA AI ĐÓ, CÁI GÌ ĐÓ, GOM NHÓM THEO CÁI GÌ ĐÓ. 

-- NẾU GOM THEO KEY, PK VÔ NGHĨA. KEY KHÔNG TRÙNG MỖI THẰNG 1 NHÓM ĐẾM CÁI GÌ ?
-- MÃ SỐ SINH VIÊN: ---ĐẾM CÁI GÌ, VÔ NGHĨA. 
-- MÃ CHUYÊN NGÀNH: -- ĐẾM SỐ SV CHUYÊN NGÀNH!!
-- MÃ QUỐC GIA -- ĐẾM SỐ ĐƠN HÀNG 
-- ĐIỂM THI -- ĐẾM SỐ LƯỢNG SV ĐẠT ĐIỂM ĐÓ
-- CÓ CỘT ĐỂ GOM NHÓM, CỘT ĐÓ DÙNG ĐỂ HIỂN THỊ SỐ LƯỢNG KẾT QUẢ.


-- IN RA MÃ NV 
--1 London 1
--2 Seatle 1
--3 London 1
--4        1
--5        1
SELECT City ,COUNT(City) AS [No employees] FROM Employees GROUP BY City

-- 9. Hãy cho tôi biết thành phố nào có 2 nhân viên trở lên
-- 2 chặng làm 
-- 9.1. Các tp có bao nhiu nhân viên
-- 9.2. Đếm xong mỗi thành phố, ta lọc lại kết quả sau đếm
-- FILTER SAU ĐẾM, WHERE SAU ĐẾM, WHERE SAU KHI ĐÃ GOM NHÓM, AGGREGATE THÌ GỌI LÀ HAVING
SELECT City ,COUNT(*) AS [No employees] FROM Employees GROUP BY City
SELECT City ,COUNT(City) AS [No employees] FROM Employees GROUP BY City

SELECT City ,COUNT(City) AS [No employees] FROM Employees GROUP BY City HAVING COUNT(*) >= 2

--10. Đếm số nhân viên của 2 thành phố Seattle và London
SELECT COUNT(City) AS [No employees] FROM Employees WHERE City IN('Seattle', 'London') GROUP BY City
SELECT City ,COUNT(City) AS [No employees] FROM Employees WHERE City IN('Seattle', 'London') GROUP BY City

--11. Trong 2 thành phố, thành phố nào nhiều hơn 3 nv
SELECT City ,COUNT(City) AS [No employees] 
FROM Employees 
WHERE City IN('Seattle', 'London')
GROUP BY City
HAVING COUNT(*) >= 3

-- 12. Đếm xem có bao nhiêu đơn hàng đã bán
SELECT COUNT(*) AS [No Orders] FROM Orders
SELECT COUNT(OrderID) AS [No Orders] FROM Orders
-- 830 đơn hàng khác nhau, đếm mã đơn, hay đến cả cái đơn là như nhau. 
-- cột có value NULL ăn hành

--12.1. Nước Mĩ có bao nhiêu đơn hàng
-- đi tìm Mĩ mà đếm, Lọc Mĩ rồi đếm
-- KHÔNG PHẢI LÀ GOM CHIA NHÓM, KHÔNG CÓ MỖI QUỐC GIA BAO NHIÊU ĐƠN, 
-- MỖI QUỐC GIA CÓ BAO NHIÊU ĐƠN, COUNT THEO QUỐC GIA, GROUP BY THEO QUỐC GIA
SELECT COUNT(*) AS [No USA Orders] FROM Orders WHERE ShipCountry = 'USA'

--12.2. Mĩ Anh Pháp chiếm tổng cộng bao nhiêu đơn hàng
SELECT COUNT(*) [No USA, UK, France Orders] FROM Orders 
WHERE ShipCountry IN('USA', 'France', 'UK')

SELECT COUNT(*) FROM Orders WHERE ShipCountry = 'USA' 
								OR ShipCountry = 'UK'
								OR ShipCountry = 'France'

--12.3 Mĩ Anh Pháp, mỗi quốc gia có bao nhiêu đơn hàng
SELECT ShipCountry, COUNT(*) AS [No Orders] FROM Orders
WHERE ShipCountry IN('USA', 'France', 'UK')
GROUP BY ShipCountry

--12.4 Trong 3 quốc gia A, P, M quốc gia nào có từ 100 đơn hàng trở lên
SELECT ShipCountry, COUNT(*) AS [No Orders] FROM Orders
WHERE ShipCountry IN('USA', 'France', 'UK')
GROUP BY ShipCountry
HAVING COUNT(*) >= 100

--13. Đếm xem có bao nhiêu mặt hàng có trong kho
SELECT COUNT(*) FROM Products
--14. Đếm xem có bao nhiêu lượt quốc gia đã mua hàng 
SELECT COUNT(*) AS [No Orders] FROM Orders
--15. Đếm xem có bao nhiêu quốc gia đã mua hàng (mỗi quốc gia đếm một lần)
SELECT COUNT(DISTINCT ShipCity) AS [No Cities] FROM Orders
--16. Đếm số lượng đơn hàng của mỗi quốc gia
SELECT ShipCountry, COUNT(*) AS [No orders] FROM Orders GROUP BY ShipCountry
--17. Quốc gia nào có từ 10 đơn hàng trở lên
SELECT ShipCountry, COUNT(*) AS [No orders] FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(*) >= 10
--18. Đếm xem mỗi chủng loại hàng có bao nhiêu mặt hàng (bia rượu có 5 sp, thủy sản 10 sp)
SELECT CategoryID, COUNT(*) [No Products] FROM Products 
GROUP BY CategoryID

--19. Trong 3 quốc gia A P M, quốc gia nào có nhiều đơn hàng nhất
-- cách 1
SELECT ShipCountry, COUNT(*) FROM Orders 
WHERE ShipCountry IN ('UK', 'USA', 'France')
GROUP BY ShipCountry
HAVING COUNT(*) >= ALL(
						SELECT COUNT(*) FROM Orders 
						WHERE ShipCountry IN ('UK', 'USA', 'France') 
						GROUP BY ShipCountry
					   ) --USA

-- cách 2
SELECT ShipCountry, COUNT(*) AS OrderCount
FROM Orders
WHERE ShipCountry IN ('UK', 'USA', 'France')
GROUP BY ShipCountry
HAVING COUNT(*) = (
					SELECT MAX([Total Orders])
					FROM
					  (
						SELECT COUNT(*) AS [Total Orders]
						FROM Orders
						WHERE ShipCountry IN('UK', 'USA', 'France')
						GROUP BY ShipCountry 
					  ) AS [Totals]
				  )

--20. Quốc gia nào có nhiều đơn hàng nhất ? 
-- Cách 1
SELECT ShipCountry, COUNT(*) AS [Total Orders]
FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(*) = (
					SELECT MAX([Total Orders])
					FROM
					  (
						SELECT COUNT(*) AS [Total Orders]
						FROM Orders
						GROUP BY ShipCountry 
					  ) AS [Total]
				  )

-- cách 2
SELECT ShipCountry, COUNT(*) AS [Total Orders]
FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(*) >= ALL (
					SELECT [Total Orders]
					FROM
					  (
						SELECT COUNT(*) AS [Total Orders]
						FROM Orders
						GROUP BY ShipCountry 
					  ) AS [Total]
				  )
--21. Thành phố nào có nhiều nhân viên nhất???
--cách 1
SELECT City, COUNT(*) AS [No Employees] FROM Employees 
GROUP BY City 
HAVING COUNT(*) >= ALL(
						SELECT COUNT(*) AS [No Employees] 
						FROM Employees 
						GROUP BY City
					  )

--cách 2:
SELECT City, COUNT(*) AS [No Employees] FROM Employees 
GROUP BY City 
HAVING COUNT(*) = (
					SELECT MAX([No Employees])
					FROM (
						SELECT COUNT(*) AS [No Employees] 
						FROM Employees 
						GROUP BY City
						) AS [EmplyeeeV2]
					)
