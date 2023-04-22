go
use master
go 
create database QLKhoa

go 
use QLKhoa 
go 
create table KHOA (
    MaKhoa nchar(10) not null primary key,
    TenKhoa nvarchar(20) not null,
    DienThoai nvarchar(20)
);

create table LOP (
    MaLop nchar(10) not null primary key,
    TenLop nvarchar(20) not null,
    Khoa int,
    Hedt nvarchar(20),
    Namnhaphoc int,
    MaKhoa nchar(10) not null,
    constraint FK_LOP_MaKhoa foreign key(MaKhoa)
    references KHOA(MaKhoa)
);

insert into KHOA values
('KH01', 'CNTT', '0982144291'),
('KH02', N'Quản trị kinh doanh', '0772924264'),
('KH03', N'Kế toán', '0169433415');

insert into LOP values
('LH01', 'KTPM03', 16, N'Đại học', 2021, 'KH01'),
('LH02', 'QTKD04', 15, N'Đại học', 2020, 'KH02'),
('LH03', 'KTOAN01', 17, N'Đại học', 2022, 'KH03');

-- Câu 1:
go 
create proc SP_NhapKhoa(@makhoa nchar(10), @tenkhoa nvarchar(20), @dienthoai nvarchar(20))
as 
begin
   if(exists(select * from KHOA where KHOA.TenKhoa = @tenkhoa))
      print N'Tên khoa ' + @tenkhoa + N' đã tồn tại' 
    else 
      begin 
        insert into KHOA values(@makhoa, @tenkhoa, @dienthoai)
      end
end;

go 
exec SP_NhapKhoa 'KH04', N'Điện tử', '0367824921';
select * from KHOA

-- Câu 2:
go 
create proc SP_NhapLop(@malop nchar(10), @tenlop nvarchar(20), @khoa int, @hedt nvarchar(20), @namnhaphoc int, @makhoa nchar(10))
as 
begin
  if(exists(select * from LOP where TenLop = @tenlop))
    print N'Tên lóp ' + @tenlop + N' đã tồn tại'
  else 
    begin 
      insert into LOP values(@malop, @tenlop, @khoa, @hedt, @namnhaphoc, @makhoa)
      print N'Đã thêm lớp thành công'
    end
end;

go 
exec SP_NhapLop 'LH04', 'CNTT1', 16, N'Đại học', 2021, 'KH01';
select * from LOP;