using System;

class Program
{
    static void Main()
    {
        using var context = new AppDbContext();
        Console.WriteLine("DbContext configured successfully!");
    }
}
