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

-- THÍ NGHIỆM THÊM CHO INNER JOIN, GHÉP NGANG CÓ XEM XÉT MÔNG ĐĂNG HỘ ĐỐI HAY KHÔNG
SELECT * FROM EnDict
SELECT * FROM VnDict

SELECT * FROM EnDict e, VnDict v
		 WHERE e.Nmbr = v.Nmbr

SELECT * FROM EnDict e, VnDict v
		 WHERE e.Nmbr > v.Nmbr --GHÉP CÓ CHỌN LỌC NHƯNG KHÔNG SÀI DẤU = 
							   --MÀ DÙNG > >= < <= != 
							   --NON-EQUI JOIN 
							   --VẪN KHÔNG LÀ GHÉP BỪA BÃI 


--2 two 1 mot
--3 three 1 mot
--3 three 2 hai

SELECT * FROM EnDict e, VnDict v  -- THỰC DỤNG 
		 WHERE e.Nmbr != v.Nmbr
SELECT * FROM EnDict e JOIN VnDict v -- CHUẨN MỤC 
		 ON e.Nmbr != v.Nmbr


