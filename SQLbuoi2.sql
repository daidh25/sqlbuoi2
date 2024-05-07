
CREATE DATABASE QuanLySach

CREATE TABLE TacGia
(
    IDTacGia NVARCHAR(250) PRIMARY KEY NOT NULL,
    TenTacGia NVARCHAR(250) NOT NULL,
    QuocGia NVARCHAR(250) NOT NULL
);
CREATE TABLE Sach
(
    IDSach NVARCHAR(250) PRIMARY KEY NOT NULL,
    TenSach NVARCHAR(250) NOT NULL,
    IDTacGia NVARCHAR(250) NOT NULL,
    DanhMuc NVARCHAR(250) NOT NULL,
    GiaBan INT NOT NULL,
    SoLuongTon INT NOT NULL,
    FOREIGN KEY (IDTacGia) REFERENCES TacGia(IDTacGia)
);

CREATE TABLE DonDatHang 
(	
    IDDonHang NVARCHAR(250) PRIMARY KEY NOT NULL,
	NgayDat DATETIME,
	TenKhachHang NVARCHAR(250) NOT NULL,
	DiaChi NVARCHAR(250) NOT NULL,
	TongTien INT NOT NULL
);
CREATE TABLE ChiTietDonHang
(   
    IDDonHang NVARCHAR(250),
    IDSach NVARCHAR(250),
    SoLuong INT,
    GiaBan INT,
    PRIMARY KEY (IDDonHang, IDSach),
    FOREIGN KEY (IDDonHang) REFERENCES DonDatHang(IDDonHang),
    FOREIGN KEY (IDSach) REFERENCES Sach(IDSach)
);
INSERT INTO TacGia (IDTacGia, TenTacGia, QuocGia)
VALUES
('TG1', 'Đinh Bá Nghiễn', 'Việt Nam'),
('TG2', 'Đinh Văn Nam', 'Việt Nam'),
('TG3', 'Lê Minh Chiến', 'Việt Nam'),
('TG4', 'Nguyễn Tuấn Tú', 'Việt Nam');
INSERT INTO Sach (IDSach, TenSach, IDTacGia, DanhMuc, GiaBan, SoLuongTon)
VALUES
('S01', 'Cơ sở dữ liệu', 'TG1', 'Khoa học', 120000, 35),
('S02', 'Lập trình Java', 'TG2', 'Khoa học', 50000, 12),
('S03', 'Pháp luật đại cương', 'TG3', 'Pháp luật', 80000, 20),
('S04', 'Kinh tế vĩ mô', 'TG4', 'Kinh Tế', 140000, 15),
('S05', 'Xác xuất thống kê', 'TG3', 'Toán học', 120000, 5);
INSERT INTO DonDatHang (IDDonHang, NgayDat, TenKhachHang, DiaChi, TongTien)
VALUES
('DH001', '2024-05-05', 'Nguyen Van Cuong', 'Ha Noi', 150000),
('DH002', '2024-05-04', 'Tran Thi Mai', 'Ho Chi Minh', 200000);
INSERT INTO ChiTietDonHang (IDDonHang, IDSach, SoLuong, GiaBan)
VALUES 
('DH001', 'S01', 2, 100000),
('DH001', 'S02', 1, 80000),
('DH002', 'S03', 1, 120000);

SELECT * FROM TacGia;

SELECT * FROM Sach;

SELECT * FROM DonDatHang;

SELECT * FROM ChiTietDonHang;
