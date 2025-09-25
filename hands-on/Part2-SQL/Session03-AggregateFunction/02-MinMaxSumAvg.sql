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



