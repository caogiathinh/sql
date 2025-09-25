USE Northwind

---------------------------------------------
-- LÝ THUYẾT
-- DB ENGNINE hỗ trợ một loạt nhóm hàm dùng thao tác trên nhóm dòng/cột, gom data 
-- và tính toán trên đám data gom này - nhóm hàm gom nhóm - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT(), SUM(), MIN(), MAX(), AVG()

-- *  CÚ PHÁP CHUẨN
-- SELECT CỘT .. , HÀM GOM NHÓM(), .... FROM <TABLE>
-- SELECT CỘT .. , HÀM GOM NHÓM(), .... FROM <TABLE> WHERE ... GROUP BY ... HAVING

---------------------------------------------
-- THỰC HÀNH
-- 1. Liệt kê danh sách nhân viên
SELECT * FROM Employees

-- 2. Năm sinh nào là bé nhất
SELECT MIN(BirthDate) FROM Employees
SELECT MAX(BirthDate) FROM Employees

-- 3. Ai sinh năm bé nhất, ai lớn tuổi nhất, in ra info
SELECT * FROM Employees 
WHERE BirthDate = 
				(
					SELECT MIN(BirthDate) FROM Employees
				)

SELECT * FROM Employees 
WHERE BirthDate <= ALL 
				(
					SELECT MIN(BirthDate) FROM Employees
				)

SELECT * FROM Employees 
WHERE BirthDate <= ALL 
				(
					SELECT BirthDate FROM Employees
				)

--4.1. Trọng lượng nào là lớn nhất trong các đơn hàng đã bán. 
SELECT * FROM Orders ORDER BY Freight DESC
SELECT MAX(Freight) AS [Max Freight] FROM Orders
--4.2 Trong các đơn hàng đơn hàng nào có trọng lượng nặng nhất/nhỏ nhất
SELECT * FROM Orders 
WHERE Freight = (SELECT MAX(Freight) AS [Max Freight] FROM Orders)

SELECT * FROM Orders 
WHERE Freight >= ALL(SELECT Freight FROM Orders) -- >= ALL(TẤT CẢ CÁC TRỌNG LƯỢNG)

--5. Tính tổng khối lượng của các đơn hàng đã vận chuyển. 
SELECT * FROM Orders

SELECT SUM(Freight) AS [Freight in total] FROM Orders

--6. Trung bình các đơn hàng nặng bao nhiêu??
SELECT AVG(Freight) AS [Freight in AVG] FROM Orders --78.2442

--7. Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
SELECT * FROM Orders 
WHERE Freight >= (
					SELECT AVG(Freight) AS [Freight in AVG] FROM Orders
				 )

--8. Có bao nhiêu đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
SELECT COUNT(*) FROM (
						SELECT * FROM Orders 
						WHERE Freight >= (
											SELECT AVG(Freight) AS [Freight in AVG] 
											FROM Orders
										 ) 
					  ) AS [AVG]

SELECT COUNT(*) FROM Orders 
WHERE Freight >= (
					 SELECT AVG(Freight) FROM Orders
				  )
--chỉ những thằng lớn hơn trung bình thì mới đếm

-- CỘT XUẤT HIỆN TRONG SELECT HÀM Ý ĐẾM THEO CỘT NÀY 
-- TỈNH <ĐẾM CÁI GÌ ĐÓ CỦA TỈNH> -> CHIA THEO TỈNH MÀ ĐẾM
--									GROUP BY TỈNH
-- CHUYÊN NGÀNH, <ĐẾM CỦA CHUYÊN NGÀNH> -> CHIA THEO CHUYÊN NGÀNH MÀ ĐẾM 
--										  GROUP BY CHUYÊN NGÀNH
-- CÓ QUYỀN GROUP BY TRÊN NHIỀU CỘT 

-- MÃ CHUYÊN NGÀNH, TÊN CHUYÊN NGÀNH <SL,SV> -> GROUP BY MÃ CN, TÊN CN

-- ÔN TẬP THÊM
-- 1. In ra thông tin nhân viên
SELECT * FROM Employees

--2. Đếm xem mỗi khu vực có bao nhiêu nhân viên 
SELECT COUNT(*) FROM Employees ORDER BY Region
SELECT COUNT(*) FROM Employees GROUP BY Region -- 4 (null) 5 (WA)
										-- 2 NHÓM REGION, 2 CỤM REGION: WA, NULL
SELECT COUNT(Region) FROM Employees GROUP BY Region -- 2 cụm NULL VÀ WA
-- 0 5, do NULL KHÔNG ĐƯỢC XEM LÀ VALUE ĐỂ ĐẾM , NHƯNG VẪN LÀ 1 VALUE ĐỂ DC CHIA NHÓM
--												 NHÓM KHÔNG GIÁ TRỊ

SELECT Region, COUNT(Region) FROM Employees GROUP BY Region --sai do đếm null
SELECT Region, COUNT(*) FROM Employees GROUP BY Region --đúng do đếm dòng

--3. Khảo sát đơn hàng
SELECT * FROM Orders
-- Mỗi quốc gia có bao nhiu đơn hàng
SELECT ShipCountry, COUNT(*) AS [Total Orders] FROM Orders GROUP BY ShipCountry

--4. Quốc gia nào có từ 100 đơn hàng ? 
SELECT ShipCountry, COUNT(*) AS [Total Orders] FROM Orders GROUP BY ShipCountry 
HAVING COUNT(*) >= 100

--5. Quốc gia nào có nhiều đơn hàng nhất ? 
SELECT MAX([Total Orders])
FROM 
(
	SELECT ShipCountry, COUNT(*) AS [Total Orders] FROM Orders GROUP BY ShipCountry 
) AS [Cntry]
-- lấy được max rồi 
SELECT ShipCountry, COUNT(*) AS [Total Orders] FROM Orders GROUP BY ShipCountry 
HAVING COUNT(*) >= (
						SELECT MAX([Total Orders])
						FROM 
						(
							SELECT ShipCountry, COUNT(*) AS [Total Orders] FROM Orders GROUP BY ShipCountry 
						) AS [Cntry]
					)

--6. Liệt kê các đơn hàng của kh mã số VINET
SELECT * FROM Orders WHERE CustomerID = 'VINET'

--7. VINET đã mua bao nhiêu lần ?? 
SELECT CustomerID, COUNT(*) AS [Totals orders] FROM Orders
											   GROUP BY CustomerID
											   HAVING CustomerID = 'VINET'

SELECT CustomerID, COUNT(*) AS [Totals orders] FROM Orders 
											   WHERE CustomerID = 'VINET'
											   GROUP BY CustomerID
					

