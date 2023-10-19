using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._2
{
    internal class Program
    {
        static void Main(string[] args)

        {
            Console.OutputEncoding = Encoding.UTF8;

            Employee nv = new Employee();
            nv.Input();
            nv.Output();

            Console.ReadLine();
        }
    }
}
