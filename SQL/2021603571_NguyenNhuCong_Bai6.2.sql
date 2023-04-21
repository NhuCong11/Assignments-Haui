use master
go
create database QLBanHang

go 
use QLBanHang
go
create table HangSX (
    maHangSX nchar(10) not null primary key,
    tenHang nvarchar(30) not null,
    diaChi nvarchar(50),
    soDT nvarchar(20),
    email nvarchar(30)
);

create table SanPham (
    maSP nchar(10) not null primary key,
    maHangSX nchar(10) not null,
    tenSP nvarchar(30) not null,
    soLuong int,
    mauSac nvarchar(20),
	giaBan money,
	donViTinh nchar(10),
	moTa nvarchar(max),
	constraint FK_SP_MaHangSX foreign key(maHangSX)
	references HangSX(maHangSX)
);

create table NhanVien(
	MaNV nchar(10) not null primary key,
	TenNV nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDT nvarchar(20),
	Email nvarchar(30),
	TenPhong nvarchar(30)
);

create table PNhap(
	SoHDN nchar(10) not null primary key,
	NgayNhap Date,
	MaNV nchar(10),
	constraint FK_MaNV_PNhap foreign key (MaNV)
	references NhanVien(MaNV)
);

create table Nhap(
	SoHDN nchar(10) not null,
	MaSP nchar(10) not null,
	SoLuongN int,
	DonGiaN money,
	constraint PK_SoHDN_MaSP primary key(SoHDN, MaSP),
	constraint FK_Nhap_SoHDN foreign key(SoHDN)
	references PNhap(SoHDN),
	constraint FK_Nhap_MaSP foreign key(MaSP)
	references SanPham(MaSP)
);

create table PXuat(
	SoHDX nchar(10) not null primary key,
	NgayXuat date,
	MaNV nchar(10) not null,
	constraint FK_PXuat_MaNV foreign key(MaNV)
	references NhanVien(MaNV)
);

create table Xuat(
	SoHDX nchar(10) not null,
	maSP nchar(10) not null,
	SoLuongX int,
	constraint PK_SoHDX_MaSP primary key(SoHDX, maSP),
	constraint FK_Xuat_SoHDX foreign key(SoHDX)
	references PXuat(SoHDX),
	constraint FK_Xuat_MaSP foreign key(maSP)
	references SanPham(maSP)
);

-- Nhap du lieu:
insert into HangSX values
	('H01', 'Samsung', N'Korea', '011-08271717', 'ss@gmail.com.kr'),
	('H02', 'OPPO', N'China', '081-08626262', 'oppo@gmail.com.cn'),
	('H03', 'Vinfone', N'Việt nam', '084-098262626', 'vf@gmail.com.vn');

insert into SanPham values
	('SP01', 'H02', 'F1 Plus', 100, N'Xám', 7000000, N'Chiếc', N'Hàng cận cao cấp'),
	('SP02', 'H01', 'Galaxy Note11', 50, N'Đỏ', 19000000, N'Chiếc', N'Hàng cao cấp'),
	('SP03', 'H02', 'F3 lite', 200, N'Nâu', 3000000, N'Chiếc', N'Hàng phổ thông'),
	('SP04', 'H03', 'Vjoy3', 200, N'Xám', 1500000, N'Chiếc', N'Hàng phổ thông'),
	('SP05', 'H01', 'Galaxy V21', 500, N'Nâu', 8000000, N'Chiếc', N'Hàng cận cao cấp');

insert into NhanVien values
	('NV01', N'Nguyễn Thị Thu', N'Nữ', N'Hà Nội', '0982626521', 'thu@gmail.com', N'Kế toán'),
	('NV02',N'Lê Văn Nam',N'Nam',N'Bắc Ninh','0972525252','nam@gmail.com',N'Vật tư'),
	('NV03',N'Trần Hòa Bình',N'Nữ',N'Hà Nội','0328388388','hb@gmail.com',N'Kế toán');

insert into PNhap values
	('N01', '2019-2-5', 'NV01'),
	('N02', '2020-4-7', 'NV02'),
	('N03', '2019-5-17', 'NV02'),
	('N04', '2019-3-22', 'NV03'),
	('N05', '2019-7-7', 'NV01');

insert into Nhap values
	('N01', 'SP02', 10, 17000000),
	('N02', 'SP01', 30,  6000000),
	('N03', 'SP04', 20, 1200000),
	('N04', 'SP01', 10, 6200000),
	('N05', 'SP05', 20, 7000000);

insert into PXuat values
	('X01', '2020-6-14', 'NV02'),
	('X02', '2019-3-5', 'NV03'),
	('X03', '2019-12-12', 'NV01'),
	('X04', '2019-6-2', 'NV02'),
	('X05', '2019-5-18', 'NV01');

insert into Xuat values
	('X01', 'SP03', 5),
	('X02', 'SP01', 3),
	('X03', 'SP02', 1),
	('X04', 'SP03', 2),
	('X05', 'SP05', 1);

-- Tạo view:
-- a:
create view SamSung_2020_Nhap
as
select Nhap.SoHDN, Nhap.maSP, SanPham.tenSP, Nhap.SoLuongN, Nhap.DonGiaN, PNhap.NgayNhap, NhanVien.tenNV, NhanVien.tenPhong
from Nhap
join SanPham on SanPham.maSP = Nhap.maSP
join HangSX on HangSX.maHangSX = SanPham.maHangSX
join PNhap on PNhap.SoHDN = Nhap.SoHDN
join NhanVien on NhanVien.maNV = PNhap.maNV
where year(PNhap.NgayNhap) = 2020 and HangSX.tenHang = 'SamSung';

select * from SamSung_2020_Nhap;

-- b:
create view SamSung_SP_100_500
as 
select maSP, tenSP, soLuong, mauSac, giaBan, donViTinh, moTa
from SanPham
join HangSX on HangSX.maHangSX = SanPham.maHangSX
where tenHang = 'SamSung'
and giaBan between 100000 and 500000;

select * from SamSung_SP_100_500;

-- c:
create view SamSung_TongTienNhap_2020
as 
select sum(Nhap.SoLuongN * Nhap.DonGiaN) as 'Tong tien nhap'
from Nhap
join PNhap on PNhap.SoHDN = Nhap.SoHDN
join SanPham on SanPham.maSP = Nhap.maSP
join HangSX on HangSX.maHangSX = SanPham.maHangSX
where year(PNhap.NgayNhap) = 2020 and HangSX.tenHang = 'SamSung';

select * from SamSung_TongTienNhap_2020;

-- d:
create view Xuat_14_06_2020_TongTien
as 
select sum(SoLuongX*giaBan) as 'Tong tien xuat'
from Xuat
join PXuat on PXuat.SoHDX = Xuat.SoHDX
join SanPham on SanPham.maSP = Xuat.maSP
where PXuat.NgayXuat = '2020-06-14';

select * from Xuat_14_06_2020_TongTien;

-- e:
create view Max_TienNhap
as 
select top 1 Nhap.SoHDN, PNhap.NgayNhap
from Nhap
join PNhap on PNhap.SoHDN = Nhap.SoHDN
where year(PNhap.NgayNhap) = 2020
order by Nhap.SoLuongN * Nhap.DonGiaN desc;

select * from Max_TienNhap;

-- f:
create view SL_LoaiSP_HangSX
as 
select HangSX.maHangSX, HangSX.tenHang, count(maSP) as 'So loai san pham'
from HangSX
join SanPham on SanPham.maHangSX = HangSX.maHangSX
group by HangSX.maHangSX, HangSX.tenHang;

select * from SL_LoaiSP_HangSX;

-- g:
create view Nhap_TongTienMoiLoai_2020
as 
select SanPham.maSP, SanPham.tenSP, sum(Nhap.SoLuongN * Nhap.DonGiaN) as 'Tong tien nhap'
from SanPham
join Nhap on Nhap.maSP = SanPham.maSP
join PNhap on PNhap.SoHDN = Nhap.SoHDN
where year(PNhap.NgayNhap) = 2020
group by SanPham.maSP, SanPham.tenSP;

select * from Nhap_TongTienMoiLoai_2020

-- h:
create view TongSoLuoongXuat_2020_LH10000_SamSung
as 
select SanPham.maSP, SanPham.tenSP, sum(Xuat.SoLuongX) as 'Tong so luong xuat'
from SanPham
join Xuat on Xuat.maSP = SanPham.maSP
join PXuat on PXuat.SoHDX = Xuat.SoHDX
join HangSX on SanPham.maHangSX = HangSX.maHangSX
where HangSX.tenHang = 'SamSung' and year(PXuat.NgayXuat) = 2020
group by SanPham.maSP, SanPham.tenSP
having sum(Xuat.SoLuongX) > 10000;

select * from TongSoLuoongXuat_2020_LH10000_SamSung;

-- i:
create view SLNVNam
as 
select NhanVien.TenPhong, count(NhanVien.MaNV) as 'So luong NV nam'
from NhanVien
where NhanVien.GioiTinh = N'Nam'
group by NhanVien.TenPhong;

select * from SLNVNam;

-- j:
create view SLNhapMoiHang_2018
as 
select HangSX.maHangSX, HangSX.tenHang, sum(Nhap.SoLuongN) as 'Tong so luong nhap'
from HangSX
join SanPham on HangSX.maHangSX = SanPham.maHangSX
join Nhap on Nhap.maSP = SanPham.maSP
join PNhap on PNhap.SoHDN = Nhap.SoHDN
where year(PNhap.NgayNhap) = 2018
group by HangSX.maHangSX, HangSX.tenHang;

select * from SLNhapMoiHang_2018;

-- k:
create view TongTienXuatMoiNV_2018
as 
select NhanVien.MaNV, NhanVien.TenNV, sum(Xuat.SoLuongX * SanPham.giaBan) as 'Tong so tien xuat'
from NhanVien
join PXuat on PXuat.MaNV = NhanVien.MaNV
join Xuat on Xuat.SoHDX = PXuat.SoHDX
join SanPham on SanPham.maSP = Xuat.maSP
where year(PXuat.NgayXuat) = 2018
group by NhanVien.MaNV, NhanVien.TenNV;

select * from TongTienXuatMoiNV_2018;