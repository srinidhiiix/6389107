using System;

class Product : IComparable<Product>
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public string Category { get; set; }

    public Product(int id, string name, string category)
    {
        ProductId = id;
        ProductName = name;
        Category = category;
    }

    public int CompareTo(Product other)
    {
        return ProductId.CompareTo(other.ProductId); 
    }

    public override string ToString()
    {
        return $"ID: {ProductId}, Name: {ProductName}, Category: {Category}";
    }
}

class SearchDemo
{
        public static Product LinearSearch(Product[] products, int targetId)
    {
        foreach (Product p in products)
        {
            if (p.ProductId == targetId)
                return p;
        }
        return null;
    }

    
    public static Product BinarySearch(Product[] products, int targetId)
    {
        int left = 0, right = products.Length - 1;
        while (left <= right)
        {
            int mid = left + (right - left) / 2;
            if (products[mid].ProductId == targetId)
                return products[mid];
            else if (products[mid].ProductId < targetId)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return null;
    }

    static void Main()
    {
        Product[] products = new Product[]
        {
            new Product(3, "Smartphone", "Electronics"),
            new Product(1, "Book", "Education"),
            new Product(4, "Shoes", "Footwear"),
            new Product(2, "Laptop", "Electronics")
        };

        Console.WriteLine("=== Linear Search ===");
        Product found1 = LinearSearch(products, 2);
        Console.WriteLine(found1 != null ? found1.ToString() : "Product not found");

        Console.WriteLine("\n=== Binary Search ===");
        Array.Sort(products);
        Product found2 = BinarySearch(products, 2);
        Console.WriteLine(found2 != null ? found2.ToString() : "Product not found");
    }
}
