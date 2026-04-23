-- Thiếu NOT NULL cho cột Email: Cột Email hiện tại cho phép để trống. Khi chạy chiến dịch, script gửi mail lấy ra một giá trị rỗng hoặc NULL, dẫn đến lỗi kết nối hoặc lỗi hàm gửi mail.
-- Thiếu CHECK Constraint cho cột Age: Kiểu INT chấp nhận cả số âm. Việc khách hàng có tuổi là -5 là lỗi logic nghiêm trọng. Cần một ràng buộc để đảm bảo tuổi phải là số dương (ví dụ: > 0 và < 150).
-- Thiếu UNIQUE cho cột Email (Khuyến nghị): Để tránh việc một khách hàng nhận 10 email chúc mừng giống hệt nhau do đăng ký nhiều tài khoản cùng 1 email, cột này nên là duy nhất.


ALTER TABLE CUSTOMERS 
MODIFY Email VARCHAR(100) NOT NULL;

ALTER TABLE CUSTOMERS 
ADD CONSTRAINT UC_Email UNIQUE (Email);

ALTER TABLE CUSTOMERS 
ADD CONSTRAINT CHK_CustomerAge CHECK (Age > 0 AND Age < 120);