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
	constraint F K_SP_MaHangSX foreign key(maHangSX)
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

-- Bài 1:
-- a:
go 
create proc SP_NhapSanPham(@maSP nchar(10), @maHangSX nchar(10), @tenSP nvarchar(30), @soLuong int, @mauSac nvarchar(20), @giaBan money, @donViTinh nchar(10), @moTa nvarchar(max))
as 
begin
   if(exists(select * from SanPham where SanPham.MaSP = @maSP))
      begin 
	    update SanPham
	    set SanPham.MaHangSX = @maHangSX, TenSP = @tenSP,
	    SoLuong = @soLuong, MauSac = @mauSac,
	    GiaBan = @giaBan, DonViTinh = @donViTinh,
	    MoTa = @moTa
	    where MaSP = @maSP
		print N'Đã cập nhật sản phẩm!'
	  end
    else 
      begin 
        insert into SanPham values(@maSP, @maHangSX, @tenSP, @soLuong, @mauSac, @giaBan, @donViTinh, @moTa)
        print N'Đã thêm sản phẩm!'
      end
end;

go 
exec SP_NhapSanPham 'SP05', 'H02', 'Galaxy V22', 600, N'Đen', 9000000, N'Chiếc', N'Hàng cận cao cấp';
select * from SanPham;

-- b:
go 
create proc SP_XoaHangSX(@tenHang nvarchar(30))
as 
begin
    if(not exists(select * from HangSX where TenHang = @tenHang))
       print N'Hãng sản xuất không tồn tại!';
	else 
	    begin 
		-- xóa các bản ghi trong bảng nhập, xuất
		    delete from Nhap where MaSP in (select MaSP from SanPham 
		                                  where MaHangSX in (select MaHangSX from HangSX
		                                                     where TenHang = @tenHang))
			delete from Xuat where MaSP in (select MaSP from SanPham 
		                                  where MaHangSX in (select MaHangSX from HangSX
		                                                     where TenHang = @tenHang))	
		-- xóa các bản ghi trong bảng sản phẩm												 										-- 
		    delete from SanPham where MaHangSX in (select MaHangSX from HangSX
		                                           where TenHang = @tenHang);
		-- xóa các bản ghi trong bảng hãng sx
			delete from HangSX where TenHang = @tenHang;
	        print N'Đã xóa hãng sản xuất!';
		end   
end;

go 
exec SP_XoaHangSX 'SamSung';
select * from HangSX;

-- c:
go 
create proc SP_NhapNV(@maNV nchar(10), @tenNV nvarchar(20), @gioiTinh nchar(10), @diaChi nvarchar(30), @soDT nvarchar(20), @email nvarchar(30), @tenPhong nvarchar(30), @flag int)
as 
begin 
    if(@flag = 0) 
        begin 
	       update NhanVien
		   set TenNV = @tenNV, GioiTinh = @gioiTinh,
		   DiaChi = @diaChi, SoDT = @soDT, Email = @email, TenPhong = @tenPhong
           where MaNV = @maNV;
		   print N'Đã cập nhật nhân viên!';
	    end
	else 
	    begin 
		   insert into NhanVien values(@maNV, @tenNV, @gioiTinh, @diaChi, @soDT, @email, @tenPhong);
		   print N'Đã thêm nhân viên!';
		end
end;

go 
exec SP_NhapNV 'NV04',N'Trần Hòa Bình',N'Nữ',N'Hà Nội','0328388388','hb@gmail.com',N'Kế toán', 1;
select * from NhanVien;

-- d:
go 
create proc SP_NhapNhap(@soHDN nchar(10), @maSP nchar(10), @maNV nchar(10), @ngayNhap Date, @soLuongN int, @donGiaN money)
as 
begin 
    if(not exists(select * from SanPham where MaSP = @maSP) and not exists(select * from NhanVien where MaNV = @maNV))
       print N'Không tồn tại sản phẩm và nhân viên!';
    else 
	    if(exists(select * from Nhap where SoHDN = @soHDN))
	        begin 
		       update Nhap
			   set MaSP = @maSP, SoLuongN = @soLuongN, DonGiaN = @donGiaN
			   where SoHDN = @soHDN;
			   print N'Đã cập nhật bảng Nhap!';
		    end
		else 
		    begin 
			   insert into Nhap values(@soHDN,@maSP,@soLuongN,@donGiaN);
			   print N'Đã thêm mới bảng Nhap!';
			end
end;

go 
exec SP_NhapNhap 'N05', 'SP03', 'NV02','2019-7-7', 40, 1000000;
select * from Nhap;

-- Bài 2:
-- a:
go 
create proc SP_ThemSP(@maSP nchar(10), @tenHang nvarchar(30), @tenSP nvarchar(30), @soLuong int, @mauSac nvarchar(20), @giaBan money, @donViTinh nchar(10), @moTa nvarchar(max), @flag int, @error int output)
as
begin
    declare @maHangSX nchar(10);
    select @maHangSX = MaHangSX from HangSX where TenHang = @tenHang;
    
    if (@maHangSX is null) 
    begin
        set @maHangSX = 'default_value';
    end

    if (not exists(select * from HangSX where TenHang = @tenHang))
    begin
        set @error = 1;
        return;
    end
    
    if (@soLuong < 0) 
    begin
        set @error = 2;
        return;
    end
    
    if (@flag = 0) 
    begin 
        insert into SanPham values (@maSP, @maHangSX, @tenSP, @soLuong, @mauSac, @giaBan, @donViTinh, @moTa);
        print N'Đã thêm mới sản phẩm!';
    end
    else 
    begin 
        if (not exists(select * from SanPham where MaSP = @maSP))
        begin
            set @error = 3;
            return;
        end
        
        update SanPham
        set MaHangSX = @maHangSX, 
            TenSP = @tenSP, 
            SoLuong = @soLuong, 
            MauSac = @mauSac,
            GiaBan = @giaBan, 
            DonViTinh = @donViTinh, 
            MoTa = @moTa
        where MaSP = @maSP;
        
        print N'Đã cập nhật sản phẩm!';
    end
    
    set @error = 0;
    return;
end;

go 
declare @error int;
exec SP_ThemSP 'SP06', 'OPPO', 'OPPO S22', 200, N'Xanh', 43000000, N'Chiếc', N'Hàng cận cao cấp', 1, @error output;
select * from SanPham;
select @error as 'Error';

-- b:
go 
create proc SP_XoaNV(@maNV nchar(10), @error int output)
as 
begin 
    if(not exists(select * from NhanVien where MaNV = @maNV))
        begin 
	       set @error = 1
	       return;
	   end
	else 
	    begin 
	        set @error = 0;
            delete from Nhap where SoHDN in (select SoHDN from PNhap where MaNV = @maNV);
		    delete from Xuat where SoHDX in (select SoHDX from PXuat where MaNV = @maNV);
		    delete from PNhap where MaNV = @maNV;
			delete from PXuat where MaNV = @maNV;
			delete from NhanVien where MaNV = @maNV;
	    end
end;

go 
declare @error int;
exec SP_XoaNV 'NV01', @error output;
select * from NhanVien;
select @error as 'Error';

-- c:
go 
create proc SP_XoaSP(@maSP nchar(10), @error int output)
as 
begin 
    if(not exists(select * from SanPham where MaSP = @maSP))
        begin 
	       set @error = 1;
		   return @error;
	    end
	else 
	    begin 
		   set @error = 0;
		   delete from PNhap where SoHDN in (select SoHDN from Nhap where MaSP = @maSP);
		   delete from PXuat where SoHDX in (select SoHDX from Xuat where MaSP = @maSP);
		   delete Nhap where MaSP = @maSP;
		   delete Xuat where MaSP = @maSP;
		   delete SanPham where MaSP = @maSP;
		   return @error;		
		end
end;

go 
declare @error int;
exec SP_XoaSP 'SP06', @error output;
select * from SanPham;
select @error as 'Error';