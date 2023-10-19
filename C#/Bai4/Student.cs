using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Student
    {
        private string _id;
        private string _name;
        private int _mark;
        private int _scholarship;
        public string Id { get { return _id; } set { _id = value; } }
        public string Name { get { return _name; } set { _name = value; } }
        public int Mark { get { return _mark; } set { _mark = value; } }
        public int Scholarship
        { 
            get {
                if (Mark > 8)
                {
                    _scholarship = 500;
                }
                else if (Mark >= 7 && Mark <= 8)
                {
                    _scholarship = 300;
                }
                else
                {
                    _scholarship = 0;
                }
                return _scholarship; 
            }  
        }       
        public Student()
        {
            Id = "ID deafult";
            Name = "Name deafult";
            Mark = 0;
        }
        public Student(string id)
        {
            Id = id;
            Name = "Name deafult";
            Mark = 0;
        }
        public Student(string id, string name, int mark)
        {
            Id = id;
            Name = name;
            Mark = mark;
        }

        public override string ToString()
        {
            return $"ID: {Id}, Name: {Name}, Mark: {Mark}, Scholarship: {Scholarship}";
        }
    }
}
