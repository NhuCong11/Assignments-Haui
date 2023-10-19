using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fibonacci
{
    internal class Program
    {

        static int Fibonacci(int n)
        {
            if ( n <= 1 )
            {
                return n;
            } else
            {
                return Fibonacci(n - 1) + Fibonacci(n - 2);
            }
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int n;
            int a = 0, b = 1, c;
            

            Console.WriteLine("Nhập vào n: ");
            n = int.Parse(Console.ReadLine());

            /*
            Console.WriteLine("-> {0} số đầu tiên của dãy Fibonacci: ", n);
            Console.Write("{0} {1}", a, b);
            for (int i = 2; i < n; i++)
            {
                c = a + b;
                Console.Write(" {0}", c);
                a = b;
                b = c;
            }
            */

            Console.WriteLine("-> {0} số đầu tiên của dãy Fibonacci: ", n);

            for (int i = 0; i < n; i++)
            {
                Console.Write(Fibonacci(i) + " ");
            }

            Console.ReadLine();
        }
    }
}
