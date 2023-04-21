use master
go
create database QLBanHang

go 
use QLBanHang
go
create table HangSX (
    MaHangSX nchar(10) not null primary key,
    TenHang nvarchar(30) not null,
    DiaChi nvarchar(50),
    SoDT nvarchar(20),
    Email nvarchar(30)
);

create table SanPham (
    MaSP nchar(10) not null primary key,
    MaHangSX nchar(10) not null,
    TenSP nvarchar(30) not null,
    SoLuong int,
    MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max),
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
	MaSP nchar(10) not null,
	SoLuongX int,
	constraint PK_SoHDX_MaSP primary key(SoHDX, maSP),
	constraint FK_Xuat_SoHDX foreign key(SoHDX)
	references PXuat(SoHDX),
	constraint FK_Xuat_MaSP foreign key(MaSP)
	references SanPham(MaSP)
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

-- a:
go 
create function fn_DSHSX(@diachi nvarchar(50))
returns @bang table (
	MaHangSX nchar(10) not null primary key,
    TenHang nvarchar(30) not null,
    DiaChi nvarchar(50),
    SoDT nvarchar(20),
    Email nvarchar(30))
as 
begin 
   insert into @bang 
   select MaHangSX, TenHang, DiaChi, SoDT, Email 
   from HangSX
   where DiaChi like '%' + @diachi + '%'
   return
end;

go 
select * from fn_DSHSX(N'Việt Nam');

-- b:
go 
create function fn_DSSPHSX(@nam1 int, @nam2 int)
returns @bang table (
	TenSP nvarchar(30),
	TenHang nvarchar(30)
)
as 
begin
   insert into @bang
   select SanPham.TenSP, HangSX.TenHang
   from SanPham
   join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
   join Xuat on Xuat.MaSP = SanPham.MaSP
   join PXuat on PXuat.SoHDX = Xuat.SoHDX
   where year(PXuat.NgayXuat) between @nam1 and @nam2
   return
end;

go 
select * from fn_DSSPHSX(2018, 2020)

-- c:
go
create function fn_DSSPLC(@mahang nchar(10), @lc int)
returns @bang table (
	MaSP nchar(10),
    TenSP nvarchar(30),
	MaHangSX nchar(10),
	TenHang nvarchar(30),
    SoLuong int,
    MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max))
as
begin
   if(@lc = 1)
      insert into @bang 
      select  SanPham.MaSP, TenSP, SanPham.MaHangSX, TenHang, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
      from SanPham
      join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
      join Xuat on Xuat.MaSP = SanPham.MaSP
	  where SanPham.MaHangSX = @mahang
	if(@lc = 0)
	  insert into @bang 
      select  SanPham.MaSP, TenSP, SanPham.MaHangSX, TenHang, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
      from SanPham
      join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
      join Nhap on Nhap.MaSP = SanPham.MaSP
	  where SanPham.MaHangSX = @mahang
	return 
end;

go 
select *from fn_DSSPLC('H01', 0);

-- d:
go 
create function fn_DSNVNhap(@ngay date) 
returns @bang table (
	MaNV nchar(10),
	TenNV nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDT nvarchar(20),
	Email nvarchar(30),
	TenPhong nvarchar(30)
)

as
begin 
   insert into @bang 
   select NhanVien.MaNV, TenNV, GioiTinh, DiaChi, SoDT, Email, TenPhong
   from NhanVien
   join PNhap on PNhap.MaNV = NhanVien.MaNV
   where PNhap.NgayNhap = @ngay
   return 
end;

go 
select * from fn_DSNVNhap('2019-3-22');

-- e:
go 
create function fn_DSSPGiaBan(@x money, @y money, @z nvarchar(30))
returns @bang table (
	MaSP nchar(10),
    TenSP nvarchar(30),
	MaHangSX nchar(10),
	TenHang nvarchar(30),
    SoLuong int,
    MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max))
as 
begin
   insert into @bang 
   select  SanPham.MaSP, TenSP, SanPham.MaHangSX, TenHang, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
   from SanPham
   join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
   where SanPham.GiaBan between @x and @y
   and HangSX.TenHang = @z
   return   
end;

go 
select * from fn_DSSPGiaBan(1000000, 10000000, 'OPPO');

-- f:
go 
create function fn_DSSPKThamBien()
returns table 
as
return
   select  SanPham.MaSP, TenSP, SanPham.MaHangSX, TenHang, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
   from SanPham
   join HangSX on SanPham.MaHangSX = HangSX.MaHangSX;

go 
select * from fn_DSSPKThamBien();