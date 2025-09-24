USE Northwind
-------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA MỆNH ĐỀ SELECT
-- MỆNH ĐỀ WHERE DÙNG LÀM BỘ LỌC/FILTER/NHẶT RA NHỮNG DỮ LIỆU TA CẦN THEO MỘT TIÊU CHÍ NÀO ĐÓ. 
-- VÍ DỤ: lọc ra những sv quên ở Bình Dương.
--		  lọc ra những sv quê ở Tiền Giang và điểm tb >= 8 
-- CÚ PHÁP DÙNG BỘ LỌC: 
-- SELECT * FROM (cột bạn muốn in ra) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
-- * ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI-CỘT CÓ GIÁ TRỊ CẦN LỌC
--					LỌC THEO TÊN CỘT VỚI VALUE THẾ NÀO, LẤY TÊN CỘT, XEM VALUE TRONG CELL 
--					CÓ THỎA MÃN ĐIỀU KIỆN LỌC HAY KHÔNG ? 
-- DỂ VIẾT ĐƯỢC ĐIỀU KIỆN LỌC TA CẦN: 
-- >	tên cột
--		value của cột (cell)
--		toán tử (operator) >=, <=, >, <, =, != hoặc <> 
--		nếu có nhiều điều kiện lọc đi kèm, dùng thêm logic operators: AND, OR, NOT. 
-- VÍ DỤ: WHERE City = N'Bình Dương'
--		  WHERE City = N'Tiền Giang' AND Gpa >= 8

-- LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM ĐẾN DATA TYPE
-- Số: nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14, 9.8
-- Chuỗi kí tự: 'A', 'Ahihi'
-- Ngày tháng: '2003-01-01....'
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách các khách hàng:
SELECT * FROM Customers

-- 2. In ra danh sách khách hàng đến từ Ý
SELECT * FROM Customers WHERE Country = 'Italy' --3.

-- 3. Khách hàng đến từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA'  --13

-- 4. In ra khách hàng đến Mĩ, Ý
-- đời thường có thể nói; những k/h đến từ Ý và Mĩ, Ý hoặc Mĩ
SELECT * FROM Customers WHERE Country = 'USA' AND Country = 'Italy' --0 

SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' -- hiểu logic, hơn là hiểu nghĩa tiếng việt

-- sort hteo Italia, Mĩ để gom cùng cụm cho dễ theo dõi

SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country

-- 5. In ra khách hàng đến từ thủ đô nước Đức
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' --1

-- 6. In ra các thông tin của nhân viên
SELECT * FROM Employees

-- 7. In ra thông tin của nhân viên có năm sinh từ 1960 trở lại gần đây/đổ lại 
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 --4/9

-- 8. In ra thông tin nhân viên có tuổi từ 60 trở lên
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age, * FROM Employees WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) >= 60 

-- 9.  Những nhân viên nào ở London
SELECT * FROM Employees WHERE City = 'London' --5/9

-- 10. Những ai không ở London ? 
SELECT * FROM Employees WHERE City <> 'London'
SELECT * FROM Employees WHERE CITY != 'London'
--vi diệu, đảo mệnh đề
SELECT * FROM Employees WHERE NOT(City = 'London')

--SELECT * FROM Employees WHERE !(City = 'London') -- SAI CÚ PHÁP, ĐẢO MỆNH ĐỀ, PHÉP SS THÌ DÙNG NOT

-- 11. In ra hồ sơ nhân viên có mã số là 1
-- đi vào ngân hàng giao dịch, hoặc đưa số tài khoản, kèm cccd, filter theo cmnd
SELECT * FROM Employees WHERE EmployeeID = 1  -- kiểu số, hk có ''. 
--WHERE TRÊN KEY CHỈ RA 1 THÔI 
--SELECT TRÊN WHERE KEY CHỈ CÓ 1 DÒNG TRẢ VỀ, DISTINCT LÀ VÔ NGHĨA. 

SELECT DISTINCT EmployeeID, City FROM Employees WHERE EmployeeID = 1 ORDER BY EmployeeID

-- CÔNG THƯC FULL KO CHE CỦA SELECT 
-- SELECT ......... FROM ........     WHERE ... GROUP BY... HAVING .... ORDER BY
--			DISTINCT     1, N TABLE          
--			   HÀM()
--			   NESTED QUERY/SUB QUERY

-- 12. Xem thông tin đơn hàng
SELECT * FROM Orders --830 

-- 13. In ra đơn hàng sắp xếp giảm dần theo trọng lượng
SELECT * FROM Orders ORDER BY Freight DESC

-- 14. In ra đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng >= 500 kg 
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC 

-- 15. In ra đơn hàng sắp xếp giảm dần theo trọng lượng, 
-- trọng lượng nằm trong khảng 100 đến 500 
SELECT * FROM Orders WHERE (Freight >= 100 AND Freight <= 500) ORDER BY Freight DESC --174/830

-- 15. In ra đơn hàng sắp xếp giảm dần theo trọng lượng, 
-- trọng lượng nằm trong khảng 100 đến 500 và ship bfởi công ty giao vận số 1
SELECT * FROM Orders WHERE (Freight >= 100 AND Freight <= 500) AND ShipVia = 1 ORDER BY Freight DESC --52/174/830

-- 16. Và không ship tới London 
SELECT * FROM Orders
WHERE(Freight >= 100 AND Freight <= 500) AND (ShipVia = 1) AND (ShipCity <> 'London')
ORDER BY Freight DESC --50/174/830
SELECT * FROM Orders
WHERE(Freight >= 100 AND Freight <= 500) AND (ShipVia = 1) AND NOT(ShipCity = 'London')
ORDER BY Freight DESC --50/174/830

-- 17. Liệt kê danh sách khách hàng đến từ Mĩ hoặc Mexico
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico' --18

-- 18. Liệt kê khách hàng không đến từ Mĩ hoặc Mexico
SELECT * FROM Customers WHERE Country <> 'USA' AND Country <> 'Mexico' --73
SELECT * FROM Customers WHERE NOT(Country = 'USA' OR Country = 'Mexico') --73

-- 19. Liệt kê các nhân viên sinh ra trong đoạn [1960-1970]
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 
ORDER BY BirthDate DESC

--WHERE LÀ WHERE TRÊN VALUE, CÓ THỂ BIẾN ĐỔI VALUE ĐÓ ĐỂ TÍNH TOÁN 

--RẤT CẨN THẬN KHIH TRONG MỆNH ĐỒ WHERE LẠI CÓ AND VÀO OR TRỘN VỚI NHAU, TA PHẢI XÀI THÊM () 
-- ĐỂ PHÂN TÁCH THỨ TỰ FILTER.. (SS AND OR KHÁC NỮA) AND (SS KHÁC)

