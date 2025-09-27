CREATE DATABASE DBDESIGN_ONETABLE
--CREATE DÙNG ĐẺ TẠO CẤU TRÚC LƯU TRỮ/DÀN KHUNG/THÙNG DÙNG LƯU TRỮ DATA/INFO
--TƯƠNG ĐƯƠNG VIỆC XÂY PHÒNG CHỨA ĐỒ - DATABASE
--			  MUA TỦ ĐỂ TRONG PHÒNG  - TABLE
--1 DB CHỨA NHIỀU TABLE - 1 PHÒNG CÓ NHIỀU TỦ
--						- 1 NHÀ CÓ NHIỀU PHÒNG
--TẠO RA CẤU TRÚC LƯU TRỮ - CHƯA NÓI DATA BỎ VÀO -- DDL (PHÂN NHÁNH CỦA SQL)


USE DBDESIGN_ONETABLE

--Tạo table lưu trữ hồ sơ sinh viên: mã số (phân biệt các sinh viên với nhau), tên, dob, địa chỉ, .. .
-- 1 sv ~~~ OBJECT ~~~ ENTITY
-- 1 TABLE DÙNG LƯU NHIỀU ENTITY

CREATE TABLE StudentV1
(
	StudentID char(8), 
	LastName nvarchar(40), --tại sao không gộp full name cho rồi
	FirstName nvarchar(10), --n, lưu kí tự Unicode tiếng Việt
	DOB datetime, 
	Address nvarchar(50),
)

--SQL Server | Oracle | DB2 | MySQL | PostgresSQL | SQLLite | MS Access

--THAO TÁC TRÊN DATA/MÓN ĐỒ TRONG TỦ/TRONG TABLE - DML/DQL (dành riêng cho SELECT) 
SELECT * FROM StudentV1
