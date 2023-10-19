using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2._1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            float a, b;
            float c = 0F, s = 0F;

            do
            {
                Console.WriteLine("Nhập chiều dài: ");
                a = float.Parse(Console.ReadLine());
            } while (a < 0);

            do
            {
                Console.WriteLine("Nhập chiều rộng: ");
                b = float.Parse(Console.ReadLine());
            } while (b < 0) ;

            Console.WriteLine($"-> Chu vi : {(a + b) / 2}");
            Console.WriteLine($"-> Diện tích : {a * b}");

            Console.ReadLine();
        }
    }
}
