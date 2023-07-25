using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_06
{
    public class Program01
    {
        ArrayList list = new ArrayList();
        public void Add(string str)
        {
            list.Add(str);
            DisplayName();
        }
        public void DisplayName()
        {
            if(list.Count > 0)
            {
                foreach (object item in list)
                {
                    Console.WriteLine(item);
                }
            }
            else
            {
                Console.WriteLine("Kay nathi bhai");
            }
        }
        public void Clear()
        {
            list.Clear();
            DisplayName();
        }

        public void Remove(string name)
        {
            if (list.Contains(name))
            {
                list.Remove(name);
            }
            else
            {
                Console.WriteLine("Element not available");
            }
            DisplayName();
        }
        public void RemoveRangeDemo(int statringIndex, int count)
        {
            list.RemoveRange(statringIndex, count);
            DisplayName();
        }
    }
}
