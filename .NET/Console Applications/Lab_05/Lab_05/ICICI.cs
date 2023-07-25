using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class ICICI:RBI
    {
        double rate = 4;
        public override void CalculateIntrest(double p,double t)
        {
            Console.WriteLine("Intrest of ICICI is"+(p * rate * t) / 100);
        }
    }
}
