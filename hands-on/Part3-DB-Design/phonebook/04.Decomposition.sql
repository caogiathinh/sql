--CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30), --ngoài cột này bị lặp lại, mình còn thêm cột
					   --fullname, tên city, chức vụ. 
	--... CompanyName,.. 
	Phone char(11), -- chỉ 1 số hoi, CẦN THÊM SỐ NÀY LÀ SỐ GÌ ? 
	PhoneType nvarchar(20) -- 090x Home; 091x Work
)
-----------------------------------------
-- TÁCH BẢNG
-- THÔNG TIN BỊ PHÂN MẢNH, NẰM NHIỀU NƠI, PHẢI JOIN 
-- NHẬP DATA COI CHỪNG BỊ VÊNH, XÓA DATA COI CHƯỜNG LẠC TRÔI 
-- PHÂN MẢNH PHẢI CÓ LÚC TÁI NHẬP (JOIN) TRÊN CỘT NÀO ??? 
-- FK XUẤT HIỆN 
-- không chơi với Fk có được k ? 
-- nếu chỉ cần join k cần FK, cột = value, khớp là join, nối bảng, ghép ngang 
-- nếu kèm thêm, xóa, sửa, chết chưa, lộn xộn không nhất quán

CREATE TABLE PersonV4_1
(
	Nick nvarchar(30),
	Title nvarchar(30), 
	Company nvarchar(40) 
)

CREATE TABLE PhoneBookV4_1
(
	Phone char(11), 
	PhoneType nvarchar(20),
	Nick nvarchar(30) --không cần fk, chỉ cần join là okie. 
)

SELECT * FROM PhoneBookV4_1
SELECT * FROM PersonV4_1

INSERT INTO PersonV4_1 VALUES(N'thinhcg', 'Student', 'OU HCMC')
INSERT INTO PersonV4_1 VALUES(N'annguyen', 'Student', 'OU HCMC')
INSERT INTO PersonV4_1 VALUES(N'binhle', 'Student', 'OU HCMC')


INSERT INTO PhoneBookV4_1 VALUES('098x', 'Cell', 'thinhcg')
INSERT INTO PhoneBookV4_1 VALUES('090x', 'Cell', N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES('091x', 'Home', N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES('090x', 'Work', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES('091x', 'Cell', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES('092x', 'Cell', N'binhle')

