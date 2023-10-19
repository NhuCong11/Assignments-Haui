using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CauTruc
{

    internal class Program
    {
        struct SinhVien
        {
            public string hoTen;
            public int tuoi;
            public bool gioiTinh; 
        }

        private static void nhapMang(int n, SinhVien[] a) 
        {
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Nhập thông tin sinh viên {i + 1}: ");
                Console.WriteLine("Nhập vào họ tên: ");
                a[i].hoTen = Console.ReadLine();
                Console.WriteLine("Nhập vào tuổi: ");
                a[i].tuoi = int.Parse(Console.ReadLine());
                Console.WriteLine("Nhập vào giới tính: ");
                a[i].gioiTinh = bool.Parse(Console.ReadLine());
                a[i].gioiTinh.ToString();
            }
        }

        private static void xuatMang(int n, SinhVien[] a)
        {
            Console.WriteLine(string.Format("{0,-20}{1,12}{2,12}", "Họ tên", "Tuổi", "Giới tính"));
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine(string.Format("{0,-20}{1,12}{2,12}", a[i].hoTen, a[i].tuoi, a[i].gioiTinh));

            }
        }

        private static int tongTuoi(int n, SinhVien[] a)
        {
            int total = 0;

            for (int i = 0; i < n; i++)
            {
                total += a[i].tuoi;
            }

            return total;
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n;
            Console.WriteLine("Nhập vào n: ");
            n = int.Parse(Console.ReadLine());

            SinhVien[] a = new SinhVien[n];

            nhapMang(n, a);
            Console.WriteLine("-------- DANH SÁCH SINH VIÊN ----------");
            xuatMang(n, a);

            Console.WriteLine();
            Console.WriteLine($"-> Tổng số tuổi: {tongTuoi(n, a)}");

            Console.ReadLine();
        }
    }
}
/*
2
Nguyen Nhu Cong
20
true
Do Ngoc Giang
21
true

 */