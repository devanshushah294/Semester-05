using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Rectangle
    {
        double width;
        double height;
        public Rectangle(double a, double b)
        {
            this.height = a;
            this.width = b;
            Console.WriteLine("Area = "+calculateArea());
        }
        public double calculateArea()
        {
            return height * width;
        }
    }
}
