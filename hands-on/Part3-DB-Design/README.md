[[SQL]]

## I. Quy trình tổng
### Tương đồng giữa góc nhìn database và oop

|                                           | OOP                                                                                                                          | DATABASE                                                                                                                      |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| I. Requirements Gathering/Problem Defined | ![[Pasted image 20250927082001.png]]<br>Yêu cầu của khách hàng về lưu, quản lý thông tin. Đối tượng trong OOP là **object**. | ![[Pasted image 20250927082016.png]]Yêu cầu của khách hàng về lưu, quản lý thông tin. Đối tượng trong Database là **entity**. |
| II. Concept design                        | Class diagram<br>![[Pasted image 20250927083010.png]]                                                                        | ERD - Entity Relationship Diagram (Chen or Crow's Foot notation)<br>![[Pasted image 20250927082936.png]]                      |
| III. Logical Design & Implementation      | ![[Pasted image 20250927083147.png]]                                                                                         | ![[Pasted image 20250927083158.png]]                                                                                          |
| IV. Excution                              | ![[Pasted image 20250927083244.png]]                                                                                         | ![[Pasted image 20250927083257.png]]                                                                                          |
- Object, entity tuy 2 mà một. 
### Hiểu sâu hơn về đối tượng (Object-Entity)
- Là những thứ xung quanh ta, chứa đựng nhiều thông tin giúp ta mô tả được chúng nhận diện, phân biệt được. 
- Đối tượng chứa nhiều info được mô tả/nhận diện/phân biệt qua: 
	- Tên gọi tắt của đối tượng/định danh (biến phức tạp/biến object): Midu, MTP, ...
	- Các đặc điểm/thuộc tính (biến value): họ tên, tuổi, bài hits, thu nhập, giải thưởng, ... 
	- Các hành vi/phương thức/hành động/bahavior/method/hàm: hát, ăn uống, .. 
### Class - classify - table
Các đối tượng có đặc trưng chung được gôm nào một nhóm: sinh viên, diễn viên, ca sĩ, giáo viên, ..
### Nhân bản/đúc/clone/construct object  - từng row
Từ dàn khuôn class đúc ra hàng loạt các đối tượng. Một lần new edit thông tin đối tượng sẽ tạo ra một đối tượng mới. (cùng cái khuôn thêm data vào).
### Conceptual Design - Class Diagram

> [!NOTE] Quan trọng 
> Bảng thiết kế **conceptual model** rất quan trọng không phục thuộc vào ngôn ngữ mà chỉ nhằm mục đích lưu trữ thông tin (lưu thông tin gì, quan hệ của chúng ra sao?), giải quyết vấn đề. Từ đó tùy thuộc công sẽ generate code xử lý. Giống như trong xây dựng công trình, cần phải vẽ bảng thiết kế trước khi xây dựng không ai xây dựng ngay luôn. 

## II. Chi tiết Database Design
### Table Terminology

![[Pasted image 20250927113057.png]]
	- Relation schema - table schema
	- Table/relation
	- Primary key: khóa cấm trùng (dùng đế phân biệt)
	- Column/attribute/field: cột/trường dữ liệu
		- varchar(40) - domain/data type.
	- Record/tuple/row/entity: bản ghi
	- Cell/data/value
	- Total of rows - cardinality. 
	- Total of columns - degre.
### Constraints View - góc nhìn ràng buộc dữ liệu
![[Pasted image 20250927133621.png]]
- NOT NULL
- UNIQUE
- PRIMARY KEY
- FOREIGN KEY
- CHECK
- DEFAULT
### Operations - góc nhìn thực thi triển khai
![[Pasted image 20250927135141.png]]

- DDL (Data Definition Languages): CREATE, DROP, ALTER, RENAME, TRUNCATE ... (thao tác với table - hay cái tủ đồ)
- DML (Data Manipulation Languages): SELECT, INSERT, UPDATE, DELETE, CALL - thao tác chủ yếu trên dữ liệu (món đồ bên trong cái tủ đồ)
	- DQL (xem những món đồ - data có trong tủ đồ): SELECT.
- DCL (Data Control languages): sercurity ai được đụng vô dữ liệu (ai được đụng vô đồ  của mình): GRANT, REVOKE,.. 
- TCL (Transaction Control Languages): trao đổi đồ, bánh ít cho đi bánh qui nhận lại.