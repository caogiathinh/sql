USE Northwind -- chọn để chơi với thùng chứa nào ? 


SELECT * FROM Customers

SELECT * FROM Employees

-------------------------------------------------------------
-- LÍ THUYẾT
-- 1. DB engine cung cấp câu lệnh SELECT dùng để: 
--    in ra màn hình cái gì đó ~~~ printf() sout()
--	  in ra dữ liệu có trong table (hàng/cột) 
--    dùng cho mục đích nào thì kết quả hiển thị luôn là 1 table 

-------------------------------------------------------------
-- 1. Hôm nay là ngày bao nhiêu ? 
SELECT GETDATE()
SELECT GETDATE() AS [Hôm nay là ngày]

-- 2. Bây giờ là tháng mấy ? 
SELECT MONTH(GETDATE()) AS [Bây giờ là tháng] 

-- 3. Trị tuyệt đối của -5 là mấy?
SELECT ABS(-5) AS [Trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy
SELECT 5 + 5 AS [5 + 5 là mấy ?]

-- 5. In ra tên của mình
SELECT N'Cao Gia Thịnh' AS [My fullname is]
SELECT 'Cao ' + 'Gia ' + N'Thịnh' AS [My fullname is]

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 2004 AS Age

SELECT 'Cao ' + 'Gia ' + N'Thịnh ' + CONVERT(varchar, (YEAR(GETDATE()) - 2004)) + ' year old'

SELECT 'Cao ' + 'Gia ' + N'Thịnh ' + CAST(YEAR(GETDATE()) - 2004 AS VARCHAR) + ' year old' AS [My proflie]

-- 7. Phép nhân
SELECT 10 * 10 AS [10 X 10 = ]

