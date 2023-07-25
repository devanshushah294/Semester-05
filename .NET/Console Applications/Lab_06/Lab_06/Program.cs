using Lab_06;
using System;
using System.Collections;

namespace MyApp // Note: actual namespace depends on the project name.
{
    public class Program
    {
        public static void _01_ArrayListDemo()
        {
            Program01 a = new Program01();
            while(true)
            {
                Console.WriteLine("Enter 0 to break");
                string str = Console.ReadLine();
                if(str == "0")
                {
                    break;
                }
                else
                {
                    a.Add(str);
                }

            }
            a.Remove("Hello");
            a.RemoveRangeDemo(1, 2);
            a.Add("Mubin");
            a.Add("Divyank");
            a.Remove("Divyank");
            a.Clear();
        }
        public static void _02_StackDemo()
        {
            Stack s1 = new Stack();
            s1.Push("Hello");
            s1.Push("Hii");
            s1.Push("Devanshu");
            foreach(object o in s1)
            {
                Console.WriteLine(o + "\n");
            }
            s1.Pop();
            Console.WriteLine("--------");
            Console.WriteLine("After Popping stack is");
            foreach (object o in s1)
            {
                Console.WriteLine(o + "\n");
            }
            Console.WriteLine("--------");
            Console.WriteLine("Top Element is "+s1.Peek());
            Console.WriteLine(s1.Contains("Hello"));
            s1.Clear();
            if(s1.Count == 0)
            {
                Console.WriteLine("No elements are present");
            }
            else
            {
                foreach (object o in s1)
                {
                    Console.WriteLine(o + "\n");
                }
            }

        }
        public static void _04_QueueDemo()
        {
            Queue q1 = new Queue();
            q1.Enqueue("Hello 1");
            q1.Enqueue("Hello 2");
            q1.Enqueue("Hello 3");
            q1.Dequeue();
            foreach (object o in q1)
            {
                Console.WriteLine(o + "\n");
            }
            Console.WriteLine("Here is peek element = "+q1.Peek());
            q1.Clear();
            if (q1.Count == 0)
            {
                Console.WriteLine("Queue is empty");
            }
            else
            {
                foreach (object o in q1)
                {
                    Console.WriteLine(o + "\n");
                }
            }
            q1.
        }
        public static void Main(string[] args)
        {
            //_01_ArrayListDemo();\
            _04_QueueDemo();
            Console.ReadLine();
        }
    }
}