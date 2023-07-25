using Lab_05;
using System;

namespace MyApp // Note: actual namespace depends on the project name.
{
    public class Program
    {
        public static void _01_Program()
        {
            Program1 obj1 = new Program1();
            Console.WriteLine(obj1.add(2, 4, 4));
            Console.WriteLine(obj1.add(2, 4));
            Console.WriteLine(obj1.add(2.3, 4.4));
        }
        public static void _02_Program()
        {
            Program2 p2 = new Program2();
            p2.Area(2);
            p2.Area(2, 3);
        }
        public static void _03_Program()
        {
            Program3 p3 = new Program3();
            p3.Area(3);
            p3.Area(3,4);
            p3.Area(3.4);
        }
        public static void _04_Program()
        {
            ICICI a = new ICICI();
            a.CalculateIntrest(200000,5);
            HDFC b = new HDFC();
            a.CalculateIntrest(200000, 5);
            SBI c = new SBI();
            a.CalculateIntrest(200000, 5);
        }
        public static void _05_Program()
        {
            Wockhardt a = new Wockhardt();
            Gokul_Superspeciality b = new Gokul_Superspeciality();
            Appolo c = new Appolo();
            a.HospitalDetails();
            b.HospitalDetails();
            c.HospitalDetails();
        }
        public static void Main(string[] args)
        {
            //_01_Program();
            //_02_Program();
            //_03_Program();
            //_04_Program();
            _05_Program();
            
        }
    }
}