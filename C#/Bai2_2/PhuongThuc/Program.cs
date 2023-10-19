using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhuongThuc
{
    internal class Program
    {
        static bool kTSNT(int n)
        {
            if (n <= 1)
                return false;
            for (int i = 2; i * i <= n; i++)
            {
                if (n % i == 0)
                {
                    return false;
                }
            }
            return true;
        }

        private static void nhapMang(int n, int[] a)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Nhập phân tử a[{i}]: ");
                a[i] = int.Parse(Console.ReadLine());
            }
        }

        private static void xuatMang(int n, int[] a)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write($"{a[i]} ");
            }
        }

        private static void kTMang(int n, int[] a)
        {
            Console.Write("-> Các số nguyên tố trong mảng: ");
            for (int i = 0; i < n; i++)
            {
               if (kTSNT(a[i]))
                {
                    Console.Write($"{a[i]} ");
                }
            }
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n;
            int[] a;

            Console.WriteLine("Nhập vào số lượng phần tử: ");
            n = int.Parse(Console.ReadLine());

            a = new int[n];
            nhapMang(n, a);

            Console.Write("-> Mảng đã nhập: ");
            xuatMang(n, a);

            Console.WriteLine();
            kTMang(n, a);

            Console.ReadLine();
        }
    }
}
