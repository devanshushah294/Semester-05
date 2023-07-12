using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Candidate
    {
        int CandidateID;
        String CandidateName;
        int CandidateAge;
        double CandidateWeight;
        double CandidateHeight;
        public void setDetials()
        {
            Console.WriteLine("Enter the Name");
            this.CandidateName = Console.ReadLine();
            Console.WriteLine("Enter the age");
            this.CandidateAge = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the Weight");
            this.CandidateWeight= Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter the Height");
            this.CandidateHeight = Convert.ToDouble(Console.ReadLine());
        }
        public void displayDetails() {
            Console.WriteLine("Name is " + this.CandidateName);
            Console.WriteLine("Age is " + this.CandidateAge);
            Console.WriteLine("Weight is " + this.CandidateWeight);
            Console.WriteLine("Height is " + this.CandidateHeight);
        }
    }
}
