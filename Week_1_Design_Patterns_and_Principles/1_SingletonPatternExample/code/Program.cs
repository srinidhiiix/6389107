using System;

class Program
{
    static void Main(string[] args)
    {
        // Step 4: Test Singleton
        Logger logger1 = Logger.GetInstance();
        logger1.Log("First log message");

        Logger logger2 = Logger.GetInstance();
        logger2.Log("Second log message");

        // Verifying if both logger1 and logger2 refer to the same instance
        if (logger1 == logger2)
        {
            Console.WriteLine("Both logger1 and logger2 are the same instance.");
        }
        else
        {
            Console.WriteLine("Different instances exist. Singleton failed.");
        }
    }
}
