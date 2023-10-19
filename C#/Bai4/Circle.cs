using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Circle
    {
        private double _radius;

        public double Radius { get { return _radius; } set { _radius = value; } }

        public Circle() {
            Radius = 0f;
        }

        public Circle(double radius)
        {
            Radius = radius;
        }

        public string Area()
        {
            return (Math.PI * Math.Pow(Radius, 2)).ToString("F3");
        }

        public string Perimeter()
        {
            return (2 * Math.PI * Radius).ToString("F3");
        }
    }
}
