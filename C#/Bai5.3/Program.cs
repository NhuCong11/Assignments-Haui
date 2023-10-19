using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            int luachon = 0;
            List <Car> cars = new List <Car> ();
            do
            {
                Console.WriteLine("----- MENU -----");
                Console.WriteLine("1. Nhập dữ liệu");
                Console.WriteLine("2. Hiển thị dữ liệu");
                Console.WriteLine("3. Tìm kiếm theo id");
                Console.WriteLine("4. Tìm kiếm theo maker");
                Console.WriteLine("5. Sắp xếp theo theo model");
                Console.WriteLine("5. Sắp xếp theo theo model");
                Console.WriteLine("6. Sắp xếp theo year");
                Console.WriteLine("7. Kết thúc");
                Console.Write("Nhập lựa chọn: ");
                luachon = int.Parse(Console.ReadLine());

                switch (luachon)
                {
                    case 1:
                        Nhap();
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        break;
                    case 6:
                        break;
                    case 7:
                        Console.WriteLine("-> Chương trình kết thúc!!!");
                        break;
                    default:
                        Console.WriteLine("Lựa chọn không hợp lệ!");
                        break;
                }
            } while (luachon != 0);

            Console.ReadLine();
        }

        static void Nhap()
        {
            string luachon = "";
            while (luachon != "c")
            {
                Console.WriteLine("a. Nhập dữ liệu cho 1 đối tượng car");
                Console.WriteLine("b. Nhập dữ liệu cho 1 đối tượng truck");
                Console.WriteLine("c. Thoát");
                Console.Write("Nhập lựa chọn: ");
                luachon = Console.ReadLine();

                switch (luachon)
                {
                    case "a":
                        Car a = new Car();
                        Console.Write("Nhập ID: ");
                        a.Id = Console.ReadLine();
                        Console.Write("Nhập hãng sản xuất: ");
                        a.Maker = Console.ReadLine();
                        Console.Write("Nhập tên xe: ");
                        a.Model = Console.ReadLine();
                        Console.Write("Nhập năm sản xuất: ");
                        a.Year = int.Parse(Console.ReadLine());
                        Console.Write("Nhập loại xe: ");
                        a.Type = Console.ReadLine();
                        Console.Write("Nhập số chỗ ngồi: ");
                        a.Seats = int.Parse(Console.ReadLine());
                        break;
                    case "b":
                        Truck b = new Truck();
                        Console.Write("Nhập ID: ");
                        b.Id = Console.ReadLine();
                        Console.Write("Nhập hãng sản xuất: ");
                        b.Maker = Console.ReadLine();
                        Console.Write("Nhập tên xe: ");
                        b.Model = Console.ReadLine();
                        Console.Write("Nhập năm sản xuất: ");
                        b.Year = int.Parse(Console.ReadLine());
                        Console.Write("Nhập loại xe: ");
                        b.Type = Console.ReadLine();
                        Console.Write("Nhập tải trọng: ");
                        b.Load = int.Parse(Console.ReadLine());
                        break;
                }
            }
        }
    }
}
