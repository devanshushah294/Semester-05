using ExexptionHandling;
using System;

namespace MyApp // Note: actual namespace depends on the project name.
{
    internal class Program
    {
        public static void _01_DevideByZero()
        {
            Console.WriteLine("Enter the number");
            int a = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the number");
            int b = Convert.ToInt32(Console.ReadLine());
            try
            {
                double c = a / b;
                Console.WriteLine(c);
            }
            catch (Exception)
            {
                Console.WriteLine("Devide by Zero exeption occured!!");
            }
        }
        public static void _02_ArrayIndexOutOfBound()
        {
            int[] arr = new int[5];
            try
            {
                for (int i = 0; i < arr.Length + 1; i++)
                {
                    Console.WriteLine("Enter the number :");
                    arr[i] = Convert.ToInt32(Console.ReadLine());
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Array index out of bound");
            }


        }
        public static void _03_IsNotEven()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            try 
            {
                if (a % 2 == 0)
                {
                    Console.WriteLine("Nice! Number is even");
                }
                else {
                    throw new Exception("Not Even");
                } 
                    }
            catch (Exception) 
            {
                Console.WriteLine("ohhh!!Number is not even"); 
            }
        }
        public static void _05_InterfaceDemo() 
        {
            Result obj1 = new Result();
            obj1.Addition(2,5);
            obj1.Subtraction(5,2);

        }
        public static void _04_AbstractDemo()
        {
            Calculate a = new Calculate();
            a.SumOfTwo(2, 3);
            a.SumOfThree(4, 5, 6);
        }
        public static void _06_ShapeDemo() 
        { 
            Program07 a = new Program07();
            a.Circle(23);
            a.Square(23);
            a.Triangle(23, 34);

        } 
        public static void _09_LongestWordInString()
        {
            Console.WriteLine("Enter the string");
            string str = Console.ReadLine();
            String[] arr = str.Split(" ");
            string longestString = "";
            foreach(string i in arr)
            {
                if (i.Length > longestString.Length)
                {
                    longestString = i;
                }
            }
            Console.WriteLine("Longest Word is " + longestString);
        }
        public static void _10_ChangeCase()
        {
            Console.WriteLine("Enter the string :");
            string str = Console.ReadLine();
            str = str.ToUpper();
            Console.WriteLine(str);
            str = str.ToLower();
            Console.WriteLine(str);
        }
        public static void Main(string[] args)
        {
            //_01_DevideByZero
            //_02_ArrayIndexOutOfBound();
            //_03_IsNotEven();
            //_04_AbstractDemo();
            //_05_InterfaceDemo();
            //_06_ShapeDemo();

            //_09_LongestWordInString();
            _10_ChangeCase();
            Console.ReadLine();
        }
    }
}