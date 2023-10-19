using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            // Bài 1:
            /*
            Person a = new Person();
            a.Input();
            a.Output();
            a.CheckAge();
            */

            // Bài 2:
            /*
            Circle b = new Circle(3);
            Console.WriteLine($"Diện tích hình tròn: {b.Area()}");
            Console.WriteLine($"Chu vi hình tròn: {b.Perimeter()}");
            */

            // Bài 3:
            Student c = new Student();
            Student d = new Student("SV01");
            Student e = new Student("SV02", "Nguyen Nhu Cong", 9);

            Console.WriteLine(c.ToString());
            Console.WriteLine(d.ToString());
            Console.WriteLine(e.ToString());

            Console.ReadLine();
        }
    }
}
