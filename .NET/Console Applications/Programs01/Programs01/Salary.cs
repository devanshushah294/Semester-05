using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Salary
    {
        double HRA;
        double TA;
        double DA;

        public Salary(double HRA, double TA,double DA)
        {
            this.HRA = HRA;
            this.TA = TA;
            this.DA = DA;
        }
        public void DisplaySalary()
        {
            Console.WriteLine("The Salary is : {0}",HRA+DA+TA);
        }
    }
}
