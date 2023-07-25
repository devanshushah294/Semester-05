using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class RBI
    {
        double rate = 2;
        public virtual void CalculateIntrest(double p,double t)
        {
            Console.WriteLine("Intrest of RBI = " + (p * rate * t) / 100);
        }
    }
}
