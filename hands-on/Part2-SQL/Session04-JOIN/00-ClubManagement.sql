DROP DATABASE ClubManagement

CREATE DATABASE ClubManagement

USE ClubManagement

DROP TABLE Club
CREATE TABLE Club
(
	ClubID char(5) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	ClubName nvarchar(50),
	Hotline varchar(11)
)

INSERT INTO Club VALUES('SiTi', N'Cộng đồng Sinh viên Tình nguyện', '090x')
INSERT INTO Club VALUES('SkllC', N'Skillcetera', '091x')
INSERT INTO Club VALUES('CSG', N'CLB Truyền thông Cóc Sài Gòn', '092x')
INSERT INTO Club VALUES('FEV', N'FPT Event Club', '093x')
INSERT INTO Club VALUES('FCode', N'FPT Code', '094x')

SELECT * FROM Club

DROP TABLE Student
CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50)	
)

INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE1', N'Nguyễn', N'Một');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE2', N'Lê', N'Hai');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE3', N'Trần', N'Ba');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE4', N'Phạm', N'Bốn');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE5', N'Lý', N'Năm');

SELECT * FROM Student

DROP TABLE Registration
CREATE TABLE Registration
(
	RegID int IDENTITY(1, 1) PRIMARY KEY,   -- PK Primary Key - Khóa chính - Tăng tự động từ 1	      
	StudentID char(8),
	ClubID char(5),    
	JoinedDate date,
	LeavedDate date
	CONSTRAINT FK_Reg_Club FOREIGN KEY (ClubID) REFERENCES Club(ClubID),                -- FK Foreign Key - Khóa ngoại
	CONSTRAINT FK_Reg_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID)     -- FK Foreign Key - Khóa ngoại
)


-- SiTi 3, SkllC 2, CSG 2, FEV 0, FCODE 0
-- SE1 3, SE2 3, SE3 1, SE4 0, SE5 0
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'CSG')


INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'CSG')

INSERT INTO Registration(StudentID, ClubID) VALUES('SE3', 'SiTi')

SELECT * FROM Registration
SELECT * FROM Club
SELECT * FROM Student

-- 1. Liệt kê các sinh viên đang theo học 
SELECT * FROM Student

-- 2. Liệt kê các sinh viên đang theo học  kèm theo câu lạc bộ bạn ấy đang tham gia
-- output 1: mẫ sv, tên sv, mã clb
-- output 2: mẫ sv, tên sv, mã clb, tên clb

SELECT s.StudentID, s.FirstName + ' ' + s.LastName AS [FullName], r.ClubID
FROM Student s JOIN Registration r
ON s.StudentID = r.StudentID 
--!!! thiếu sinh 4,5 vì JOIN = 

SELECT s.StudentID, s.FirstName + ' ' + s.LastName AS [FullName], r.ClubID
FROM Student s LEFT JOIN Registration r
ON s.StudentID = r.StudentID 

--3. In ra thông tin tham câu lạc bộ của các sv
--Output: mã sv, tên sv, mã clb, tên clb, joindate
SELECT * FROM Student s JOIN Registration r
		 ON s.StudentID = r.StudentID
		 JOIN Club c ON r.ClubID = c.ClubID

SELECT s.StudentID, s.LastName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s LEFT JOIN Registration r
		 ON s.StudentID = r.StudentID
		 JOIN Club c ON r.ClubID = c.ClubID
--vấn đề lớn: mất sv4 sv5, mất luôn cả clb FCode, FEV
SELECT s.StudentID, s.LastName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s, Registration r, Club c
WHERE s.StudentID = r.StudentID AND r.ClubID = c.ClubID
--viết kiểu này không lấy được phần hụt, chỉ bám trên common field

--ghép và in ra, thằng nào không bằng, hụt

SELECT s.StudentID, s.LastName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s FULL JOIN Registration r
		 ON s.StudentID = r.StudentID
		 FULL JOIN Club c ON r.ClubID = c.ClubID --11

-- BTVN
-- 1. Đếm số clb mà sv đã tham gia
--output: mã sv, tên sv, số clb tham gia

--2. Sinh viên SE1 tham gia mấy clb?
--output: mã sv, tên sv, số clb-tham-gia

--3. Sv nào tham gia nhiều clb nhất ???

--4. CLB Cộng đồng sinh viên tình nguyện có những sinh viên nào tham gia (gián tiếp)
--Không dùng sub cũng được, nhớ là không hỏi SiTi à nhen
-- dùng sub cũng oke

--5. Mỗi clb có bao nhiêu thành viên 
--output: mã clb, tên clb, số thành viên 

--6. CLB nào đông member nhất
--Output: mã clb, tên clb, số thành viên

--7. CLB Siti và CSG có bao nhiêu member. Đếm riêng từng clb
--Output: mã clb, tên clb, số thành viên (2 dòng) 

--8. Có tổng cộng bao nhiêu lượt sinh viên tham gia clb

