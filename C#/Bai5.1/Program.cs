using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._1
{
    internal class Program
    {
        static List<ThisinhA> DanhSach = new List<ThisinhA>();
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int luaChon = 0;

            while (luaChon != 6)
            {
                Console.WriteLine("------ MENU -----");
                Console.WriteLine("1. Nhập thông tin 1 sinh viên");
                Console.WriteLine("2. Hiển thị danh sách các thí sinh");
                Console.WriteLine("3. Hiển thị các sinh viên theo tổng điểm");
                Console.WriteLine("4. Hiển thị các sinh viên theo địa chỉ");
                Console.WriteLine("5. Tìm kiếm theo số báo danh");
                Console.WriteLine("6. Kết thúc chương trình");
                Console.Write("Nhập vào lựa chọn: ");
                luaChon = int.Parse(Console.ReadLine());

                switch (luaChon)
                {
                    case 1:
                        nhap();
                        break;
                    case 2:
                        hienThiDS(DanhSach);
                        break; 
                    case 3:
                        hienThiDSDiem(DanhSach);
                        break;
                    case 4:
                        hienThiDSDiaChi(DanhSach);
                        break;
                    case 5:
                        timKiemSBD(DanhSach);
                        break;
                    case 6:
                        Console.WriteLine("Chương trình kết thúc!!!");
                        break;
                    default:
                        Console.WriteLine("Lựa chọn không tồn tại!");
                        break;
                }
            }

            Console.ReadLine();
        }

        static void nhap()
        {
            ThisinhA a = new ThisinhA();
            Console.Write("Nhập số báo danh: ");
            a.SoBaoDanh = Console.ReadLine();
            Console.Write("Nhập họ tên: ");
            a.HoTen = Console.ReadLine();
            Console.Write("Nhập địa chỉ: ");
            a.DiaChi = Console.ReadLine();
            Console.Write("Nhập điểm toán: ");
            a.Toan = float.Parse(Console.ReadLine());
            Console.Write("Nhập điểm lý: ");
            a.Ly = float.Parse(Console.ReadLine());
            Console.Write("Nhập điểm hóa: ");
            a.Hoa = float.Parse(Console.ReadLine());
            Console.Write("Nhập điểm ưu tiên: ");
            a.DiemUuTien = float.Parse(Console.ReadLine());
            DanhSach.Add(a);
        }

        static void hienThiDS(List<ThisinhA> a)
        {
            Console.WriteLine("----- DANH SÁCH THÍ SINH -----");
            Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", "SBD", "Họ tên", "Địa chỉ", "Toán", "Lý", "Hóa", "Điểm UT", "Tổng");
            for (int i = 0; i < a.Count; i++)
            {
                Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", a[i].SoBaoDanh, a[i].HoTen, a[i].DiaChi, a[i].Toan, a[i].Ly, a[i].Hoa, a[i].DiemUuTien, a[i].TongDiem);
            }
        }

        static void hienThiDSDiem(List<ThisinhA> a)
        {
            float diem = 0;
            Console.Write("Nhập vào tổng điểm cần hiển thị (>=): ");
            diem = float.Parse(Console.ReadLine());

            Console.WriteLine($"----- DANH SÁCH THÍ SINH CÓ TỔNG ĐIỂM >= {diem} -----");
            Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", "SBD", "Họ tên", "Địa chỉ", "Toán", "Lý", "Hóa", "Điểm UT", "Tổng");

            for (int i = 0;i < a.Count; i++)
            {
                if (a[i].TongDiem >= diem)
                {
                    Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", a[i].SoBaoDanh, a[i].HoTen, a[i].DiaChi, a[i].Toan, a[i].Ly, a[i].Hoa, a[i].DiemUuTien, a[i].TongDiem);
                }
            }
        }

        static void hienThiDSDiaChi(List<ThisinhA> a)
        {
            string dc = "";
            Console.Write("Nhập vào địa chỉ cần hiển thị: ");
            dc = Console.ReadLine();

            Console.WriteLine($"----- DANH SÁCH THÍ SINH ĐỊA CHỈ Ở {dc} -----");
            Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", "SBD", "Họ tên", "Địa chỉ", "Toán", "Lý", "Hóa", "Điểm UT", "Tổng");

            for (int i = 0; i < a.Count; i++)
            {
                if (a[i].DiaChi == dc)
                {
                    Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", a[i].SoBaoDanh, a[i].HoTen, a[i].DiaChi, a[i].Toan, a[i].Ly, a[i].Hoa, a[i].DiemUuTien, a[i].TongDiem);
                }
            }
        }

        static void timKiemSBD(List<ThisinhA> a)
        {
            string sbd = "";
            Console.Write("Nhập vào số báo danh cần tìm: ");
            sbd = Console.ReadLine();

            Console.WriteLine($"----- THÔNG TIN THÍ SINH CÓ SBD: {sbd} -----");
            Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", "SBD", "Họ tên", "Địa chỉ", "Toán", "Lý", "Hóa", "Điểm UT", "Tổng");

            for (int i = 0; i < a.Count; i++)
            {
                if (a[i].SoBaoDanh == sbd)
                {
                    Console.WriteLine("{0, -10} {1, 15} {2, 15} {3, 10} {4, 10} {5, 10} {6, 10} {7, 10}", a[i].SoBaoDanh, a[i].HoTen, a[i].DiaChi, a[i].Toan, a[i].Ly, a[i].Hoa, a[i].DiemUuTien, a[i].TongDiem);
                }
            }
        }
    }
}
