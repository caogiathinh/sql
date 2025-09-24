USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP CHUẨN CỦA LỆNH SELECT:
-- SELECT * FROM <TABLE> WHERE ...

-- WHERE CỘT = VALUE NÀO ĐÓ.
-- WHERE CỘT LIKE PATTERN NÀO ĐÓ e.g. '_____' 
-- WHERE CỘT BETWEEN RANGE
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐƯỢC LIỆT KÊ)

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ 1 VALUE/CELL
-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ 1 TẬP GIÁ TRỊ/CELL 
-- TẬP KẾT QUẢ NÀY ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN) 

--*******
-- WHERE CỘT = VALUE NÀO ĐÓ - đã học, e.g YEAR(DOB) = 2003
--			 = THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL 
-- KĨ THUẬT VIẾT CÂU SQL THEO KIỂU HỎI GIÁN TIẾP, LỒNG NHAU, TRONG
-- CÂU SQL CHỨA CÂU SQL KHÁC.


--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách nhân viên
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1 -- 1 cell
SELECT FirstName FROM Employees --1 tập các giá trị/1 cột/ 1 phép chiếu.


-- 2. Liệt kê các nhân viên quê ở London
SELECT * FROM Employees WHERE City = 'London' --4

-- 3. Liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees WHERE FirstName = 'Robert'
SELECT City FROM Employees WHERE FirstName = 'Robert'

SELECT * FROM Employees 
		WHERE City = (
						SELECT City FROM Employees 
									WHERE FirstName = 'Robert'
					)

--câu này 9.9, trong kết quả vẫn còn Robert
SELECT * FROM Employees 
		WHERE City = (
						SELECT City FROM Employees 
									WHERE FirstName = 'Robert'
					) AND FirstName != 'Robert'

-- 4. Liệt kê tất cả các đơn hàng 
SELECT * FROM Orders ORDER BY Freight DESC

-- 4.1. Liệt kê tất cả các đơn hàng có trọng lượng > 252kg 
SELECT * FROM Orders WHERE Freight >= 252

-- 4.2. Liệt kê các đơn hàng có trọng lượng hơn trọng lượng đon hàng 10555
SELECT * FROM Orders 
WHERE Freight >= (
					SELECT Freight FROM Orders 
									WHERE OrderID = 10555
				  )
		AND OrderID != 10555
ORDER BY Freight DESC

 --1. Liệt kê danh sách các công ty vận chuyển hàng
 --2. Liệt kdanh sách các đơn hàng đc vận chuyển bởi công ty giao vận
 --   có mã số 1
 --3. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận
 --   có tên Speedy Express
 --4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận
 --   có tên Speedy Express và trọng lượng từ 50-100
 --5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
 --6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet

  --1.
 SELECT * FROM Shippers 

 --2. 
 SELECT * FROM Orders WHERE ShipVia = 1

 --3. 
SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID
										FROM Shippers
										WHERE CompanyName = 'Speedy Express'
									)
-- linh hoạt trong truy vấn
-- 4.
SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID
										FROM Shippers
										WHERE CompanyName = 'Speedy Express'
									) 
						AND (Freight BETWEEN 50 AND 100) 

SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID
										FROM Shippers
										WHERE CompanyName = 'Speedy Express'
									) 
						AND Freight IN (50, 100)  --SAI, IN LÀ SO SÁNH BẰNG, THAY CHO 1 ĐỐNG OR. 
	
SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID
										FROM Shippers
										WHERE CompanyName = 'Speedy Express'
									) 
						AND (Freight >= 50 AND Freight <= 100)
						
-- 5.
-- Xem thông tin 2 bảng
SELECT * FROM Categories
SELECT * FROM Products
-- Tìm mã phân loại của sản phầm mang tên Filo Mix -> tìm các sản phầm cùng mã phân loại
SELECT * FROM Products WHERE CategoryID = (
												SELECT CategoryID FROM Products 
																  WHERE ProductName = 'Filo Mix'
										)
										AND ProductName != 'Filo Mix'
-- 6. 
SELECT * FROM Employees WHERE FirstName = 'Janet'

SELECT * FROM Employees WHERE BirthDate > ( 
											SELECT BirthDate FROM Employees
															 WHERE FirstName = 'Janet'
											)
