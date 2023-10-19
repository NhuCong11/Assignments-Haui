using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mang
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            // Khai báo mảng 1 chiều
            int[] a;
            // Khởi tạo mảng 1 chiều 100 phần tử
            a = new int[100];

            // Khai báo mảng 2 chiều
            int[,] b;
            // Khởi tạo mảng 2 chiều 3 dòng 2 cột
            b = new int[3, 2];

            // Khai báo mảng răng cưa với 3 hàng có độ dài khác nhau
            int[][] c = new int[3][];
            c[0] = new int[3]; // số cột hàng 1
            // ...

            Console.ReadLine();
        }
    }
}