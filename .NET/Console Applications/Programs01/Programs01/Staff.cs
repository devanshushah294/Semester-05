using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Staff
    {
        public string name;
        public string post;
        public void SetDetails()
        {
            Console.WriteLine("Enter the Name");
            this.name = Console.ReadLine();
            Console.WriteLine("Enter the post");
            this.post = Console.ReadLine();
        }
    }
}
