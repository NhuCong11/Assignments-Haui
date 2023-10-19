using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TapTin
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string fileMatrix = @"Matrix.txt";

            try
            {
                var lines = File.ReadAllLines(fileMatrix).ToList();

                int rows = int.Parse(lines[0]);
                int cols = int.Parse(lines[1]);

                int[][] matrix = new int[rows][];
                int sum = 0;

                for (int i = 0; i < rows; i++)
                {
                    matrix[i] = lines[i + 2].Split(' ').Select(int.Parse).ToArray();
                    sum += matrix[i].Sum();
                }

                lines.Add("Tổng các phần tử của ma trận: " + sum);
                File.WriteAllLines(fileMatrix, lines);
            }
            catch (NullReferenceException)
            {
                Console.WriteLine("File không được rỗng!");
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
