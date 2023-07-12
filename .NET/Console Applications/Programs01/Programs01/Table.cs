using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Table:Furniture
    {
        double Height;
        double surface_area;
        public Table(double Height,double surface_area,string material,double price) : base(material, price)
        {
            this.Height = Height;
            this.surface_area = surface_area;
        }
        public void PrintDetails()
        {
            Console.WriteLine(price);
            Console.WriteLine(Height);
            Console.WriteLine(material);
            Console.WriteLine(surface_area);
        }
    }
}
