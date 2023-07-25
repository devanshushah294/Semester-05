using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_05
{
    public class Hospital
    {
        public virtual void HospitalDetails()
        {

        }
    }
    public class Appolo:Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Appolo Hospital");
        }
    }
    public class Wockhardt:Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Wockhardt Hospital");
        }
    }
    public class Gokul_Superspeciality:Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Gokul_Supersoeciality Hospital");
        }
    }
}
