go
use master
go 
create database QLBH;

use QLBH
go 
create table MatHang (
    maHang nchar(10) not null primary key,
    tenHang nvarchar(30) not null,
    soLuong int
);

create table NhatKyBanHang (
    stt int not null primary key,
    ngay date,
    nguoiMua nvarchar(30),
    maHang nchar(10) not null,
    soLuong int,
    giaBan money
);

insert into MatHang values('1', N'Kẹo', 100),
('2', N'Bánh', 200),
('3', N'Thuốc', 100);

-- a-c:
go 
create trigger trg_nhatkybanhang_insert on NhatKyBanHang
after insert 
as 
begin 
    declare @maHang nchar(10);
    declare @soLuongBan int;
    declare @soLuong int;
    declare @count int;
    select @maHang = maHang, @soLuongBan = soLuong from inserted;
    select @soLuong = soLuong from MatHang where maHang = @maHang;
    select @count = count(*) from inserted;
    if(@count > 1)
        begin 
            raiserror(N'Không thể cập nhật nhiều hơn 1 bản ghi!', 16, 1);
            return;
        end
    else 
        if(@soLuongBan > @soLuong) 
            begin
                raiserror(N'Số lượng bán lớn hơn số lượng hiện có!', 16, 1);
                rollback transaction;
                return; 
            end 
        else 
            begin
                update MatHang 
                set soLuong = soLuong - @soLuongBan
                where maHang = @maHang; 
            end
end;

go 
insert into NhatKyBanHang values(1, '1999-02-09', 'ab', '2', 130, 500000);
select * from MatHang;
select * from NhatKyBanHang;