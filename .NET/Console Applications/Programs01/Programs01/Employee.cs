using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Employee:Salary,Gross
    {
        public Employee() : base(23000,34100,56900) {
            Console.WriteLine("hello");
        }
        public void Gross_Sal()
        {
            Console.WriteLine(123);
        }

    }
}
