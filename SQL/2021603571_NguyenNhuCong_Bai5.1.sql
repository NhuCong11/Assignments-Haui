use master
go
create database TRUONGHOC

drop database TRUONGHOC

go 
use TRUONGHOC
go 
-- a:
create table HOCSINH (
    maHS char(5) not null primary key,
    tenHS nvarchar(30) not null,
    Nam bit,
    ngaySinh datetime,
    diaChi varchar(20),
    diemTB float
);

-- thêm dữ liệu
insert into HOCSINH values('HS001', N'Nguyễn Như Công', 1, '2003-11-11', 'Hà Nội', 8.5);

-- sửa dữ liệu
update HOCSINH
set tenHS = N'Lê Thị Diệu Ly', ngaySinh = '2003-10-18'
where maHS = 'HS001';

-- cập nhật dữ liệu
update HOCSINH
set diemTB = 9.5
where maHS = 'HS001';

-- b:
create table GIAOVIEN (
    maGV char(5) not null primary key,
    tenGV nvarchar(30) not null,
    Nam bit,
    ngaySinh datetime,
    diaChi nvarchar(20),
    Luong money
);

-- thêm dữ liệu
insert into GIAOVIEN values('GV001', N'Nguyễn Thị KIm Tuyến', 0, '1980-03-03', 'Tân Hội', 10000000);

-- sủa sữ liệu
update GIAOVIEN
set tenGV = N'Tạ Thị Bích Ngọc', ngaySinh = '1998-12-03'
where maGV = 'GV001';

-- cập nhật dữ liệu
update GIAOVIEN
set Luong = 20000000
where maGV = 'GV001';

-- c:
create table LOPHOC (
    maLop char(5) not null primary key,
    tenLop nvarchar(30) not null,
    soLuong int
)

-- thêm dữ liệu
insert into LOPHOC values('LH001', N'Kỹ thuật phần mềm', 80);

-- sửa dữ liệu
update LOPHOC
set tenLop = N'Ngôn ngữ trung quốc', soLuong = 60
where maLop = 'LH001';

-- cập nhật dữ liệu
update LOPHOC
set soLuong = 85
where maLop = 'LH001';