USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP CHUẨN CỦA LỆNH SELECT:
-- SELECT * FROM <TABLE> WHERE ...

-- WHERE CỘT = VALUE NÀO ĐÓ.
-- WHERE CỘT IN (MỘT TẬP HỢP NÀO ĐÓ)
-- ví dụ: CITY IN ('London', 'Berlin', 'NewYork') -- thay bằng OR OR OR ... 

-- NẾU CÓ 1 CÂU SQL MÀ TRẢ VỀ ĐƯỢC 1 CỘT, NHIỀU DÒNG, THÌ TA CÓ THỂ XEM 
-- NÓ TƯƠNG ĐƯƠNG 1 TẬP HỢP. 
-- SELECT CITY FROM EMPLOYEES, ĐƯỢC 1 LOẠT CÁC THÀNH PHỐ.
-- TA CÓ THỂ NHÉT/LỒNG 1 CỘT/NHIỀU DÒNG VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI
-- *CÚ PHÁP
-- WHERE CỘT IN (MỘT CÂU SELECT TRẢ VỀ 1 CỘT NHIỀU DÒNG - NHIỀU VALUE CÙNG KIỂU - TẬP HỢP)
--------------------------------------------------------------
-- THỰC HÀNH 
-- 1. Liệt kê các nhóm hàng
SELECT * FROM Categories

-- 2. In ra các món hàng/mặt hàng thuộc nhóm 1, 6, 8
SELECT * FROM Products WHERE CategoryID IN (1, 6, 8) --30

SELECT * FROM Products WHERE CategoryID = 1 OR CategoryID = 6 OR CategoryID = 8 --30

SELECT * FROM Products WHERE CategoryID BETWEEN 1 AND 8 --TOANG, ĐÂY LÀ LẤY HẾT TỪ 1 ĐẾN 8 

-- 3. In ra các món hàng thuộc nhóm bia/rượu, thịt và hải sản. 
SELECT * FROM Products 
WHERE CategoryID IN 
				(
					SELECT CategoryID 
					FROM Categories 
					WHERE CategoryName 
						IN('Beverages', 'Meat/Poultry', 'Seafood')
				)

-- 4. Nhân viên quê London phụ trách những đơn hàng nào ?
SELECT * FROM Employees
SELECT * FROM Orders 
WHERE EmployeeID IN 
				(
					SELECT EmployeeID 
					FROM Employees 
					WHERE City = 'London'
				) --224

--
-- 1. Các nhà cung cấp đến từ Mĩ cung cấp những mặt hàng nào? 
SELECT * FROM Suppliers
SELECT * FROM Products
SELECT * FROM Products 
WHERE SupplierID 
	IN (SELECT SupplierID FROM Suppliers 
						  WHERE Country = 'USA')

-- 2. Các nhà cung cấp đến từ Mĩ cung cấp những nhóm hàng nào? 
SELECT * FROM Products
SELECT * FROM Suppliers
SELECT * FROM Categories 
		 WHERE CategoryID IN 
			(
				SELECT DISTINCT CategoryID
				FROM Products 
				WHERE SupplierID IN 
					(
						SELECT SupplierID
						FROM Suppliers 
		     			WHERE Country = 'USA'
					)
			)

-- 3. Các đơn hàng vận chuyển tới thành phố Sao Paulo được vận chuyển bởi những hãng vận chuyển nào ?
-- các công ty nào đã vận chuyển hàng tới Sao Paulo
SELECT * FROM Shippers
SELECT * FROM Orders
SELECT * FROM Shippers 
WHERE ShipperID IN 
	(
		SELECT ShipVia 
		FROM Orders 
		WHERE ShipCity = 'Sao Paulo'
	)

-- 4. Khách hàng đến từ thành phố Berlin, london, Marid có những đơn hàng nào ?
-- Liệt kê các đơn hàng của khách hàng đến từ Berlin, London, Marid
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * 
FROM Orders
WHERE CustomerID IN
	(
		SELECT CustomerID 
		FROM Customers
		WHERE City IN('Berlin', 'London', 'Marid')
	)

