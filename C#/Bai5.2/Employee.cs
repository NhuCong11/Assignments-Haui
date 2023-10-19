using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._2
{
    internal class Employee
    {
        private string _id;
        private string _name;
        private int _age;
        private int _workingdays;
        private double _salary;

        const int PRICE = 50;

        public string Id { get { return _id; } set { _id = value; } }
        public string Name { get { return _name; } set { _name = value; } }
        public int Age { get { return _age; } set { _age = value; } }
        public int Workingdays { get { return _workingdays; } set { _workingdays = value; } }
        public double Salary { 
            get { 
                _salary = _workingdays * PRICE;
                return _salary;
            } 
        }

        public void Input()
        {
            Console.Write("Nhập ID: ");
            Id = Console.ReadLine();
            Console.Write("Nhập name: ");
            Name = Console.ReadLine(); 
            Console.Write("Nhập age: ");
            Age = int.Parse(Console.ReadLine());
            Console.Write("Nhập workingdays: ");
            Workingdays = int.Parse(Console.ReadLine()); 
        }

        public void Output()
        {
            Console.WriteLine("----- THÔNG TIN -----");
            Console.WriteLine($"ID: {Id}");
            Console.WriteLine($"Name: {Name}");
            Console.WriteLine($"Age: {Age}");
            Console.WriteLine($"Workingdays: {Workingdays}");
            Console.WriteLine($"Salary: {Salary}");
        }
    }
}
