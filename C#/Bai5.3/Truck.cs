using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._3
{
    public class Truck : Vehicles
    {
        private int _load;

        public int Load { get { return _load; } set { _load = value; } }

        public Truck() { }

        public Truck(string id, string maker, string model, int year, string type, int load) : base(id, maker, model, year, type)
        {
            this._load = load;
        }
        public override string ToString()
        {
            return $"ID: {Id}, Maker: {Maker}, Model: {Model}, Year: {Year}, Type: {Type}, Load: {Load}";
        }
    }
}
