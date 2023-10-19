using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2._7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            /**
            string path = "Bai2-7.txt";
            string fileCopy = "Bai2.7";

            string content = "Xin chào các bạn";
            string content1 = " Hello!";

            File.WriteAllText(path, content); // ghi lại toàn bộ
            File.AppendAllText(path, content1); // chèn tiếp vào file
            File.Copy(path, fileCopy); // copy file
            File.Delete(path); // xóa file
            */

            /**
            string path = "data.dat";
            var stream = new FileStream(path: path, FileMode.OpenOrCreate);

            // Lưu dữ liệu
            byte[] buffer = { 1, 2, 3 };
            int offset = 0; // vị trí bắt đầu lưu
            int count = buffer.Length; // số phần tử lưu
            stream.Write(buffer, offset, count);

            // Dọc dữ liệu
            stream.Read(buffer, offset, count);
            */


            /**
            try {
                string s = File.ReadAllText(path);
                Console.WriteLine(s);
            }
            catch (ArgumentNullException ane)
            {
                Console.WriteLine(ane.Message);
                Console.WriteLine("Duong dan file phai khac null!");

            }
            catch (FileNotFoundException fnf)
            {
                Console.WriteLine(fnf.Message);
                Console.WriteLine("File khong ton tai!");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            */

            // int, double -> bytes
            int a = 6;
            var bytes = BitConverter.GetBytes(a);

            // bytes -> int, double ...
            Console.WriteLine(BitConverter.ToInt32(bytes, 0));

            Console.ReadLine();
        }
    }
}
