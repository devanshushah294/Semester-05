using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExexptionHandling
{
    class Result:Calculate1
    {
        public void Addition(int a,int b) 
        {
            int c = a + b;
            Console.WriteLine(a + "+" + b + "=" + c);
        }
        public void Subtraction(int a,int b)
        {
            int c = a - b;
            Console.WriteLine(a + "-" + b + "=" + c);
        }
    }
}
