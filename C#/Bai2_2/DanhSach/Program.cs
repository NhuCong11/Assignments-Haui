using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DanhSach
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            List<string> ThanhPho = new List<string>() { "Hà Nội", "Đà Nẵng", "Hồ Chí Minh", "Cần Thơ", "Hải Phòng" };

            // Sắp xếp danh sách theo thứ tự tăng dần và in ra danh sách đã sắp xếp.
            ThanhPho.Sort();
            Console.WriteLine("Danh sách thành phố sau khi sắp xếp:");
            foreach (string tp in ThanhPho)
            {
                Console.WriteLine(tp);
            }

            // Xóa thành phố "Hà Nội" khỏi danh sách.
            ThanhPho.Remove("Hà Nội");

            // Thêm 5 thành phố lớn khác vào danh sách.
            ThanhPho.AddRange(new List<string>() { "Đà Lạt", "Nha Trang", "Vũng Tàu", "Huế", "Quảng Ninh" });

            // In ra toàn bộ danh sách.
            Console.WriteLine("Danh sách thành phố sau khi cập nhật:");
            foreach (string tp in ThanhPho)
            {
                Console.WriteLine(tp);
            }

            Console.ReadLine();
        }
    }
}
