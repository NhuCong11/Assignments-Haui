using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DanhSach1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            List<double> numbers = new List<double>();

            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine("Nhập số thứ {0}: ", i + 1);
                numbers.Add(double.Parse(Console.ReadLine()));
            }

            // sắp xếp ds
            numbers.Sort();
            Console.WriteLine("Danh sách sau khi sắp xếp:");
            foreach (double num in numbers)
            {
                Console.WriteLine(num);
            }

            // xóa số âm
            numbers.RemoveAll(num => num < 0);
            Console.WriteLine("Danh sách sau khi xóa số âm:");
            foreach (double num in numbers)
            {
                Console.WriteLine(num);
            }

            // chèn
            Console.WriteLine("Nhập vào một số x bất kỳ:");
            double x = double.Parse(Console.ReadLine());

            // Chèn x vào vị trí đúng thứ tự
            int index = numbers.BinarySearch(x);
            if (index < 0)
                index = ~index;

            numbers.Insert(index, x);

            // In ra danh sách đã bổ sung
            Console.WriteLine("Danh sách sau khi đã bổ sung:");
            foreach (double num in numbers)
            {
                Console.WriteLine(num);
            }

            Console.ReadLine();
        }
    }
}
