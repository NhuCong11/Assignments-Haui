using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiaiThua
{
    internal class Program
    {

        static int GT(int n)
        {
            if (n == 0 || n == 1)
            {
                return 1;
            } else
            {
                return GT(n - 1) * n;
            }
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n;
            int gt = 1;

            do
            {
                Console.WriteLine("Nhập vào n: ");
                n = int.Parse(Console.ReadLine());
            } while (n < 0);

            if (n > 2)
            {
                for (int i = n; i > 0; i--)
                {
                    gt *= i;
                }
            }

       
            //Console.WriteLine("Giai thừa của {0} là: {1}", n, gt);
            Console.WriteLine("Giai thừa của {0} là: {1}", n, GT(n));

            Console.ReadLine();
        }
    }
}
