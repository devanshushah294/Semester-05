using Programs01;
using System;
using System.Collections;
using System.ComponentModel;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        public static void LeapYear()
        {
            Console.WriteLine("Enter the year");
            int year = Convert.ToInt32(Console.ReadLine());
            if (year % 400 == 0)
            {
                Console.WriteLine("Yes a leap year");
            }
            else if (year % 100 == 0) { Console.WriteLine("Not a leap year"); }
            else if (year % 4 == 0)
            {
                Console.WriteLine("Yes a Leap Year");
            }
            else
            {
                Console.WriteLine("Not a Leap year");
            }
        }
        public static void Pattern1()
        {
            Console.WriteLine("Enter the Number ");
            int a = Convert.ToInt32(Console.ReadLine());
            int temp = 0;
            for (Int32 i = 1; i < a; i += temp)
            {
                temp++;
            }
            Console.ReadLine();
        }
        public static void MultiplicationTable()
        {
            int n = Convert.ToInt32(Console.ReadLine());
            for (Int32 i = 0; i < 10; i++)
            {
                Console.WriteLine(n + " * " + i + 1 + " = " + n * (i + 1));
            }
        }
        public static void _02_StaffWaloProgram() {
            ArrayList arr = new ArrayList();
            for (int i = 0; i < 3; i++)
            {
                Staff obj = new Staff();
                obj.SetDetails();
                arr.Add(obj);
            }
            foreach (Staff a in arr)
            {
                if (a.post == "HOD")
                {
                    Console.WriteLine(a.name);
                }
            }
        }
        public static void _03_BankAccountWaloProgram()
        {
            BankAccount account = new BankAccount();
            account.GetAccountDetails();
            account.DisplayAccountDetails();
        }
        public static void _04_StudentWaloProgram()
        {
            Console.WriteLine("Enter enrollment number");
            String Enrollment_No = Console.ReadLine();
            Console.WriteLine("Enter the Students name");
            String Student_Name = Console.ReadLine();
            Console.WriteLine("Enter the Semester ");
            int Semester = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the CPI");
            double CPI = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter the SPI");
            double SPI = Convert.ToDouble(Console.ReadLine());
            Student stu = new Student(Enrollment_No, Student_Name, Semester, CPI, SPI);
            stu.DisplayStudentDetails();
        }
        public static void _06_DistanceProgram()
        {
            Console.WriteLine("Enter the distance 1 : ");
            double dist1 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter the distance 2 : ");
            double dist2 = Convert.ToDouble(Console.ReadLine());
            Distance a = new Distance(dist1,dist2);
            a.AddAndSetDist3();
        }
        public static void _07_RectangleWaloProgram()
        {
            Console.WriteLine("Enter the height");
            double height = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter the width");
            double width = Convert.ToDouble(Console.ReadLine());
            Rectangle a = new Rectangle(height, width);
        }
        public static void _08_TableWaloProgram()
        {
            Table abc = new Table(24, 240, "Wood", 3400);
            abc.PrintDetails();
            Console.ReadLine();
        }
        public static void Main(string[] args)
        {
            Employee a = new Employee();
            a.DisplaySalary();
        }
    }
}
