using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace demo_kt
{
    internal class Program
    {
        static List<NhanVien> ds = new List<NhanVien>();
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int luaChon = 0;

            while (luaChon != 7)
            {
                Console.WriteLine("------ MENU ------");
                Console.WriteLine("1. Thêm nhân viên");
                Console.WriteLine("2. Hiển thị danh sách");
                Console.WriteLine("3. Sắp xếp danh sách");
                Console.WriteLine("4. Xóa nhân viên");
                Console.WriteLine("5. Tìm kiếm nhân viên");
                Console.WriteLine("6. Sửa thông tin nhân viên");
                Console.WriteLine("7. Thoát");
                Console.Write("Nhập lựa chọn: ");
                luaChon = int.Parse(Console.ReadLine());

                switch (luaChon)
                {
                    case 1:
                        nhapDS();
                        break;
                    case 2:
                        hienThiDS();
                        break;
                    case 3:
                        sapXepDS();
                        break;
                    case 4:
                        xoaNV();
                        break;
                    case 5:
                        timKiem();
                        break;
                    case 6:
                        suaTT();
                        break;
                    case 7:
                        Console.WriteLine("Chương trình kết thúc!!!");
                        break;
                    default:
                        Console.WriteLine("Lựa chọn không hợp lệ!");
                        break;
                }
            }

            Console.ReadLine();
        }
        static void nhapDS()
        {
            NhanVien a = new NhanVien();

            a.nhap();

            if (!ds.Exists(e => e.MaNV == a.MaNV))
            {
                ds.Add(a);
            } else
            {
                Console.WriteLine("Duplicate ID. Employee not added.");
            }
        }

        static void hienThiDS()
        {
            Console.WriteLine("----- DANH SÁCH SINH VIÊN -----");

            Console.WriteLine("{0, 10} {1, 15} {2, 15} {3, 15} {4, 15} {5, 15}", "Mã NV", "Họ tên", "Địa chỉ", "Chức vụ", "Lương cơ bản", "Hệ số Chức vụ");
            for (int i = 0; i < ds.Count; i++)
            {
                Console.WriteLine("{0, 10} {1, 15} {2, 15} {3, 15} {4, 15} {5, 15}", ds[i].MaNV, ds[i].Name, ds[i].Address, ds[i].ChucVu, ds[i].LuongCoBan, ds[i].TinhHeSoCV(ds[i].ChucVu));
            }
        }

        static void sapXepDS()
        {
            for (int i = 0; i < ds.Count - 1; i++)
            {
                for (int j = i + 1; j < ds.Count; j++)
                {
                    if (ds[i].TinhHeSoCV(ds[i].ChucVu) > ds[j].TinhHeSoCV(ds[j].ChucVu))
                    {
                        NhanVien temp;
                        temp = ds[i]; 
                        ds[i] = ds[j];
                        ds[j] = temp;
                    }
                }
            }

            Console.WriteLine("Đã sắp xếp danh sách!!!");
            Console.WriteLine();
            hienThiDS();
        }

        static void xoaNV()
        {
            string maNV;

            Console.Write("Nhập mã NV cần xóa: ");
            maNV = Console.ReadLine();

            for (int i = 0; i<ds.Count; i++)
            {
                if (ds[i].MaNV == maNV)
                {
                    ds.RemoveAt(i);
                }
            }
            Console.WriteLine("Đã xóa nhân viên!!!");
            Console.WriteLine();
            hienThiDS();
        }

        static void timKiem()
        {
            int count = 0;
            string maNV;
            Console.Write("Nhập mã nhân viên cần tìm kiếm: ");
            maNV = Console.ReadLine();

            for (int i = 0; i< ds.Count; i++)
            {
                if (ds[i].MaNV == maNV)
                {
                    Console.WriteLine("----- THÔNG TIN NHÂN VIÊN ------");
                    Console.WriteLine("{0, 10} {1, 15} {2, 15} {3, 15} {4, 15} {5, 15}", "Mã NV", "Họ tên", "Địa chỉ", "Chức vụ", "Lương cơ bản", "Hệ số Chức vụ");
                    Console.WriteLine("{0, 10} {1, 15} {2, 15} {3, 15} {4, 15} {5, 15}", ds[i].MaNV, ds[i].Name, ds[i].Address, ds[i].ChucVu, ds[i].LuongCoBan, ds[i].TinhHeSoCV(ds[i].ChucVu));
                    continue;
                }
                else
                {
                    count++;
                }
            }

            if (count != 0)
            {
                Console.WriteLine("-> Không tìm thấy nhân viên cần tìm!");
            }
        }

        static void suaTT()
        {
            string maNV;
            Console.Write("Nhập mã nhân viên cần sửa: ");
            maNV = Console.ReadLine();

            if (ds.Exists(e => e.MaNV == maNV))
            {
                Console.WriteLine("Nhập lại thông tin:");
                for (int i = 0; i< ds.Count ;i++)
                {
                    if (ds[i].MaNV == maNV)
                    {
                        Console.Write("Nhập họ tên: ");
                        ds[i].Name = Console.ReadLine();
                        Console.Write("Nhập địa chỉ: ");
                        ds[i].Address = Console.ReadLine();
                        Console.Write("Nhập chức vụ: ");
                        ds[i].ChucVu = Console.ReadLine();
                        Console.Write("Nhập lương cơ bản: ");
                        ds[i].LuongCoBan = double.Parse(Console.ReadLine());
                    }
                }
            }
            else
            {
                Console.WriteLine("Mã nhân viên không tồn tại!");
            }
        }
    }
}
