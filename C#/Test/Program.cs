using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            Employee emp = new Employee();

            Console.WriteLine("Nhập vào ID: ");
            emp.id = Console.ReadLine();
            Console.WriteLine("Nhập vào tên: ");
            emp.name = Console.ReadLine();
            Console.WriteLine("Nhập vào tuổi: ");
            emp.age = int.Parse(Console.ReadLine());

            Console.WriteLine("----- Thông tin: -----");
            Console.WriteLine($"ID: {emp.id}");
            Console.WriteLine($"Name: {emp.name}");
            Console.WriteLine($"Age: {emp.age}");

            Console.WriteLine(emp);
            Console.ReadLine();
        }
    }
}
