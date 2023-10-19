using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Employee
    {
        public string id { get; set; }
        public string name { get; set; }
        public int age { get; set; }
        public Employee(string id, string name, int age)
        {
            this.id = id;
            this.name = name;
            this.age = age;
        }
        public Employee()
        {
            id = "SV01";
            name = "Nguyễn Như Công";
            age = 20;
        }

        // phương thức trả về xâu ký tự đại diện cho đối tượng
        public override string ToString()
        {
            return "id:" + id + ", name:" + name + ", age:" + age;
        }
    }
}
