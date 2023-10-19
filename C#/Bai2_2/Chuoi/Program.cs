using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chuoi
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            string input;

            // a.
            Console.WriteLine("Nhập vào chuỗi: ");
            input = Console.ReadLine();

            foreach (char c in input)
            {
                Console.WriteLine(c);
            }

            // b.
            Console.WriteLine("Nhập vào một chuỗi gồm các ký tự và khoảng trắng:");
            input = Console.ReadLine();
            string[] words = input.Split(new[] {' '}, StringSplitOptions.RemoveEmptyEntries);
            foreach (string word in words)
            {
                Console.WriteLine(word);
            }

            // c.
            Console.WriteLine("Nhập vào một chuỗi:");
            input = Console.ReadLine();

            var charCount = new Dictionary<char, int>();
            foreach (char c in input)
            {
                if (charCount.ContainsKey(c))
                {
                    charCount[c]++;
                }
                else
                {
                    charCount[c] = 1;
                }
            }
            foreach (KeyValuePair<char, int> pair in charCount)
            {
                Console.WriteLine($"Ký tự '{pair.Key}' xuất hiện {pair.Value} lần");
            }

            Console.ReadLine();
        }
    }
}
