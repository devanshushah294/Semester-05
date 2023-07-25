using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class Program3
    {
        public void Area(int a)
        {
            Console.WriteLine("Area is {0}", a * a);
        }
        public void Area(double a, double b)
        {
            Console.WriteLine("Area is {0}", a * b);
        }
        public void Area(double a)
        {
            Console.WriteLine("Area is "+Math.Round(Math.PI * a * a,2));
        }
    }
}
