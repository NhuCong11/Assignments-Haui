using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace demo_kt
{
    internal class NhanVien : Person
    {
        private string maNV;
        private string chucVu;
        private double luongCoBan;

        public string MaNV { get { return maNV; } set { maNV = value; } }
        public string ChucVu { get { return chucVu; } set { chucVu = value; } }
        public double LuongCoBan { get { return luongCoBan; } set { luongCoBan = value; } }

        public override void nhap()
        {
            Console.Write("Nhập mã NV: ");
            MaNV = Console.ReadLine();
            Console.Write("Nhập họ tên: ");
            Name = Console.ReadLine();
            Console.Write("Nhập địa chỉ: ");
            Address = Console.ReadLine();
            Console.Write("Nhập chức vụ: ");
            ChucVu = Console.ReadLine();
            Console.Write("Nhập lương cơ bản: ");
            LuongCoBan = double.Parse(Console.ReadLine());
        }

        public int TinhHeSoCV(string chucVu)
        {
            if (chucVu == "Giam doc")
            {
                return 10;
            } else if (chucVu == "Truong phong" || chucVu == "Pho giam doc")
            {
                return 6;
            } else if (chucVu == "Pho phong")
            {
                return 4;
            }else {
                return 2;
            }
        }
    }
}
