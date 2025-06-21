using System;

class FinancialForecast
{
    // Recursive method to calculate future value
    public static double CalculateFutureValue(double initialAmount, double growthRate, int years)
    {
        if (years == 0)
            return initialAmount;
        return CalculateFutureValue(initialAmount, growthRate, years - 1) * (1 + growthRate);
    }

    // Optimized version using memoization (to avoid repeated work)
    public static double CalculateFutureValueMemo(double initialAmount, double growthRate, int years, double[] memo)
    {
        if (years == 0)
            return initialAmount;

        if (memo[years] != 0)
            return memo[years];

        memo[years] = CalculateFutureValueMemo(initialAmount, growthRate, years - 1, memo) * (1 + growthRate);
        return memo[years];
    }

    static void Main()
    {
        double initial = 1000.0;         // Initial amount
        double growthRate = 0.08;        // 8% annual growth
        int forecastYears = 5;

        Console.WriteLine("=== Recursive Forecast ===");
        double future = CalculateFutureValue(initial, growthRate, forecastYears);
        Console.WriteLine($"Future value after {forecastYears} years: {future:F2}");

        Console.WriteLine("\n=== Optimized with Memoization ===");
        double[] memo = new double[forecastYears + 1];
        double futureMemo = CalculateFutureValueMemo(initial, growthRate, forecastYears, memo);
        Console.WriteLine($"Future value after {forecastYears} years: {futureMemo:F2}");
    }
}
