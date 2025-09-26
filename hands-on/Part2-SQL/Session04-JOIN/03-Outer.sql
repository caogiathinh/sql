USE Cartesian 

-- 1. Liệt kê cho tôi các cặp từ điển Anh_Việt
SELECT * FROM Endict e, VnDict v
		 WHERE e.Nmbr = v.Nmbr
		 --CÓ BĂNG CELL THÌ MỚI GHÉP
SELECT * FROM Endict e INNER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
		 -- hãy ghép đi, trên cột này có cell/value này = cell/value bên kia
SELECT * FROM Endict e JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
-- 3 câu tương đương kết quả

--2. Hụt mất của tui từ 4-Four và 5 Năm ko thấy xuất hiện
-- muốn xuất hiện 4 four và 5 năm thì tích Đề Các
SELECT * FROM VnDict v, EnDict e

--3. Tui muốn lấy tiếng anh làm chuẩn tìm các nghĩa TV tương đương
-- Nếu ko có tương đương vẫn phải hiện ra. 
SELECT * FROM EnDict e LEFT JOIN VnDict v
				ON e.Nmbr = v.Nmbr
SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v
				ON e.Nmbr = v.Nmbr

--4. Tui muốn lấy tiếng Việt làm đầu !!

SELECT * FROM VnDict v LEFT OUTER JOIN EnDict e
				ON e.Nmbr = v.Nmbr

-- vẫn lấy tiếng Việt làm đầu, nhưng để Tiếng Việt bên tay phải kìa
SELECT * FROM EnDict e RIGHT OUTER JOIN VnDict v
				ON e.Nmbr = v.Nmbr

--5. Dù chung và riêng mỗi bên, lấy tất cả, chấp nhận FA ở 1 vế 
SELECT * FROM EnDict e FULL OUTER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr

SELECT * FROM EnDict e FULL JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
-- FULL PUTẺ JOIN, THỨ TỤ TABLE KHÔNG QUAN TRỌNG, VIẾT TRƯỚC SAU ĐỀU ĐƯỢC
-- LEFT, RIGHT JOIN THỨ TỰ TABLE LÀ CÓ CHUYỆN KHÁC NHAU 
SELECT * FROM EnDict e LEFT JOIN VnDict v
		 ON e.Nmbr = v.Nmbr --SHOW 4 Four NULL 

SELECT * FROM VnDict e LEFT JOIN EnDict v
		 ON e.Nmbr = v.Nmbr --SHOW 5 Năm NULL 

-- OUTER JOIN SINH RA ĐỂ ĐẢM BẢO VIỆC KẾT NỐI GHÉP BẢNG
-- DO BỊ MẤT MÁT DATA 
-- DO INNER JOIN, JOIN = CHỈ TÌM CÁI CHUNG 2 BÊN 
