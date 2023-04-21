--  tao database
create database QLKHO

-- su dung database
use QLKHO
go

-- tao bang ton
create table Ton(
	MaVT varchar(10) not null primary key,
	TenVT nvarchar(50) not null,
	SoLuongT int
)

-- tao bang Nhap
create table Nhap(
	SoHDN varchar(10) not null,
	MaVT varchar(10) not null,
	SoLuongN int,
	DonGiaN decimal(10, 2),
	NgayN Datetime,
	constraint PK_N_T primary key(SoHDN, MaVT),
	constraint FK_N_T foreign key(MaVT)
	references Ton(MaVT)
)

-- tao bang xuat
create table Xuat(
	SoHDX varchar(10) not null,
	MaVT varchar(10) not null,
	SoLuongX int,
	DonGiaX decimal(10, 2),
	NgayX Datetime,
	constraint PK_X_T primary key(SoHDX, MaVT),
	constraint FK_X_T foreign key(MaVT)
	references Ton(MaVT)
)


select * from Ton
select * from Nhap
select * from Xuat
go

-- Câu 2: Thống kê tiền bán theo mã vật tư gồm MaVT, TenVT, TienBan
create view TienBanVatTu
as
select Ton.MaVT, TenVT, Sum(SoLuongX * DonGiaX) as N'Tiền Bán'
from Xuat inner join Ton
on Xuat.MaVT = Ton.MaVT
group by Ton.MaVT, TenVT
go

select * from TienBanVatTu
go

-- Câu 3: Thống kê soluongxuat theo tên vattu
create view SoLuongXuat
as
select TenVT, sum(SoLuongX * DonGiaX) as N'Tổng SLX'
from Xuat inner join Ton
on Xuat.MaVT = Ton.MaVT
group by Ton.MaVT, TenVT
go

select * from SoLuongXuat
go

-- Câu 4: Thống kê soluongnhap theo tên vật tư
create view SoLuongNhap
as
select TenVT, sum(SoLuongN * DonGiaN) as N'Tổng SLN'
from Nhap inner join Ton
on Nhap.MaVT = Ton.MaVT
group by Ton.MaVT, TenVT
go

select * from SoLuongNhap
go

-- Câu 5: 
create view TonKho
as
select Ton.MaVT, TenVT, sum(SoLuongN) - sum(SoLuongX) + sum(SoLuongT) as N'Tồn kho còn'
from Nhap inner join Ton
		on Nhap.MaVT = Ton.MaVT
	inner join XUat
		on Xuat.MaVT = Ton.MaVT
group by Ton.MaVT, TenVT
go

select * from TonKho
go