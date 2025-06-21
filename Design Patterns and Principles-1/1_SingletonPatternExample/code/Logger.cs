using System;

public class Logger
{
    // Step 2: Private static instance
    private static Logger instance;

    // Step 2: Private constructor
    private Logger()
    {
        Console.WriteLine("Logger instance created.");
    }

    // Step 2: Public static method to get the instance
    public static Logger GetInstance()
    {
        if (instance == null)
        {
            instance = new Logger();
        }
        return instance;
    }

    // Logger method
    public void Log(string message)
    {
        Console.WriteLine("Log: " + message);
    }
}

