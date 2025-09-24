USE Northwind

-------------------------------------------------------------
--LÍ THUYẾT 
-- MỘT DB là nơi chứa data (bán hàng, thư viện, qlsv,... )
-- DATA dc lưu dưới dạng table, tách thành nhiều table (nghệ thuật design database)
-- Dùng lệnh SELECT để xem/in dữ liệu từ table, cũng hiển thị dữ liệu dưới dạng table. 
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc tôi muốn lấy all of columns
-- CÚ PHÁP MỞ RỘNG 
--				SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH-NHAU-DẤU-PHẨY FROM <TÊN-TABLE> 
--				SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--				FROM <TÊN-TABLE>



-- Data trả về có cell/ô có NULL, hiểu rằng chưa có xác định value/giá trị, chưa có chưa biết từ từ cập nhật sau
-- từ từ cập nhật sau. 

-------------------------------------------------------------
-- 1. Xem thông tin của tất cả các khách hàng đang giao dịch với mình
SELECT * FROM Customers 
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
				VALUES ('ALFKI', 'FPT University', 'Thanh Nguyen Khac')
				-- bị chửi vì trùng PK 
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
				VALUES ('FPTU', 'FPT University', 'Thanh Nguyen Khac')
				-- ngon lành cành đào 
-- 2. Xem thông tin nhân viên
SELECT * FROM Employees

-- 3. Xem các sản phẩm bán đang có trong kho
SELECT * FROM Products

-- 4. Mua hàng thông tin nằm ở Order và OrderDetail
SELECT * FROM Orders --830

-- 5. Xem thông tin công ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers VALUES ('Fedex VietNam', '(084)90....')

-- 6. Xem chi tiết mua hàng 
SELECT * FROM Orders			-- PHẦN TRÊN CẢU BILL SIÊU THỊ
SELECT * FROM [Order Details]   -- PHẦN TABLE KẺ GIÓNG LỀ NHỮNG MÓN HÀNG ĐÃ MUA

-- 7. In ra thông tin khách hàng chỉ gồm các cột Id, ComName, ContactName, Country. 
SELECT CustomerID, CompanyName, Country FROM Customers

-- 8. In ra thông tin nhân viên, chỉ cần Id, Name, First, Last, Title, DOB

-- Tên người phải tách thành Last và First: dành cho mục tiêu sort theo tiêu chí tên, họ. 
--In ra tên theo quy ước mỗi quốc gia.
SELECT * FROM Employees
SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

-- 9. In ra thông tin nhân viên, ghép tên cho đẹp/gộp cột, tính luôn tuổi 
SELECT EmployeeID, LastName + ' ' + FirstName AS [FullName], Title, BirthDate FROM Employees

SELECT EmployeeID, 
		LastName + ' ' + FirstName AS [FullName], 
		Title, 
		YEAR(BirthDate) AS [Yob]
FROM Employees

SELECT EmployeeID, 
		LastName + ' ' + FirstName AS [FullName], 
		Title, 
		YEAR(BirthDate) AS [Yob],
		YEAR(GETDATE()) - YEAR(BirthDate) AS Age 
FROM Employees

-- 10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity FROM [Order Details]

--CÔNG THỨC TÍNH TỔNG TIỀN PHẢI TRẢ TỪNG MÓN, CÓ TRỪ ĐI GIẢM GIÁ, PHẦN TRĂM
--SL * DG - SL * DG * DISCOUNT (%) ->PHẢI TRẢ
--SL * DG * (1 - DISCOUNT %)
SELECT *, UnitPrice * Quantity * (1- Discount) AS [SubTotal] FROM [Order Details]
-- tính toán chỉ trên tạm thời dữ liệu gốc không bị thay đổi



