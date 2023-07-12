using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExexptionHandling
{
    class Program07:Shape
    {
        public void Circle(int radius) 
        {
            double area = Math.PI* Math.Pow(radius,2);
            Console.WriteLine("Area of Circle = "+area);
        }
        public void Triangle(int height,int width)
        {
            double area = (0.5)*width*height;
            Console.WriteLine("Area of triangle = " + area);
        }
        public void Square(int side)
        {
            double area = Math.Pow(side,2);
            Console.WriteLine("Area of square = " + area);
        }
    }
}
