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
create proc SP_NhapXuat(@soHDX nchar(10), @maSP nchar(10), @maNV nchar(10), @ngayXuat date, @soLuongX int)
as 
begin 
    if(not exists(select * from SanPham where MaSP = @maSP) or 
       not exists(select * from Xuat where MaSP = @maSP and @soLuongX <= SoLuongX) or 
	   not exists(select * from NhanVien where MaNV = @maNV))
        print N'Lỗi nhập dữ liệu!';
    else
    if(exists(select * from Xuat where SoHDX = @soHDX))
        begin 
	        update Xuat 
		    set MaSP = @maSP, SoLuongX = @soLuongX
		    where SoHDX = @soHDX;
		    print N'Đã cập nhật lại bảng Xuat!';
	    end
	else
	    begin 
	        insert into Xuat values(@soHDX,@maNV,@soLuongX);
		    print N'Đã thêm mới vào bảng Xuat!';
	    end
end;

go 
exec SP_NhapXuat 'X02', 'SP01', 'NV02', '2023-5-18', 1;
select * from Xuat;

--b:
go 
create proc SP_XoaNV(@maNV nchar(10))
as 
begin
    if(not exists(select * from NhanVien where MaNV = @maNV))
        print N'Không tồn tại nhân viên!';
    else 
        begin
	        delete from Nhap where SoHDN in (select SoHDN from PNhap where MaNV = @maNV);
	        delete from Xuat where SoHDX in (select SoHDX from PXuat where MaNV = @maNV);
		    delete from PNhap where MaNV = @maNV;
		    delete from PXuat where MaNV = @maNV;
		    delete from NhanVien where MaNV = @maNV;
		    print N'Đã xóa nhân viên!';
	    end
end;

go 
exec SP_XoaNV 'NV01';
select * from NhanVien;

--c:
go 
create proc SP_XoaSP(@maSP nchar(10)) 
as
begin
    if(not exists(select * from SanPham where MaSP = @maSP))
	   print N'Sản phẩm không tồn tại!';
	else 
	   begin 
	        delete from PNhap where SoHDN in (select SoHDN from Nhap where MaSP = @maSP);
	        delete from PXuat where SoHDX in (select SoHDX from Xuat where MaSP = @maSP);
	        delete from Nhap where MaSP = @maSP;
		    delete from Xuat where MaSP = @maSP;
		    delete from SanPham where MaSP = @maSP;
		    print N'Đã xóa sản phẩm!';
	    end
end; 

go 
exec SP_XoaSP 'SP01';
select * from SanPham;