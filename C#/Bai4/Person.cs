using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Bai4
{
    internal class Person
    {
        private string _id;
        private string _name;
        private int _age;
        private string _email;
        private string _address;

        public string Id { get { return _id; } set { _id = value;  } }
        public string Name { get { return _name; } set { _name = value;  } }
        public int Age { get { return _age; } set { _age = value;  } }
        public string Email { get { return _email; } set { _email = value;  } }
        public string Address { get { return _address; } set { _address = value;  } }

        public void CheckAge()
        {
            if (Age >= 18)
            {
                Console.WriteLine("Bạn đủ tuổi bầu cử");
            } else
            {
                Console.WriteLine("Bạn còn nhỏ");
            }
        }

        public void Input()
        {
            Console.Write("Nhập ID: ");
            Id = Console.ReadLine();
            Console.Write("Nhập name: ");
            Name = Console.ReadLine();
            Console.Write("Nhập tuổi: ");
            Age = int.Parse(Console.ReadLine());
            Console.Write("Nhập email: ");
            Email = Console.ReadLine();
            Console.Write("Nhập địa chỉ: ");
            Address = Console.ReadLine();
        }

        public void Output()
        {
            Console.WriteLine("----- Thông tin Person -----");
            Console.WriteLine($"ID: {Id}");
            Console.WriteLine($"Name: {Name}");
            Console.WriteLine($"Age: {Age}");
            Console.WriteLine($"Email: {Email}");
            Console.WriteLine($"Address: {Address}");
        }
    }
}
