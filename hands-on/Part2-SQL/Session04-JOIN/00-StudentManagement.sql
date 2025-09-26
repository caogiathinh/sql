DROP DATABASE StudentManagement

CREATE DATABASE StudentManagement

USE StudentManagement

CREATE TABLE Major
(
	MajorID char(2) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	MajorName varchar(30),
	Hotline varchar(11)
)

INSERT INTO Major VALUES('SE', 'Software Engineering', '090x')
INSERT INTO Major VALUES('IA', 'Information Assurance', '091x')
INSERT INTO Major VALUES('GD', 'Graphic Design', '092x')
INSERT INTO Major VALUES('JP', 'Japanese', '093x')
INSERT INTO Major VALUES('KR', 'Korean', '094x')

SELECT * FROM Major

--DROP TABLE Student
CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50), 
	MajorID char(2) REFERENCES Major(MajorID)  -- FK Foreign Key - Khóa ngoại
)

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE1', N'Nguyễn', N'Một', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE2', N'Lê', N'Hai', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE3', N'Trần', N'Ba', 'SE');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE4', N'Phạm', N'Bốn', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE5', N'Lý', N'Năm', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE6', N'Võ', N'Sáu', 'IA');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD7', N'Đinh', N'Bảy', 'GD');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD8', N'Huỳnh', N'Tám', 'GD');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('JP9', N'Ngô', N'Chín', 'JP');

SELECT * FROM Student

-- TỪ TỪ HÃY THÊM VÀO ĐỂ XEM FULL-OUTER JOIN RA SAO
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('UNK', N'Đặng', N'Mười', NULL);


SELECT * FROM Major
SELECT * FROM Student

--1. In ra thông tin chi tiêt của sinh viên kèm thông tin chuyên ngành 
SELECT * FROM Student --info tắt của chuyên ngành
SELECT * FROM Major -- chỉ có info chuyên ngành, không có info sinh viên 
-- JOIN chắc chắn, lấy info đang nằm ở bên kia ghép thêm theo chiều ngang

SELECT * FROM Student s, Major m 
		 WHERE s.MajorID = m.MajorID --dư cột MajorID 

SELECT s.*, m.MajorName, m.Hotline 
		 FROM Student s, Major m 
		 WHERE s.MajorID = m.MajorID 

SELECT s.*, m.MajorName, m.Hotline 
		 FROM Student s JOIN Major m 
		 ON s.MajorID = m.MajorID 

-- 2. In ra thông tin chi tiết của sinh viên kèm info chuyên ngành. Chỉ quan tâm sv SE và IA
SELECT s.*, m.MajorName, m.Hotline 
		 FROM Student s JOIN Major m 
		 ON s.MajorID = m.MajorID 
		 WHERE m.MajorID IN('SE', 'IA')

SELECT s.*, m.MajorName, m.Hotline 
		 FROM Student s JOIN Major m 
		 ON s.MajorID = m.MajorID 
		 WHERE m.MajorID = 'SE' OR m.MajorID = 'IA' --khuyến khích sử dụng

SELECT s.*, m.MajorID, m.MajorName, m.Hotline 
		 FROM Student s, Major m 
		 WHERE s.MajorID = m.MajorID AND m.MajorID IN('SE', 'IA')

--3. In ra thông tin các sinh viên kèm chuyên ngành. Chuyên ngành chưa có sv cũng in ra
-- phân tích: căn theo sinh viên mà in, thì HÀN QUÓC tèo không xuất hiện 
SELECT s.*, m.MajorName, m.Hotline 
		 FROM Student s RIGHT JOIN Major m 
		 ON s.MajorID = m.MajorID --10

SELECT s.*, m.*
		 FROM Student s RIGHT JOIN Major m 
		 ON s.MajorID = m.MajorID --10

SELECT s.*, m.*
		FROM Major m LEFT JOIN Student s 
		ON s.MajorID = m.MajorID --10, KOREAN FA NULL

SELECT s.*, m.*
		FROM Student s LEFT JOIN Major m
		ON s.MajorID = m.MajorID --9 dòng, KOREAN biến mất 

--4. Có bao nhiêu chuyên ngành 
SELECT COUNT(*) AS [No majors] FROM Major
SELECT COUNT(MajorID) AS [No majors] FROM Major

--5. Mỗi chuyên ngành có bao nhiêu sinh viên ?? 
--output 0: số lượng sính viên đang theo học của từng chuyên ngành 
--output 1: mã cn, số lượng sinh viên đang theo học 
--phân tích: hỏi sv, bao nhiêu sinh viên, đến sv 
--				gặp thêm từ mỗi
--				mỗi chuyên ngành có 1 con số đếm, đếm theo chuyên ngành, chia nhóm chuyên ngành mà đếm
SELECT MajorID, COUNT(*) AS [No Students] FROM Student GROUP BY MajorID
SELECT MajorID, COUNT(MajorID) AS [No Students] FROM Student GROUP BY MajorID

--6. Chuyên ngành nào có từ 3 sinh viên trở lên
--phân tích: 
--			đầu tiên phải đếm chuyên ngành, quét qua bảng 1 lần để đế ra sv
--			đếm xong dợt lại kết quả, lọc thêm cái từ 3 sv trở lên
--			group by xong rồi tính tiếp. 
SELECT MajorID, COUNT(*) AS [No Students] 
		FROM Student 
		GROUP BY MajorID
		HAVING COUNT(*) >= 3

--7. CHUYÊN NGÀNH NÀO CÓ ÍT SV NHẤT? 
SELECT MajorID, COUNT(*) AS [No Students] 
		FROM Student 
		GROUP BY MajorID
		HAVING COUNT(*) <= ALL (
									SELECT COUNT(*) AS [No Students] 
									FROM Student 
									GROUP BY MajorID
								)

--8. Đếm sinh viên của chuyên ngành SE
--phân tích: câu này hỏi đếm các chuyên ngành
--cứ tìm SE mà đếm 
SELECT COUNT(*) AS [No Students] 
		FROM Student 
		WHERE MajorID = 'SE' --nhanh

SELECT MajorID, COUNT(*) AS [No Students] FROM Student 
		WHERE MajorID = 'SE'
		GROUP BY MajorID

--9. Đếm số sinh viên của mỗi chuyên ngành 
--ouput: mã cn,tên cn, số lượng sinh viên
--phân tích: đáp án cần có info của 2 table 
--			 đếm trên 2 table
--			 đếm trong Major hong có info sinh viên
--			 đếm trong SV chỉ có được mã cn 
--			 mún có mã cn, tên cn, số lượng sv -> JOIN 2 BẢNG SAU ĐÓ ĐẾM
SELECT s.StudentID, s.FirstName, m.MajorID, m.MajorName
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID

SELECT m.MajorID, m.MajorName, COUNT(*) AS [No students]
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID
		GROUP BY m.MajorID, m.MajorName

--10. câu 10 điểm 
-- THIẾU MẤT CHUYÊN NGÀNH HÀN QUỐC ? 

SELECT s.StudentID, s.FirstName, m.MajorID, m.MajorName
		FROM Student s RIGHT JOIN Major m
		ON s.MajorID = m.MajorID

SELECT m.MajorID, m.MajorName, COUNT(*) AS [No students]
		FROM Student s RIGHT JOIN Major m
		ON s.MajorID = m.MajorID
		GROUP BY m.MajorID, m.MajorName -- SAI VÌ CÓ 1 DÒNG HÀN QUÓC FA, NULL VỀ SV
										-- COUNT(1) CÓ 1 DÒNG FA, HQ CÓ 1 SV SAI

SELECT m.MajorID, m.MajorName, COUNT(s.StudentID) AS [No students]
		FROM Student s RIGHT JOIN Major m
		ON s.MajorID = m.MajorID
		GROUP BY m.MajorID, m.MajorName --count null lại đúng trong trường hợp này 
										--vì mã sinh viên null ứng với chuyên ngành hàn quốc
										--COUNT(*) chỉ cần có dòng là ra 1
										--CHẤP DÒNG CÓ NHIỀU NULL HAY KHÔNG?
										
										--ĐÉM CELL CELL NULL -> 0 
		--DASH BOARD MÀN HÌNH THỐNG KẾ CỦA ADMIN WEBSITE TUYỂN SINH 

