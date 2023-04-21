use master
go
create database QLBanHang;

go
use QLBanHang
go
CREATE TABLE HangSX(
	MaHangSX nchar(10) not null primary key,
	TenHang nvarchar(20) not null,
	DiaChi nvarchar(30) not null,
	SoDT nvarchar(20) not null,
	Email nvarchar(30)
)

create table SanPham (
    maSP nchar(10) not null primary key,
	MaHangSX nchar(10) not null,
	tenSP nvarchar(20) not null,
	soLuong int,
	mauSac nvarchar(20),
	giaBan money,
	donViTinh nvarchar(10),
	moTa nvarchar(20),
	constraint FK_HangSX_SP foreign key(MaHangSX)
	references HangSX(MaHangSX)
)

create table NhanVien(
    maNV nchar(10) not null primary key,
	tenNV nvarchar(20) not null,
	gioiTinh nvarchar(10) not null,
	diaChi nvarchar(30),
	soDT nvarchar(20),
	email nvarchar(30),
	tenPhong nvarchar(30)
)

create table Nhap (
    soHDN nchar(10) not null,
	maSP nchar(10) not null,
	soLuongN int,
	donGiaN money,
	constraint PK_Nhap primary key(soHDN,maSP),
	constraint FK_Nhap_SP foreign key(maSP)
	references SanPham(maSP)
)

create table PNhap(
    soHDN nchar(10) not null primary key,
	ngayNhap date,
	maNV nchar(10) not null,
	constraint FK_PNhap_NV foreign key(maNV)
	references NhanVien(maNV)
)

create table Xuat (
    soHDX nchar(10) not null,
	maSP nchar(10) not null,
	soLuongX int,
	constraint FK_Xuat_SP foreign key(maSP)
	references SanPham(maSP)
)

create table PXuat (
    soHDX nchar(10) not null,
	ngayXuat date,
	maNV nchar(10) not null,
	constraint FK_PXuat_NV foreign key(maNV)
	references NhanVien(maNV)
)

INSERT INTO HangSX VALUES
	('H01', 'SamSung', N'Korea', '011-08271717', 'ss@gmail.com.kr'),
	('H02', 'OPPO', N'China', '081-08626262', 'oppo@gmail.com.cn'),
	('H03', 'Vinfone', N'Việt Nam', '084-098262626', 'vf@gmail.com.vn')

INSERT INTO NhanVien VALUES
	('NV01', N'Nguyễn Thị Thu', N'Nữ', 'Hà Nội','0982626521', 'thu@gmail.com', N'Kế toán'),
	('NV02', N'Lê Văn Nam', N'Nam', 'Bắc Ninh','0972525252', 'nam@gmail.com', N'Vật tư'),
	('NV03', N'Trần Hòa Bình', N'Nữ', 'Hà Nội','0972525252', 'hb@gmail.com', N'Kế toán')

INSERT INTO SanPham VALUES
	('SP01', 'H02', 'F1 Plus', 100, 'Xám', 7000000, N'Chiếc', N'Hàng cận cao cấp'),
	('SP02', 'H01', 'Galaxy Note11', 50, 'Đỏ', 19000000, N'Chiếc', N'Hàng cao cấp'),
	('SP03', 'H02', 'F3 lite', 200, 'Nâu', 3000000, N'Chiếc', N'Hàng phổ thông'),
	('SP04', 'H03', 'Vjoy3', 200, 'Xám', 1500000, N'Chiếc', N'Hàng phổ thông'),
	('SP05', 'H01', 'Galaxy V21', 500, 'Nâu', 8000000, N'Chiếc', N'Hàng cận cao cấp')

INSERT INTO PNhap VALUES
	('N01', '2/5/2019', 'NV01'),
	('N02', '4/7/2020', 'NV03'),
	('N03', '5/17/2020', 'NV03'),
	('N04', '3/22/2020', 'NV03'),
	('N05', '7/7/2020', 'NV01')

INSERT INTO Nhap VALUES
	('N01', 'SP02', 10, 17000000),
	('N02', 'SP01', 30, 6000000),
	('N03', 'SP04', 20, 1200000),
	('N04', 'SP01', 10, 6200000),
	('N05', 'SP05', 20, 7000000)

INSERT INTO PXuat VALUES
	('X01', '6/14/2020', 'NV02'),
	('X02', '3/5/2019', 'NV03'),
	('X03', '12/12/2020', 'NV01'),
	('X04', '6/2/2020', 'NV02'),
	('X05', '5/18/2020', 'NV01')

INSERT INTO Xuat VALUES
	('X01', 'SP03', 5),
	('X02', 'SP02', 3),
	('X03', 'SP02', 1),
	('X04', 'SP03', 2),
	('X05', 'SP05', 1)

/* --- a: */
select  PNhap.maNV, tenNV, sum(soLuongN*donGiaN) as 'Tong tien nhap'
from PNhap
join Nhap on Nhap.soHDN = PNhap.soHDN
join NhanVien on NhanVien.maNV = PNhap.maNV
where month(ngayNhap) = 8 and year(ngayNhap) = 2018
group by PNhap.maNV, tenNV
having sum(soLuongN*donGiaN) > 100000;

-- b:
select SanPham.maSP, tenSP
from SanPham
join Nhap on Nhap.maSP = SanPham.maSP
where SanPham.maSP not in (select maSP from Xuat);

-- c:
select SanPham.maSP, tenSP
from SanPham
join Nhap on Nhap.maSP = SanPham.maSP
intersect
select SanPham.maSP, tenSP
from SanPham
join Xuat on Xuat.maSP = SanPham.maSP;

-- d:
select NhanVien.maNV, tenNV
from NhanVien
join PNhap on PNhap.maNV = NhanVien.maNV
intersect 
select NhanVien.maNV, tenNV
from NhanVien
join PXuat on PXuat.maNV = NhanVien.maNV;

-- e:
select NhanVien.maNV, tenNV
from NhanVien
except 
(select NhanVien.maNV, tenNV
from NhanVien
join PNhap on PNhap.maNV = NhanVien.maNV
intersect 
select NhanVien.maNV, tenNV
from NhanVien
join PXuat on PXuat.maNV = NhanVien.maNV);