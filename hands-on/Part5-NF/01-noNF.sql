CREATE DATABASE SWRSE10D
USE SWRSE10D

CREATE TABLE StudentNoNF
(
	Id char(8),
	FullName nvarchar(25), 
	DOB date, 
	PAddress nvarchar(40),
	MajorID char(2), --SE, IA, GD, SS
	MajorName nvarchar(30)
)

SELECT * FROM StudentNoNF
