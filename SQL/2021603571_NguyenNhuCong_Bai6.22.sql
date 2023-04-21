use master
go 
create database QLKHO

go 
use QLKHO
go

-- tao bang ton
create table Ton(
	MaVT varchar(10) not null primary key,
	TenVT nvarchar(50) not null,
	SoLuongT int
);

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
);

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
);

-- Thêm dữ liệu:
INSERT INTO Ton VALUES
('VT001', 'Vật tư 1', 7),
('VT002', 'Vật tư 2', 3),
('VT003', 'Vật tư 3', 8),
('VT004', 'Vật tư 4', 10),
('VT005', 'Vật tư 5', 5);

INSERT INTO Nhap VALUES
('HD1', 'VT001', 10, 10000, '2022-01-01'),
('HD2', 'VT002', 5, 20000, '2022-01-02'),
('HD3', 'VT003', 8, 15000, '2022-01-03');

INSERT INTO Xuat VALUES
('HD1', 'VT001', 3, 12000, '2022-01-05'),
('HD2', 'VT002', 2, 22000, '2022-01-04'),
('HD3', 'VT003', 2, 10000, '2022-01-03');

-- câu 2:
select top 1 MaVT, TenVT, SoLuongT
from Ton 
order by SoLuongT desc;

-- câu 3:
select Ton.MaVT, TenVT, sum(SoLuongX) as 'Tong so luong xuat'
from Ton
join Xuat on Xuat.MaVT = Ton.MaVT
group by Ton.MaVT, TenVT
having sum(SoLuongX) > 100;

-- câu 4:
go 
create view TongSLXuat_Nam_Thang
as 
select month(NgayX) as 'Thang xuat', year(NgayX) as 'Nam xuat', sum(SoLuongX) as 'Tong SL xuat'
from Xuat
group by month(NgayX), year(NgayX);

go 
select * from TongSLXuat_Nam_Thang;

-- câu 5:
go 
create view DSVT
as 
select Ton.MaVT, TenVT, SoLuongN, SoLuongX, DonGiaN, DonGiaX, NgayN, NgayX
from Ton
join Nhap on Nhap.MaVT = Ton.MaVT
join Xuat on Xuat.MaVT = Ton.MaVT;

go 
select * from DSVT;

-- câu 6:
go 
create view TTVatTuCon
as 
select Ton.MaVT, TenVT, (SoLuongN - SoLuongX + SoLuongT) as 'Tong SL con'
from Ton
join Nhap on Nhap.MaVT = Ton.MaVT
join Xuat on Xuat.MaVT = Ton.MaVT
where year(NgayN) = year(NgayX) and year(NgayN) = 2015;

go 
select * from TTVatTuCon;