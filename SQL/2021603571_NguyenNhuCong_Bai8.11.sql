go 
use master
go 
create database QLNV

go 
use QLNV 
go 
create table ChucVu (
    MaCV nvarchar(2) not null primary key,
    TenCV nvarchar(30)
);

create table NhanVien (
    MaNV nvarchar(4) not null primary key,
    MaCV nvarchar(2) not null,
    TenNV nvarchar(30),
    NgaySinh datetime,
    LuongCoBan float,
    NgayCong int,
    PhuCap float,
    constraint FK_NV_MaCV foreign key(MaCV)
    references ChucVu(MaCV)
);

insert into ChucVu values(N'BV', N'Bảo vệ'),
(N'GD', N'Giám đốc'),
(N'HC', N'Hành chính'),
(N'KT', N'Kế toán'),
(N'TQ', N'Thủ quỹ'),
(N'VS', N'Vệ sinh');

insert into NhanVien values(N'NV01', N'GD', N'Nguyễn Văn An', '1977-12-12', 700000, 25, 500000),
(N'NV02', N'BV', N'Bùi Văn Tí', '1978-10-10', 400000, 24, 100000),
(N'NV03', N'KT', N'Trần Thanh Nhật', '1977-9-9', 600000, 26, 400000),
(N'NV04', N'VS', N'Nguyễn Thị Út', '1980-10-10', 300000, 26, 300000),
(N'NV05', N'HC', N'Lê Thị Hà', '1979-10-10', 500000, 27, 200000);

-- 1:
go 
create proc SP_Them_Nhan_Vien(@manv nvarchar(4), @macv nvarchar(2), @tennv nvarchar(30), @ngaysinh datetime, @luongcoban float, @ngaycong int, @phucap float)
as 
begin
   if(not exists(select * from ChucVu where @macv = MaCV))
      print N'Mã chức vụ trên đã tồn tại!'
   else 
      begin 
        insert into NhanVien values(@manv,@macv,@tennv,@ngaysinh,@luongcoban,@ngaycong,@phucap)
        print N'Đã thêm thành công!'
      end
end;

go 
exec SP_Them_Nhan_Vien N'NV06', N'KT', N'Trịnh Gia Linh', '1998-11-11', 1200000, 28, 100000;
select * from NhanVien;

-- 2:
go 
create proc SP_CapNhat_NhanVien(@manv nvarchar(4), @macv nvarchar(2), @tennv nvarchar(30), @ngaysinh datetime, @luongcoban float, @ngaycong int, @phucap float)
as 
begin
   if(not exists(select * from ChucVu where @macv = MaCV))
      print N'Chức vụ không tồn tại!'
    else 
      begin 
        update NhanVien
        set TenNV = @tennv, NgaySinh = @ngaysinh, 
        LuongCoBan = @luongcoban , NgayCong = @ngaycong , PhuCap = @phucap 
        where MaNV = @manv
      end
end;

go 
exec SP_CapNhat_NhanVien N'NV06', N'KT', N'Nguyễn Như Công', '2003-11-11', 1200000, 28, 100000;
select * from NhanVien;

-- 3:
go 
create proc SP_LuongLN(@luongcoban float, @ngaycong int, @phucap float, @luong float output)
as 
begin 
   set @luong = (@luongcoban * @ngaycong) + @phucap
   return @luong
end;

declare @luong float;
exec SP_LuongLN 1200000, 28, 100000, @luong output;
select @luong as 'Luong';