using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class SBI:RBI
    {
        double rate = 3;
        public override void CalculateIntrest(double p, double t)
        {
            Console.WriteLine("Intrest of SBI = "+(p * rate * t) / 100);
        }
    }
}
