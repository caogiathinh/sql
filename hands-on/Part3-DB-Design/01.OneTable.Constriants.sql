-- PHẦN NÀY THÍ NGHIỆM CÁC LOẠI RÀNG BUỘC - CONSTRAINTS - QUY TẮC GÀI TRÊN DATA

--1. RÀNG BUỘC PRIMARY KEY
-- tạm thời chấp nhận PK là 1 cột (tương lai có thể nhiều cột) mà giá trị 
-- của nó trên mọi dòng mọi dòng/mọi cell  của cột này không trùng lại, mục đích để 
-- WHERE ra được 1 dòng duy nhất
-- VALUES CỦA KEY CÓ THỂ ĐƯỢC TẠO RA THEO 2 CÁCH
-- CÁCH 1: TỰ NHẬP = TAY, DB ENGINE TỰ KIỂM TRA DÙNG MÌNH CÓ TRÙNG HAY KHÔNG? 
--			NẾU TRÙNG DBE TỰ BÁO VI PHẠM PK CONSTRAINT

-- CÁCH 2: ÉO CẦN NHẬP BẰNG TAY VALUES CỦA PK, MÁY/DB ENGINE TỰ GENERATE CHO 
-- MÌNH 1 CON SỐ KHÔNG TRÙNG LẠI !!! CON SỐ TỰ TĂNG, CON SỐ HEXA... 
-- 
-- THỰC HÀNH 
-- Thiết kế table lưu thông tin đăng ký event nào đó (giống đăng kí qua gg form)
-- Thông tin cần lưu trữ: số thư tự đăng kí, full name, email, 
-- ngày giờ đăng kí, số di động...
-- * phân tích 
-- ngày giờ dki: không bắt nhập, default
-- số thứ tự: nhập vào là bậy rồi, tự gán chứ
-- email, phone: không cho trùng, 1 email 1 lần đăng kí. 
-- ...
USE DBDESIGN_ONETABLE
/*
CREATE TABLE Registration
(
	SEQ int PRIMARY KEY,--phải tự nhập số thứ tự, vớ vẩn  
	FirstName nvarchar(10),
	LastName nvarchar(30),
	Email varchar(50),  
	Phone varchar(11),
	RegDate datetime DEFAULT GetDate() --constaint default
)
*/
CREATE TABLE RegistrationV2
(
	SEQ int PRIMARY KEY IDENTITY, --mặc định đi từ 1, nhảy 1 đơn vị cho người sau ++
								  --ghi rõ IDENTITY(1,1)
								  --IDENTITY(1,5), từ 1, 6, 11, .. 

	FirstName nvarchar(10),
	LastName nvarchar(30),
	Email varchar(50),  
	Phone varchar(11),
	RegDate datetime DEFAULT GetDate() --constaint default
)
SELECT * FROM RegistrationV2
--ĐĂNG KÍ EVENT
INSERT INTO RegistrationV2 VALUES(N'An', N'Nguyễn', 'an@..', '090x') --lỗi, không map dc các cột

INSERT INTO RegistrationV2 VALUES(N'An', N'Nguyễn', 'an@..', '090x', null) 

INSERT INTO RegistrationV2(FirstName, LastName, Email, Phone) VALUES(N'Bình', N'Lê', 'binh@..', '091x') 

-- XÓA 1 DÒNG CÓ AUTO  GENERATE KEY THÌ TABLE SẼ BỊ LỦNG SỐ, DBE KHÔNG LẤP CHỖ LỦNG ĐÂU
-- 1 2 3 4 5 6, XÓA 3, CÒN 1 2 4 5 6, ĐĂNG KÍ TIẾP TÍNH TỪ 7
