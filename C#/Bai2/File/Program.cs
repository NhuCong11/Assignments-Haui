using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace File_Copy
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string file1 = @"c:\source\file.txt";
            string file2 = @"d:\target\file.txt";

            try
            {
                File.Copy(file1, file2, true);
                Console.WriteLine("Copy file thành công!");
            }
            catch(Exception e) {
                Console.WriteLine("Copy file không thành công!!!");
                Console.WriteLine(e.Message);
            }



            string sourceFile = @"C:\source\file.txt";
            string destinationFile = @"D:\target\file.txt";

            try
            {
                using (StreamReader sr = new StreamReader(sourceFile))
                {
                    using (StreamWriter sw = new StreamWriter(destinationFile))
                    {
                        string line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            sw.WriteLine(line);
                        }
                    }
                }
                Console.WriteLine("Copy file thành công!");
            }
            catch (Exception e)
            {
                Console.WriteLine("Copy file không thành công!!!");
                Console.WriteLine(e.Message);
            }

            Console.ReadLine();
        }
    }
}
