using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CanBacHai
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            float a, epsilon;

            Console.WriteLine("Nhập a: ");
            a = float.Parse(Console.ReadLine());

            Console.WriteLine("Nhập epsilon: ");
            epsilon = float.Parse(Console.ReadLine());

            float xn = 1.0F;

            while (Math.Abs(xn * xn - a) > epsilon)
            {
                xn = (a / xn + xn) / 2;
            }

            Console.WriteLine("Căn bậc 2 của số {0} là: {1}", a, xn);

            Console.ReadLine();
        }
    }
}
