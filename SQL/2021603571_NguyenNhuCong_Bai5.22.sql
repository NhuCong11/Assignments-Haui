use master
go
create database QLSV

go 
use QLSV
go 
-- Bài 1:
create table LOP (
  maLop int not null primary key,
  tenLop nvarchar(30) not null,
  phong int 
);

create table SV (
  maSV int not null primary key,
  tenSV nvarchar(30) not null,
  maLop int not null,
  constraint FK_SV_LOP foreign key(maLop)
  references LOP(maLop)
);

insert into LOP values(1,'CD',1), (2, 'DH', 2), (3, 'LT', 2), (4, 'CH', 4);

insert into SV values(1, 'A', 1), (2, 'B', 2), (3, 'C', 1), (4, 'D', 3);

-- Bài 2:
-- a:
go
create function fn_ThongKeSV (@MaLop int)
returns int
as
begin
  declare @tongSV int 
  select @tongSV = count(SV.maSV)
  from SV
  join LOP on SV.maLop = LOP.maLop
  where LOP.maLop = @MaLop
  return @tongSV
end

go
select dbo.fn_ThongKeSV(1) as 'So luong SV'
go 

create function fn_DSSV(@tenlop nvarchar(30))
returns @bangSV table (maSV int, tenSV nvarchar(30))
as 
begin 
  insert into @bangSV
  select SV.maSV, SV.tenSV
  from SV
  where maLop = (select maLop 
                from LOP
                where tenLop = @tenlop)
  return 
end; 

go 
select * from fn_DSSV('CD')
go 

create function fn_ThongKeSVLOP(@tenlop nvarchar(30))
returns @bangsvlop table(maLop int, tenLop nvarchar(30), soLuong int)
as 
begin 
  if(not exists(select maLop from LOP where tenLop = @tenlop))
    insert into @bangsvlop
    select LOP.maLop, tenLop, count(maSV)
    from LOP
    join SV on SV.maLop = LOP.maLop
    group by LOP.maLop, tenLop
  else 
    insert into @bangsvlop
    select LOP.maLop, tenLop, count(maSV)
    from LOP
    join SV on SV.maLop = LOP.maLop
    where tenLop = @tenlop
    group by LOP.maLop, tenLop
  return
end;

go 
select * from fn_ThongKeSVLOP('CD')

go
create function fn_PhongHocSV(@tensv nvarchar(30))
returns int 
as 
begin 
  declare @tenphong int
  select @tenphong = LOP.phong
  from LOP
  join SV on SV.maLop = LOP.maLop
  where SV.tenSV = @tensv
  return @tenphong
end

go 
select dbo.fn_PhongHocSV('A') as 'Phong'

go 
create function fn_ThongKeSVPhong(@tenphong int)
returns @bangSVPhong table(maSV int, tenSV nvarchar(30), tenLop nvarchar(30))
as 
begin 
  if(not exists(select phong from LOP where phong = @tenphong))
    insert into @bangSVPhong
    select maSV, tenSV, tenLop
    from SV
    join LOP on LOP.maLop = SV.maLop
  else 
    insert into @bangSVPhong
    select maSV, tenSV, tenLop
    from SV
    join LOP on LOP.maLop = SV.maLop
    where phong = @tenphong
  return 
end;

go 
select * from fn_ThongKeSVPhong(1);

go 
create function fn_ThongKeLop(@tenphong int)
returns @bangLop table (phong int, soLuong int)
as 
begin 
  if(not exists(select phong from LOP where phong = @tenphong))
    return
  else 
    insert into @bangLop
    select phong, count(maLop) as 'So lop'
    from LOP
    where phong = @tenphong
    group by phong
    return 
end;

go 
select * from fn_ThongKeLop(3);