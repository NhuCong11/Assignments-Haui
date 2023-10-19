using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TongChuoi
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n, s1 = 0;
            float s2 = 0F;

            Console.Write("Nhập n: ");
            n = int.Parse(Console.ReadLine());

            for (int i = 1; i <= n; i++)
            {
                s1 += i;
            }

            Console.WriteLine("a. S = {0}", s1);

            for (int i = 1; i <= n; i++)
            {
                s2 += 1 / i;
            }

            Console.WriteLine("b. S = {0}", s2);

            Console.ReadLine();
        }
    }
}
