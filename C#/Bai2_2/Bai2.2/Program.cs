using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2._2
{
    internal class Program
    {

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

        private static int timMax(int n, int[] a)
        {
            int max = a[0];

            for (int i = 0; i < n; i++)
            {
                if (a[i] > max)
                {
                    max = a[i];
                }
            }

            return max;
        }

        private static int timMin(int n, int[] a)
        {
            int min = a[0];

            for (int i = 0; i < n; i++)
            {
                if (a[i] < min)
                {
                    min = a[i];
                }
            }

            return min;
        }

        private static int tinhTong(int n, int[] a)
        {
            int tong = 0;

            for (int i = 0; i < n; i++)
            {
                tong += a[i];
            }

            return tong;
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
            Console.WriteLine($"-> Max: {timMax(n, a)}");
            Console.WriteLine($"-> Min: {timMin(n, a)}");

            Console.WriteLine($"-> Tổng các phần tử: {tinhTong(n, a)}");

            Console.ReadLine();
        }
    }
}
