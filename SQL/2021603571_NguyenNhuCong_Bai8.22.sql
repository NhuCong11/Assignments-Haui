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
create proc SP_Them_Nhan_Vien(@manv nvarchar(4), @macv nvarchar(2), @tennv nvarchar(30), @ngaysinh datetime, @luongcoban float, @ngaycong int, @phucap float, @kq int output)
as 
begin
   if(not exists(select * from ChucVu where @macv = MaCV))
      set @kq = 0
   else 
      if(exists(select * from NhanVien where MaCV = @macv and MaNV = @manv))
         set @kq = 0
      else 
        begin 
           insert into NhanVien values(@manv,@macv,@tennv,@ngaysinh,@luongcoban,@ngaycong,@phucap)
           print N'Đã thêm thành công!'
           set @kq = 1
         end
   return @kq
end;

go 
declare @kq int;
exec SP_Them_Nhan_Vien N'NV06', N'KT', N'Trịnh Gia Linh', '1998-11-11', 1200000, 28, 100000, @kq output;
select * from NhanVien;
select @kq as 'KetQua';

-- 2:
go
create proc SP_Them_Nhan_Vien2(@manv nvarchar(4), @macv nvarchar(2), @tennv nvarchar(30), @ngaysinh datetime, @luongcoban float, @ngaycong int, @phucap float, @kq int output)
as 
begin
   if(not exists(select * from NhanVien where @manv = MaNV))
      set @kq = 0
   else 
      if(not exists(select * from ChucVu where MaCV = @macv))
         set @kq = 1
      else 
        begin 
           insert into NhanVien values(@manv,@macv,@tennv,@ngaysinh,@luongcoban,@ngaycong,@phucap)
           print N'Đã thêm thành công!'
         end
   return @kq
end;

go 
declare @kq int;
exec SP_Them_Nhan_Vien2 N'NV06', N'LTV', N'Trịnh Gia Linh', '1998-11-11', 1200000, 28, 100000, @kq output;
select * from NhanVien;
select @kq as 'KetQua';

-- 3:
go 
create proc SP_CapNhat_NgaySinh(@manv nvarchar(4), @ngaysinh datetime, @kq int output)
as 
begin
   if(not exists(select * from NhanVien where @manv = MaNV))
      begin 
         print N'Nhân viên không tồn tại!'
         set @kq = 0
      end
    else 
      begin 
        update NhanVien
        set NgaySinh = @ngaysinh
        where MaNV = @manv
        set @kq = 1
      end
end;

go 
declare @kq int;
exec SP_CapNhat_NgaySinh N'NV06', '2003-12-18', @kq output;
select * from NhanVien;
select @kq as 'Error';