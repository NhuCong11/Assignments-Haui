using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HeCoSo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            Console.Write("Nhập vào số nguyên N: ");
            int N = Convert.ToInt32(Console.ReadLine());

            Console.Write("Nhập vào hệ cơ số B: ");
            int B = Convert.ToInt32(Console.ReadLine());

            // Chuyển đổi số nguyên N từ hệ cơ số 10 sang hệ cơ số B bất kỳ.
            string convertedToBaseB = Convert.ToString(N, B);
            Console.WriteLine($"Số {N} trong hệ cơ số {B} là: {convertedToBaseB}");

            // Chuyển đổi một số N từ hệ cơ số B bất kỳ sang hệ cơ số 10.
            int convertedToBase10 = Convert.ToInt32(convertedToBaseB, B);
            Console.WriteLine($"Số {convertedToBaseB} trong hệ cơ số 10 là: {convertedToBase10}");

            Console.ReadLine();
        }
    }
}
