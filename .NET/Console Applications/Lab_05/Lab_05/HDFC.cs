using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class HDFC:RBI
    {
        double rate = 5;
        public override void CalculateIntrest(double p, double t)
        {
            Console.WriteLine("Intrest of HDFC = "+(p * rate * t) / 100);
        }
    }
}
