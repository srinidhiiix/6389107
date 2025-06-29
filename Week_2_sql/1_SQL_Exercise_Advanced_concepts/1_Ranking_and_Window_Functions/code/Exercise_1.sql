-- Step 1: Create a small Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Step 2: Insert minimal data
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Tablet', 'Electronics', 800.00),
(4, 'Chair', 'Furniture', 150.00),
(5, 'Desk', 'Furniture', 250.00),
(6, 'Shelf', 'Furniture', 250.00);

-- Step 3: Apply ranking functions
WITH Ranked AS (
    SELECT
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum,
        RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankNum,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRankNum
    FROM Products
)

-- Step 4: Show top 2 products per category
SELECT
    Category,
    ProductName,
    Price,
    RowNum,
    RankNum,
    DenseRankNum
FROM Ranked
WHERE RowNum <= 2
ORDER BY Category, RowNum;
