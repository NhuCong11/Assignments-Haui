using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DanhSach
{
    internal class Program
    {
        static void nhapMang(ref int n, ref int[] a)
        {
            Console.WriteLine("Nhập vào n: ");
            n = int.Parse(Console.ReadLine());

            a = new int[n];

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Nhập vào a[{i}]: ");
                a[i] = int.Parse(Console.ReadLine());
            }
        }


        static void xuatMang(int n, int[] a)
        {
            Console.WriteLine("Mảng : ");
            for (int i = 0; i < n; i++)
            {
                Console.Write($"{a[i]} ");
            }
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n = 0;
            int[] a = null;

            nhapMang(ref n, ref a);

            xuatMang(n, a);

            Console.ReadLine();
        }
    }
}
