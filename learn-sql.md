[[SQL]]

[Học SQL thực sự](https://www.youtube.com/watch?v=qPPTVPCzed0)
## Học SQL để làm gì ?

- Learn SQL as Data Discoverer.
- Việc học viết SQL statement thực sự là chưa đủ (nhưng nó cũng quan trọng).
## Vậy học SQL như thế nào ?
### Basic SQL
- **Data modeling:** (theo em hiểu thì anh nhắc tới database design sao cho tối ưu về lưu trữ 3NF, rồi từ database design mình denormalize modeling thành các bảng fact dim).
- **Data structure:** parquet, avro, orc file.. có những đặc tính như thế nào ? điểm nổi bật của nó là gì ?
- **Data manipulation (DML):** (theo e hiểu là các câu lệnh mình practice trên các nền tảng: leetcode, hackerrank,... SELECT, UPDATE, INSERT, DELETE).
### Advance SQL
- **Data Partioning**: 
	- Đặt partion cho những column thường xuyên select, tăng performance cho câu truy vấn. (anh có nhắc về những tiêu chí partion).
	- Các partition phổ biến: ngày tháng năm, dataset, domain, distribution key (country, chanel,...).
- **Database management:** 
	- Quản lý meta data
	- Quản trị configuration: các bảng config.
	- Data management về engine: đọc excution plan để optimize query.
- **Distributed database:**
	- Scale chiều dọc:
	- Scale chiều ngang: 
	- Data shuffling như thế nào ?
- **How data movement is handled**
	- Trong hệ thống phân tán thì data move như thế nào ?
- **Data Warehouse and Lakehouses**
	- Data Warehouse: OLAP. 
	- Lakehouses: có thêm catalog, governance, management, file format.
## Summary
- Học SQL không chỉ là luyện leetcode.
- Cần học nhiều hơn về SQL: data partioning, database management, distributed database, datawarehouse, lakehouses.