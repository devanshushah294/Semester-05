using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExexptionHandling
{
    class Calculate : Sum
    {
        public override void SumOfTwo(int a,int b) 
        {
            int sum = a + b;
            Console.WriteLine(a+"+"+b+"="+sum);
        }
        public override void SumOfThree(int a, int b,int c) 
        {
            int sum = a + b + c;
            Console.WriteLine(a + "+" + b +"+"+c+ "=" + sum);
        }
    }
}
