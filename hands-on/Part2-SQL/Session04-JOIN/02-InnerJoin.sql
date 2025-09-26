USE Cartesian
SELECT * FROM VnDict, Endict

SELECT * FROM VnDict CROSS JOIN Endict

SELECT * FROM VnDict vn, Endict en		--TÍCH ĐỀ CÁC XONG LỌC LẠI
		 WHERE vn.Nmbr = en.Nmbr

SELECT * FROM VnDict, Endict 
		 WHERE Nmbr = Nmbr --BỐI RỐI TÊN

SELECT * FROM VnDict, Endict 
		 WHERE VnDict.Nmbr = Endict.Nmbr --NÊN ĐẶT ALIAS GIÚP CÂU LỆNH NGẮN GỌN HƠN.

--CHUẨN
SELECT * FROM Vndict INNER JOIN Endict --NHÌN SÂU TABLE RỒI GHÉP, KHÔNG GHÉP BỪA BÃI
					 ON Vndict.Nmbr = Endict.Nmbr   --GHÉP CÓ TƯƠNG QUAN BÊN TRONG, THEO ĐIỂM CHUNG

SELECT * FROM Vndict JOIN Endict 
					 ON Vndict.Nmbr = Endict.Nmbr 

-- CÓ THỂ DÙNG THÊM WHERE ĐƯỢC KHÔNG ? KHI XÀI INNER, JOIN.  
-- JOIN CHỈ LÀ THÊM DATA VỀ TÍNH TOÁN, GỘP DATA LẠI NHIỀU HƠN, SAU ĐÓ ÁP DỤNG TOÀN BỘ 
-- KIẾN THỨC SELECT ĐÃ HỌC 
