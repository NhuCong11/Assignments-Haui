using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace demo_kt
{
    public class Person
    {
        private string name;
        private string address;

        public string Name { get { return name; } set {  name = value; } }  
        public string Address { get { return address; } set { address = value; } }  

        public virtual void nhap()
        {
            Console.Write("Nhập họ tên: ");
            Name = Console.ReadLine();
            Console.Write("Nhập địa chỉ: ");
            Address = Console.ReadLine();
        }
    }
}
