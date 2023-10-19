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

insert into PXuat values
	('X01', '2020-6-14', 'NV02'),
	('X02', '2019-3-5', 'NV03'),
	('X03', '2019-12-12', 'NV01'),
	('X04', '2019-6-2', 'NV02'),
	('X05', '2019-5-18', 'NV01');

-- a:
go 
create trigger trg_XuatUpdate on Xuat after update 
as 
begin 
    declare @maSP nchar(10);
	declare @soLuongCu int;
	declare @soLuongMoi int;
	declare @count int;
	declare @soLuong int;

    select @maSP = MaSP from inserted;
	select @soLuongCu = SoLuongX from deleted;
	select @soLuongMoi = SoLuongX from inserted;
	select @count = count(*) from inserted;
    select @soLuong = SoLuong from SanPham where MaSP = @maSP;

	if((@soLuongMoi - @soLuongCu) > @soLuong)
	    begin 
		    raiserror(N'Số lượng thay đổi đang lớn hơn số lượng hiện có!', 16, 1);
            rollback transaction;
			return;
		end
	else
	    if(@count > 1) 
	        begin 
		        raiserror(N'Không thể thay đổi nhiều hơn 1 bản ghi!', 16, 1);
			    rollback transaction;
			    return;
		    end
	    else 
	        update SanPham 
			set SoLuong = SoLuong - @soLuongMoi + @soLuongCu
			where MaSP = @maSP;
end;

update Xuat 
set SoLuongX = 20
where MaSP = 'SP01';

select * from SanPham;
select * from Xuat;
-- b:
go
create trigger trg_NhapInsert on Nhap after insert 
as 
begin 
    declare @maSP nchar(10);
    declare @soLuongN int;
    declare @donGia money;
    select @maSP = MaSP, @soLuongN = SoLuongN, @donGia = DonGiaN from inserted;
    if(not exists(select * from SanPham where @maSP = MaSP))
        begin 
	        raiserror(N'Không tồn tại mã SP!', 16, 1);
			return;
	    end
	else 
	    if(@soLuongN < 0 or @donGia < 0)
		    begin 
			    raiserror(N'Dữ liệu không hợp lệ!', 16, 1);
                rollback transaction;
			    return;
			end
		else 
		    update SanPham 
			set SoLuong = SoLuong + @soLuongN
			where @maSP = MaSP;
end;

insert into Nhap values('N02', 'SP02', 10, 17000000);

select * from SanPham;
select * from Nhap;

-- c:
go 
create trigger trg_XuatInsert on Xuat after insert 
as 
begin 
    declare @maSP nchar(10);
	declare @soLuongX int;
	declare @soLuong int;

	select @maSP = MaSP, @soLuongX = SoLuongX from inserted;
	select @soLuong = SoLuong from SanPham where MaSP = @maSP;
    
	if(not exists(select * from SanPham where @maSP = MaSP))
        begin 
	        raiserror(N'Không tồn tại mã SP!', 16, 1);
			return;
	    end
	else
	    if(@soLuongX > @soLuong) 
	        begin 
		        raiserror(N'Số lượng xuất không thỏa mãn!', 16, 1);
			    rollback transaction;
			    return;
		    end
	    else 
	        update SanPham 
			set SoLuong = SoLuong - @soLuongX
			where @maSP = MaSP;
end;

insert into Xuat values('X03', 'SP02', 10);

select * from SanPham;
select * from Xuat;

-- d:
go 
create trigger trg_XuatDelete on Xuat after delete 
as 
begin 
    declare @maSP nchar(10);
	declare @soLuongX int;

    select @maSP = MaSP, @soLuongX = SoLuongX from deleted;

	if(not exists(select * from SanPham where MaSP = @maSP))
	    begin 
		    raiserror(N'Không tồn tại mã sản phẩm!', 16, 1);
			rollback transaction;
			return;
		end
	else 
	    begin 
		    update SanPham 
		    set SoLuong = SoLuong + @soLuongX
			where MaSP = @maSP;
		end
end;

delete from Xuat where SoHDX = 'X03';

select * from SanPham;
select * from Xuat;

-- e:
go 
create trigger trg_NhapUpdate on Nhap after update 
as 
begin 
    declare @maSP nchar(10);
	declare @soLuongCu int;
	declare @soLuongMoi int;
	declare @count int;

    select @maSP = MaSP from inserted;
	select @soLuongCu = SoLuongN from deleted;
	select @soLuongMoi = SoLuongN from inserted;
	select @count = count(*) from inserted;

	if(@count > 1) 
	    begin 
		    raiserror(N'Không thể thay đổi nhiều hơn 1 bản ghi!', 16, 1);
			rollback transaction;
			return;
		end
	else 
	    update SanPham 
		set SoLuong = SoLuong + @soLuongMoi - @soLuongCu
		where MaSP = @maSP;
end;

update Nhap 
set SoLuongN = 20
where SoHDN = 'N02';
select * from SanPham;
select * from Nhap;

-- f:
go 
create trigger trg_NhapDelete on Nhap after delete 
as 
begin 
    declare @maSP nchar(10);
	declare @soLuongN int;

    select @maSP = MaSP, @soLuongN = SoLuongN from deleted;

	if(not exists(select * from SanPham where MaSP = @maSP))
	    begin 
		    raiserror(N'Không tồn tại mã sản phẩm!', 16, 1);
			rollback transaction;
			return;
		end
	else 
	    begin 
		    update SanPham 
		    set SoLuong = SoLuong - @soLuongN
			where MaSP = @maSP;
		end
end;

delete from Nhap where SoHDN = 'N02';
select * from SanPham;
select * from Nhap;