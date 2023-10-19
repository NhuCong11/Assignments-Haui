using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TapTin1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string input = "input.txt";
            string output = "output.txt";

            try
            {
                using (StreamReader sr = new StreamReader(input))
                {
                    using (StreamWriter sw = new StreamWriter(output))
                    {
                        string line;
                        int wordCount = 0;

                        while ((line = sr.ReadLine()) != null)
                        {
                            string upperCasseLine = line.ToUpper();

                            wordCount += upperCasseLine.Split(new char[] { ' ', '\t' }, StringSplitOptions.RemoveEmptyEntries).Length;

                            sw.WriteLine(upperCasseLine);
                        }

                        sw.WriteLine($"Số từ trong file: {wordCount}");
                    }

                    Console.WriteLine("Đã hoàn thành việc chuyển đổi văn bản và lưu vào file mới.");
                }
            }
            catch (FileNotFoundException)
            {
                Console.WriteLine("File không tồn tại!");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            Console.ReadLine();
        }
    }
}
