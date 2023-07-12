using ConsoleApplication1;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class Student
    {
        
        String Enrollment_No;
        String Student_Name;
        int Semester;
        double CPI;
        double SPI;
        public Student(String Enrollment_No, String Student_Name, int Semester, double CPI, double SPI)
        {
            this.Enrollment_No = Enrollment_No;
            this.Student_Name = Student_Name;
            this.Semester = Semester;
            this.CPI = CPI;
            this.SPI = SPI;
        }
        public void DisplayStudentDetails()
        {
            Console.WriteLine("Enrollment number : "+Enrollment_No);
            Console.WriteLine("Student Name : "+Student_Name);
            Console.WriteLine("Semester : " + Semester);
            Console.WriteLine("CPI : " + CPI);
            Console.WriteLine("SPI : " + SPI);
        }

    }
}
