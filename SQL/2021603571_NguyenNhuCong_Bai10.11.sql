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
    declare @soLuongB int;
    declare @soLuong int;
    select @maHang = maHang, @soLuongB = soLuong from inserted;
    select @soLuong = soLuong from MatHang where maHang = @maHang;
    if(not exists(select * from MatHang where maHang = @maHang))
        raiserror(N'Mặt hàng không tồn tại!', 16, 1);
    else 
        begin 
            if(@soLuongB > @soLuong) 
                begin 
                    raiserror(N'Số lượng bán vượt quá số lượng hiện có!', 16, 1);
                    rollback transaction;
                    return;
                end
            else 
                update MatHang
                set soLuong = soLuong - @soLuongB
                where maHang = @maHang;
        end
end;

go 
insert into NhatKyBanHang values(1, '1999-02-09', 'ab', '2', 130, 500000);
select * from MatHang;
select * from NhatKyBanHang;

-- e:
go 
create trigger trg_nhatkybanhang_delete on NhatKyBanHang 
after delete 
as 
begin 
    declare @maHang nchar(10);
    declare @soLuongB int;
    declare @count int;
    select @maHang = deleted.maHang, @soLuongB = deleted.soLuong from deleted;
    select @count = count(*) from deleted;

    if(@count > 1) 
        begin 
            raiserror(N'Không thể xóa nhiều hơn 1 bản ghi!', 16, 1);
            rollback transaction;
            return;
        end
    else 
        update MatHang 
        set soLuong = soLuong + @soLuongB
        where maHang = @maHang;
end;

go 
delete from NhatKyBanHang 
where stt = 1;
select * from MatHang;
select * from NhatKyBanHang;

-- b-d-f:
go 
create trigger trg_nhatkybanhang_update on NhatKyBanHang
after update 
as 
begin 
    declare @maHang nchar(10);
    declare @soLuongCu int;
    declare @soLuongMoi int;
    declare @count int;

    select @maHang = maHang from inserted;
    select @soLuongMoi = soLuong from inserted;
    select @soLuongCu = soLuong from deleted;
    select @count = count(*) from inserted;

    if(@count > 1) 
        begin 
            raiserror(N'Không thể cập nhật nhiều hơn 1 bản ghi', 16, 1);
            rollback transaction;
            return;
        end 
    else 
        if(@soLuongMoi < @soLuongCu)
            begin 
               raiserror(N'Lỗi không thể cập nhật!', 16, 1);
               rollback transaction;
               return;
            end 
        else if(@soLuongMoi = @soLuongCu) 
            begin 
               raiserror(N'Không cần cập nhật!', 16, 1);
               rollback transaction;
               return;
            end 
        else 
            update MatHang
            set soLuong = soLuong - @soLuongMoi + @soLuongCu
            where maHang = @maHang;
end;

go 
update NhatKyBanHang
set soLuong = 220
where stt = 1;
select * from MatHang;
select * from NhatKyBanHang;