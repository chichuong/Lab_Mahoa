# KỊCH BẢN QUAY DEMO LAB 2 - MÃ HÓA ĐỐI XỨNG HIỆN ĐẠI

> **Mục tiêu**: Hướng dẫn chi tiết từng giây/từng thao tác để bạn quay video demo đạt điểm tối đa (10/10) theo đúng yêu cầu tài liệu `LAB2_HuongDan.pdf`.

---

## 🛠️ BƯỚC 0: CHUẨN BỊ TRƯỚC KHI BẤM QUAY
1. Đảm bảo dịch vụ SQL Server đang chạy (port 14333). Database `LAB2_MaHoaHienDai` và tài khoản `lab2_user` (mật khẩu `LabUser@2026`) đã được tạo sẵn.
2. Mở sẵn NetBeans (hoặc thư mục `Lab2_Setup_MoiTruong`).
3. Mở sẵn 1 cửa sổ Notepad chứa sẵn các test case bên dưới để copy-paste cho nhanh khi quay.

---

## 🎬 BƯỚC 1: BẮT ĐẦU QUAY VIDEO & THAO TÁC COPY CODE

1. **Bấm bắt đầu quay màn hình**.
2. **Show thư mục setup môi trường**:
   - Mở thư mục `Lab2_Setup_MoiTruong\LAB2_MaHoaHienDai`.
   - Mở file `pom.xml` lướt nhanh cho thấy: đã cấu hình đầy đủ `mssql-jdbc` (kết nối SQL Server) và `bcprov-jdk18on` (BouncyCastle cho Twofish).
   - Mở thư mục `src\main\java\week_02` (đang trống / sẵn sàng).
3. **Thao tác copy code**:
   - Mở thư mục `Lab2_Code_HoanChinh\LAB2_MaHoaHienDai\src\main\java\week_02`.
   - Chọn tất cả các file `.java` (hoặc nhấp đúp file `Copy_Nhanh_Toan_Bo_Code.bat` trong thư mục `Lab2_Setup_MoiTruong`) -> copy toàn bộ file code vào `Lab2_Setup_MoiTruong\LAB2_MaHoaHienDai\src\main\java\week_02`.
   - Trong NetBeans: project `LAB2_MaHoaHienDai` sẽ nhận diện toàn bộ các file mà không có lỗi gạch đỏ.

---

## 🚀 BƯỚC 2: CHẠY MENU CHÍNH VÀ DEMO CÁC BÀI THỰC HÀNH

Khởi chạy form chính bằng cách nhấp phải `frm_Menu.java` -> **Run File** (Shift+F6) hoặc nhấp đúp `Chay_Project_Ngay.bat`. Cửa sổ giao diện chính của Lab 2 hiện ra.

---

### 🔹 1. BÀI 2.1: MẬT MÃ DES
- Trên Menu bấm nút **2.1 DES**.
- **Test mã hóa**:
  + Plaintext: `Xin chào Lab 2 - Mã hóa hiện đại!`
  + Key (giữ mặc định): `12345678`
  + Bấm nút **Encrypt** -> Bản mã Base64 xuất hiện ở ô Ciphertext.
  + Bấm **Encrypt** lần nữa -> Bản mã thay đổi (do cơ chế sinh IV 8-byte ngẫu nhiên mỗi lần mã hóa theo chuẩn CBC).
- **Test giải mã**:
  + Xóa ô Plaintext -> Bấm nút **Decrypt** -> Plaintext khôi phục lại nguyên vẹn tiếng Việt có dấu.
- **Test bẫy lỗi (Validation)**:
  + Đổi key thành `1234` (sai độ dài) -> Bấm **Encrypt** -> Hiện hộp thoại thông báo lỗi: `Khóa DES phải đúng 8 byte...`.
  + Đổi key lại thành `87654321` (sai khóa khi giải mã) -> Bấm **Decrypt** -> Hiện hộp thoại: `Giải mã thất bại: sai Key hoặc bản mã bị sửa...`.
- **Test lưu & mở tệp**:
  + Đổi lại key đúng `12345678`, bấm **Encrypt**.
  + Bấm nút **Save File** -> Lưu tệp `des_ciphertext.txt`.
  + Xóa trắng ô Ciphertext -> Bấm nút **Open File** chọn lại tệp vừa lưu -> Bấm **Decrypt** -> Giải mã thành công.
- Đóng cửa sổ DES.

---

### 🔹 2. BÀI 2.2: MẬT MÃ TRIPLEDES (3DES)
- Trên Menu bấm nút **2.2 TripleDES**.
- **Test mã hóa & giải mã**:
  + Plaintext: `Xin chào Lab 2 - Mã hóa hiện đại!`
  + Key (mặc định 24 ký tự): `123456789012345678901234`
  + Bấm **Encrypt** -> Bản mã Base64 xuất hiện.
  + Xóa Plaintext -> Bấm **Decrypt** -> Khôi phục chuẩn xác.
- **Test lỗi độ dài khóa**:
  + Xóa bớt 1 ký tự ở Key (còn 23 ký tự) -> Bấm **Encrypt** -> Báo lỗi: `Khóa DESede phải đúng 24 byte...`.
- Đóng cửa sổ TripleDES.

---

### 🔹 3. BÀI 2.3: MẬT MÃ AES-GCM, ĐĂNG KÝ, ĐĂNG NHẬP & SQL SERVER
- Trên Menu bấm nút **2.3 AES + Login**.
- **Test phân quyền Ticket**:
  + Khi chưa đăng nhập, bấm thử **Encrypt** -> Báo lỗi: `Hãy Login trước khi dùng AES.`
- **Kết nối SQL Server**:
  + Bấm nút **Kết nối SQL Server** (mở form `frm_KetNoiSQL`).
  + Các thông số đã điền sẵn:
    * Server: `127.0.0.1`
    * Port: `14333`
    * Database: `LAB2_MaHoaHienDai`
    * User: `lab2_user`
    * Password: nhập `LabUser@2026`
  + Bấm nút **Test Connection** -> Dòng trạng thái hiện thông báo màu xanh: `Kết nối thành công: Microsoft SQL Server...`.
  + Đóng cửa sổ kết nối.
- **Đăng ký tài khoản (Register)**:
  + Quay lại form AES: Username `sinhvien01`, Password nhập `MatKhauAES@2026` (hoặc mật khẩu bất kỳ >= 8 ký tự).
  + Bấm nút **Register** -> Dòng thông báo: `Register thành công: sinhvien01. Bấm Login để đăng nhập.`.
  + Bấm nút **Register** lần nữa -> Báo lỗi: `Username đã tồn tại, hãy chọn tên khác.` (bẫy trùng lặp).
- **Đăng nhập (Login)**:
  + Bấm nút **Login** -> Báo `Login thành công: sinhvien01`, ô **Ticket** sinh chuỗi ngẫu nhiên 32 ký tự Hex (phiên làm việc 128-bit).
- **Mã hóa & Giải mã AES-256 GCM**:
  + Plaintext: `Xin chào Lab 2 - Mã hóa hiện đại!`
  + Key AES: `MatKhauAES@2026`
  + Bấm **Encrypt** -> Sinh Ciphertext kèm thông báo `Đã mã hóa AES. (Đã lưu lịch sử SQL Server)`.
  + Xóa Plaintext -> Bấm **Decrypt** -> Giải mã ra đúng bản rõ.
- **Test tính năng chống sửa đổi của GCM**:
  + Sửa 1 ký tự bất kỳ trong ô Ciphertext -> Bấm **Decrypt** -> Báo lỗi ngay: `Giải mã thất bại: sai Key hoặc bản mã bị sửa...` (chứng minh tính toàn vẹn và xác thực của chế độ Galois/Counter Mode).
- Đóng cửa sổ AES.

---

### 🔹 4. BÀI 2.4: MẬT MÃ DÒNG RC4
- Trên Menu bấm nút **2.4 RC4**.
- **Test case bắt buộc theo chuẩn PDF**:
  + Plaintext: `Plaintext`
  + Key: `Key`
  + Bấm **Encrypt** -> Bản mã HEX hiển thị đúng y chang: `BBF316E8D940AF0AD3`
- Xóa Plaintext -> Bấm **Decrypt** -> Khôi phục lại đúng chữ `Plaintext`.
- Đóng cửa sổ RC4.

---

### 🔹 5. BÀI 2.5: MẬT MÃ TWOFISH (CBC)
- Trên Menu bấm nút **2.5 Twofish**.
- **Test sinh IV & Mã hóa**:
  + Bấm nút **Generate IV** -> Ô IV xuất hiện 32 ký tự HEX ngẫu nhiên (16 byte).
  + Key: `Twofish@Lab2`
  + Plaintext: `Xin chào Lab 2 - Mã hóa hiện đại!`
  + Bấm **Encrypt** -> Sinh Ciphertext.
  + Bấm **Decrypt** -> Khôi phục chính xác bản rõ ban đầu.
- **Chứng minh tính bắt buộc của IV**:
  + Bấm lại nút **Generate IV** (đổi sang IV khác) -> Bấm **Decrypt** -> Kết quả bị sai lệch / báo lỗi (chứng minh CBC bắt buộc phải có đúng IV).
- **Test lưu & đọc file khôi phục cả IV + Ciphertext**:
  + Bấm **Save File** -> Lưu `twofish_ciphertext.txt`. Mở file bằng Notepad cho thầy xem: Dòng 1 là `IV=...`, Dòng 2 là Ciphertext.
  + Đổi lung tung ô IV và Ciphertext trên form -> Bấm **Open File** chọn lại file -> Khôi phục hoàn hảo cả IV và Ciphertext -> Bấm **Decrypt** thành công!
- Đóng cửa sổ Twofish.

---

### 🔹 6. BÀI 2.6 NÂNG CAO 01: AES CHẾ ĐỘ CTR (JAVA)
- Trên Menu bấm nút **2.6 Nâng cao - AES-CTR**.
- **Test sinh khóa & nonce**:
  + Bấm **Generate Key** -> Sinh khóa ngẫu nhiên 256-bit (Base64).
  + Bấm **Generate Nonce** -> Sinh nonce ngẫu nhiên 96-bit (Base64).
- **Mã hóa & Giải mã**:
  + Plaintext: `Xin chào Lab 2 - Mã hóa hiện đại!`
  + Bấm **Encrypt** -> Sinh Ciphertext. Bản mã AES-CTR biến mã khối thành mã dòng, không cần đệm PKCS.
  + Bấm **Decrypt** -> Khôi phục chính xác.
- Đóng form.

---

### 🔹 7. BÀI 2.6 NÂNG CAO 02: AES-CBC BẰNG PYTHON (TKINTER)
- Mở Command Prompt hoặc PowerShell tại thư mục `LAB2_Python`:
- **Chạy tự kiểm thử (Self-test)**:
  ```powershell
  py aes_cbc_gui.py --self-test
  ```
  -> Dòng kết quả in ra: `SELF-TEST OK: 4 thông điệp mã hóa/giải mã đúng, sai khóa bị phát hiện.`
- **Chạy giao diện GUI**:
  ```powershell
  py aes_cbc_gui.py
  ```
  -> Cửa sổ Tkinter hiện lên:
  + Bấm **Generate Key** và **Generate IV**.
  + Nhập Plaintext -> Bấm **Encrypt** -> Bấm **Decrypt**.
  + Bấm **Save File** / **Open File** kiểm tra hoạt động bình thường.
  + Đóng cửa sổ Python.

---

### 🔹 8. XEM LỊCH SỬ THAO TÁC (SQL SERVER)
- Quay lại cửa sổ chính `frm_Menu`, bấm nút **Xem lịch sử** (hoặc mở `frm_LichSu`):
- Bảng JTable hiển thị đầy đủ các dòng lịch sử thao tác đã lưu:
  + Các thao tác: `REGISTER`, `LOGIN`, `ENCRYPT`, `DECRYPT`
  + Các thuật toán: `DES`, `TripleDES`, `AES`, `RC4`, `Twofish`, `AES-CTR`
  + User đăng nhập: `sinhvien01`
  + Độ dài chuỗi vào / ra.
- *(Tùy chọn nâng cao)*: Mở SSMS, mở file `03_SQL_SERVER\03_Kiem_Tra_Du_Lieu.sql` và bấm Execute (F5):
  + Show bảng `app_users`: User `sinhvien01`, cột `password_hash` và `salt` là nhị phân (PBKDF2), mật khẩu gốc không hề bị lộ.
  + Show bảng `crypto_history`: Đầy đủ log thao tác.

---

## 🏁 BƯỚC 3: KẾT THÚC VIDEO
- Tóm tắt: Toàn bộ các yêu cầu của Lab 2 (DES, TripleDES, AES-GCM, RC4, Twofish, AES-CTR, AES-CBC Python, Kết nối SQL Server lưu lịch sử và băm mật khẩu PBKDF2) đã hoàn thành và kiểm thử thành công 100%.
- Bấm dừng quay video.
