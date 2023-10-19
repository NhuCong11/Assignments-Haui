using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5._1
{
    internal class ThisinhA
    {
        private string soBaoDanh;
        private string hoTen;
        private string diaChi;
        private float toan;
        private float ly;
        private float hoa;
        private float diemUT;
        private float tongDiem;

        public string SoBaoDanh
        {
            get { return soBaoDanh; }
            set { soBaoDanh = value; }
        }

        public string HoTen
        {
            get { return hoTen; }
            set { hoTen = value; }
        }

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }

        public float Toan
        {
            get { return toan; }
            set { toan = value; }
        }

        public float Ly
        {
            get { return ly; }
            set { ly = value; }
        }

        public float Hoa
        {
            get { return hoa; }
            set { hoa = value; }
        }

        public float DiemUuTien
        {
            get { return diemUT; }
            set { diemUT = value; }
        }
        public float TongDiem
        {
            get {
                tongDiem = toan + ly + hoa + diemUT;
                return tongDiem; 
            }
        }
    }
}
