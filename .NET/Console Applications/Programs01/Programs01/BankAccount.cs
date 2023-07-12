using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Programs01
{
    public class BankAccount
    {
        String Account_No;
        String Email;
        String User_Name;
        String Account_Type;
        Double Account_Balance;

        public void GetAccountDetails()
        {
            Console.WriteLine("Enter the Account Number : ");
            this.Account_No = Console.ReadLine();
            Console.WriteLine("Enter the email address : ");
            this.Email = Console.ReadLine();
            Console.WriteLine("Enter the Account Type : ");
            this.Account_Type = Console.ReadLine();
            Console.WriteLine("Enter the Account Balance : ");
            this.Account_Balance = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter the User Name : ");
            this.User_Name = Console.ReadLine();

        }
        public void DisplayAccountDetails()
        {
            Console.WriteLine("Account Number : " + Account_No);
            Console.WriteLine("Email : " + Email);
            Console.WriteLine("User Name : " + User_Name);
            Console.WriteLine("Account type : " + Account_Type);
            Console.WriteLine("Account Balance : " + Account_Balance);
        }
    }
}
