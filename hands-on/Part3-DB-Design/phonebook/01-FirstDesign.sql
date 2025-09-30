CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV1
(
	Nick nvarchar(30), 
	Phone varchar(50)
	-- 3 số phone gôm vào một cột
)

SELECT * FROM PhoneBookV1

INSERT INTO PhoneBookV1 VALUES(N'thinhcg', '098x')
-- An có 2 số phone, làm sao lưu? 
INSERT INTO PhoneBookV1 VALUES(N'annguyen', '090x, 091x, ')

-- Bình có 3 số phone, làm sao lưu ? không thấy tao để độ rộng 
-- số phone là 50
INSERT INTO PhoneBookV1 VALUES(N'binhle', '090x, 091x, 092x')

-- *****PHÂN TÍCH: ưu nhược điểm 
-- >>>> ƯU ĐIỂM: SELECT PHONE: LÀ RA ĐƯỢC TẤT CẢ CÁC SỐ DI ĐỘNG 


-- >>>> Cho tôi biết số đế bàn, ở nhà của anh binhle ??? toang
-- >>>> Đáp án: qui ước số đầu tiên là để bàn, số 2 là di động, 3 work. 
-- >>>> khốn nạn vì qui ước ngầm, số nào là loại nào!!! khó nhớ cho
--      người nhập liệu. 
-- >>>> In cho tui số di động của mọi người ?? 
INSERT INTO PhoneBookV1 VALUES(N'binhle', '090x | 091x | 092x')
INSERT INTO PhoneBookV1 VALUES(N'dungpham', '090x, 091x, 092x')
INSERT INTO PhoneBookV1 VALUES(N'dungpham', '090x-091x - 092x')
-- >> tiêu chí nào để cắt chuỗi ?? - DELIMITER DẤU PHÂN CÁCH KO NHẤT QUÁN
-- >> quy ước ngầm về nhập dấu phân cách

-- >>>> đếm xem mỗi người có bn số phone !!!! 
-- dấu phân cách gây khó khăn cho cắt để đếm

-- KHÓ KHĂN XẢY RA KHI TA GÔM NHIỀU VALUE CÙNG KIỂU, NGỮ NGHĨA VÀO 
-- TRONG 1 COLUMN (cột phone lưu nhiều số phone cách nhau dấu cách)
-- gây khó khăn cho nhập dữ liệu (không nhất quán dấu cách), khi select 
-- count() thống kê theo tiêu chí (in số phone ở nhà)
-- update thêm phone mới, xóa số cũ, 

-- MỘT CELL MÀ CHỨA NHIỀU VALUE CÙNG KIỂU, DC GỌI LÀ CỘT ĐA TRỊ 
-- MULTI-VALUE COLUMN -> TIỀM ẨN NHIỀU KHÓ KHĂN CHO VIỆC XỬ LÍ DATA

-- NẾU 1 TABLE CÓ CỘT ĐA TRỊ, NGƯỜI NÓI RẰNG NÓ ÉO ĐẠT CHUẨN 1
-- LEVEL THIẾT KẾ CHÁN QUÁ - 1ST NORMALIZATION 

-- CHUẨN 1, CHẤT LƯỢNG THIẾT KẾ TÍNH TỪ 1, 2, 3, ... 

-- THIẾT KẾ KÉM PHẢI NÂNG CẤP, KO CHƠI ĐA TRỊ NỮA!!!
-- KO CHƠI GOM VALUE TRONG 1 CELL 
-- 2 CHIẾN LƯỢC FIX:
-- CHIỀU NGANG, CHIỀU DỌC: THÊM CỘT, THÊM DÒNG
