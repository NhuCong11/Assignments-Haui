using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XepLoaiHS
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string hoTen;
            float diem;

            Console.WriteLine("Nhập vào họ tên: ");
            hoTen = Console.ReadLine();

            Console.WriteLine("Nhập vào điểm: ");
            diem = float.Parse(Console.ReadLine());

            Console.WriteLine("-> Họ tên: {0}", hoTen.ToUpper());

            if (diem >= 8)
            {
                Console.WriteLine("-> Xếp loại: Giỏi");
            }
            else if (diem < 8 && diem >= 6.5F)
            {
                Console.WriteLine("-> Xếp loại: Khá");
            }
            else if (diem < 6.5F && diem >= 5)
            {
                Console.WriteLine("-> Xếp loại: Trung bình");
            }
            else
            {
                Console.WriteLine("-> Xếp loại: Yếu");
            }

            Console.ReadLine();
        }
    }
}
