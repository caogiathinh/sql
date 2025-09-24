USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA MỆNH ĐỀ SELECT
-- Trong thực tế có những lúc ta muốn tìm kiếm dữ liệu theo kiểu gần đúng
-- gần đúng trên kiểu chuỗi, ví dụ, liệt kê ai đó có tên là AN, khác câu
-- liệt kê ai đó tên bắt đâu bằng chữ A
-- Tìm đúng, toán tử = 'AN'
-- Tìm gần đúng, tìm có sư xuất hiện, KHÔNG DÙNG =, DÙNG TOÁN TỬ LIKE. 
--					LIKE 'A...'
-- để sử dụng toán tử LIKE, ta cần 2 thứ trợ giúp, dấu % và dấu _
-- % đai diện cho một chuôi bất kì nào đó. 
-- _ đại diệ cho một kí tự bất kì nào đó. 
-- VÍ DỤ: Name LIKE 'A%', bất kì ai có tên xh băng chữ A, phần còn lại không quan tâm. 
--		  Name LIKE 'A_', bất kì có tên là 2 kí tự, trong đó kí tự đầu tiên phải là A

--------------------------------------------------------------

--1. In ra danh sách nhân viên
SELECT * FROM Employees

--2. Nhân viên nào có tên bắt đầu bằng chữ A
SELECT * FROM Employees WHERE FirstName = 'A%' -- 0 vì toán tử so sánh bằng, tìm ai có tên A% không?
SELECT * FROM Employees WHERE FirstName LIKE 'A%' --2

--2.1. Nhân viên nào có tên bắt đầu bằng chữ A, in ra cả fullname được ghép đầy đủ.
SELECT EmployeeID, FirstName + ' ' + LastName AS [FullName] FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [FullName] 
FROM Employees WHERE FirstName LIKE 'A%'

--3. Nhân viên nào tên có chữ A cuối cùng
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [FullName] 
FROM Employees WHERE FirstName LIKE '%a'


SELECT * FROM Employees
--4. Nhân viên nào tên có 4 kí tự
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [FullName] 
FROM Employees WHERE FirstName LIKE '____'

--5. Danh sách các sản phẩm/món đồ đang có - Product
SELECT * FROM Products --77

--6. Những sản phẩm trong tên bắt đầu bằng Ch
SELECT * FROM Products WHERE ProductName LIKE 'Ch%' --6

SELECT * FROM Products WHERE ProductName LIKE '%Ch%' ---trên có chữ ch là được

--7. Những sản phẩm tên có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____' --2 

--8. Những sản phẩm trong tên mà từ cuối cùng có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____' --tên có it nhất 2 từ, từ cuối cubgf 5 kí tự. 
													  --vô tình loại đi 
													  --thằng tên có đúng 5 kí tự

SELECT * FROM Products WHERE ProductName LIKE '_____' OR ProductName LIKE '_____'