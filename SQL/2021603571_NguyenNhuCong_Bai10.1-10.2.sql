use master
go 
create database MuaHang;

go 
use MuaHang 
go 
create table Hang (
    MaHang nchar(10) not null primary key,
    TenHang nvarchar(30) not null,
    SoLuong int,
    GiaBan money
);

create table HoaDon (
    MaHD nchar(10) not null primary key,
    MaHang nchar(10) not null,
    SoLuongBan int,
    NgayBan date
);

insert into Hang values('H01', N'Tivi', 10, 4000),
('H02', N'Tủ lạnh', 5, 15000),
('H03', N'Điều hòa', 8, 12000);

go 
create trigger trg_MuaHang on HoaDon 
after insert 
as 
begin
    declare @maHang nchar(10);
    declare @soLuongBan int;
    declare @soLuong int;
    select @maHang = MaHang, @soLuongBan = SoLuongBan from inserted;
    select @soLuong = SoLuong from Hang where @maHang = MaHang;
    if(not exists(select * from Hang where MaHang = @maHang))
       raiserror (N'Mã hàng không tồn tại trong bảng Hang!', 16, 1);
    else 
        begin 
            if(@soLuongBan > @soLuong) 
                begin 
                   raiserror (N'Số lượng bán vượt quá số lượng trong kho!', 16, 1);
                   rollback transaction;
                   return;
                end
            else 
                update Hang 
                set SoLuong = SoLuong - @soLuongBan
                where MaHang = @maHang
        end
end;

insert into HoaDon values('HD03', 'H03', 1, '2023-01-24')
select * from Hang;
select * from HoaDon;

go 
create trigger trg_XoaHoaDon on HoaDon 
after delete 
as 
begin 
   declare @maHang nchar(10);
   declare @soluongBan int;
   select @maHang = deleted.MaHang, @soluongBan = deleted.SoLuongBan from deleted
   
   update Hang 
   set SoLuong = SoLuong + @soLuongBan
   where MaHang = @maHang;
end;

delete from HoaDon where MaHD = 'HD03';
select * from Hang;
select * from HoaDon;

go 
create trigger trg_CapNhapHoaDon on HoaDon 
after update 
as 
begin 
   declare @maHang nchar(10);
   declare @soLuongCu int, @soLuongMoi int;
   select @maHang = MaHang from inserted;
   select @soLuongCu = SoLuongBan from inserted;
   select @soLuongMoi = SoLuongBan from deleted;
   
   update Hang 
   set SoLuong = SoLuong - @soLuongCu + @soLuongMoi
   where MaHang = @maHang;
end;

go
update HoaDon 
set MaHang = 'H03', SoLuongBan = 3, NgayBan = '2023-01-20'
where MaHD = 'HD03';
select * from Hang;
select * from HoaDon;