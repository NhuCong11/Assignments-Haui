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
create proc SP_NhapKhoa(@makhoa nchar(10), @tenkhoa nvarchar(20), @dienthoai nvarchar(20), @bientrave int output)
as 
begin
   if(exists(select * from KHOA where TenKhoa = @tenkhoa))
      set @bientrave = 0
    else 
      begin 
        insert into KHOA values(@makhoa, @tenkhoa, @dienthoai)
        set @bientrave = 1
      end 
    return @bientrave
end;

go
declare @ketqua1 int;
exec SP_NhapKhoa 'KH04', N'Điện tử', '0658237631', @ketqua1 output;
select * from KHOA;
select @ketqua1 as 'KetQua';

-- Bài 2:
go 
create proc SP_NhapLop(@malop nchar(10), @tenlop nvarchar(20), @khoa int, @hedt nvarchar(20), @namnhaphoc int, @makhoa nchar(10), @bientrave int output)
as 
begin
    if(exists(select * from LOP where TenLop = @tenlop))
        begin
          set @bientrave = 0;
          return @bientrave;
        end
    if(not exists(select * from LOP where MaLop = @malop))
       begin 
          set @bientrave = 1;
          return @bientrave;
        end
    insert into LOP values(@malop, @tenlop, @khoa, @hedt, @namnhaphoc, @makhoa);
    set @bientrave = 2;
    return @bientrave;
end;

go 
declare @ketqua2 int
exec SP_NhapLop 'LH05', 'CNTT', 16, N'Đại học', 2021, 'KH01', @ketqua2 output;
select * from LOP;
select @ketqua2 as 'KetQua';