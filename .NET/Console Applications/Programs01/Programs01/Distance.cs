using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Distance
    {
        double dist1;
        double dist2;
        double dist3;
        public Distance(double dist1, double dist2)
        {
            this.dist1 = dist1;
            this.dist2 = dist2;
        }
        public void AddAndSetDist3()
        {
            this.dist3 = this.dist1 + this.dist2;
            Console.WriteLine(this.dist3);
        }
    }
}
