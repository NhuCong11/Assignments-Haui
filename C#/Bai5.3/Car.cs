using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._3
{
    public class Car : Vehicles
    {
        private int _seats;

        public int Seats { get { return _seats; } set { _seats = value; } }

        public Car() : base() {}

        public Car(string id, string maker, string model, int year, string type, int seats) : base(id, maker, model, year, type)
        {
            Seats = seats;
        }

        public override string NienHanSudung()
        {
            if (Seats < 9)
                return "Không áp dụng";
            else
                return "30 năm";
        }
        public override string ToString()
        {
            return $"ID: {Id}, Maker: {Maker}, Model: {Model}, Year: {Year}, Type: {Type}, Seats: {Seats}";
        }
    }
}
