using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._3
{
    public class Vehicles : Ivehicle
    {
        private string _id;
        private string _maker;
        private string _model;
        private int _year;
        private string _type;

        public string Id { get { return _id; } set { _id = value; } }
        public string Maker { get { return _maker; } set { _maker = value; } }
        public string Model { get { return _model; } set { _model = value; } }
        public int Year { get { return _year; } set { _year = value; } }
        public string Type { get { return _type; } set { _type = value; } }
        
        public Vehicles() { }

        public Vehicles(string id, string maker, string model, int year, string type)
        {
            this._id = id;
            this._maker = maker;
            this._model = model;
            this._year = year;
            this._type = type;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
                return false;

            Vehicles v = (Vehicles)obj;
            return (_id == v._id);
        }

        public override string ToString()
        {
            return $"ID: {Id}, Maker: {Maker}, Model: {Model}, Year: {Year}, Type: {Type}";
        }

        public virtual string NienHanSudung()
        {
            if (Model == "Xe tải")
            {
                return "20 năm";
            } else if (Model == "Xe chở người") {
                return "30 năm";
            } else
            {
                return "Không xác định";
            }
        }
    }
}
