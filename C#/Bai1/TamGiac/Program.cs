using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Struct_NgoaiLe
{
    public struct Product
    {
        public string name;
        public double price;

        public void SetInfo()
        {
            Console.WriteLine("Nhập vào tên sản phẩm: ");
            name = Console.ReadLine();

            Console.WriteLine("Nhập vào giá sản phẩm: ");
            price = double.Parse(Console.ReadLine());
        }
        public void GetInfo()
        {
            Console.WriteLine($"Tên sản phẩm {name}, giá: {price}");
        }

        public Product(string _name, double _price)
        {
            name = _name;
            price = _price;
        }
    }

    internal class Program
    {

        // Kiểu liệt kê
        enum HOCLUC { Kem, Trung, Kha, Gioi}

        // ngoại lệ Exception
        static void Resgiter(string name, int age)
        {
            if (string.IsNullOrEmpty(name))
            {
                Exception exception = new Exception("Tên phải khác rỗng");
                throw exception;
            }

            if (age < 18 || age > 100)
            {
                throw new Exception("Tuổi không hợp lệ, phải >=18 và <100");
            }
            // ...
            Console.WriteLine($"Xin chào {name} ({age})");
        }
        static void Main(string[] args)
        { 
            Console.OutputEncoding = Encoding.UTF8;

            Product sp1 = new Product("Sách", 30);


            ///sp1.SetInfo();
            ///sp1.GetInfo();

            int a = 5;
            int b = 0;

            /*/*
            try
            {
                Console.WriteLine(a / b);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
                Console.WriteLine("Error!");
            }

            Console.WriteLine("Kết thúc");

            */

            try
            {
                Resgiter(null, 20);
            }
            catch (Exception e) 
            {
                Console.WriteLine(e.Message);
            }

            Console.ReadLine();
        }
    }
}
