-- Drop tables if exist (to reset)
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

-- Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily', 'Davis', 4, 5500.00, '2021-11-05');

-- Drop stored procedures if they already exist
DROP PROCEDURE IF EXISTS sp_GetEmployeesByDepartment;
DROP PROCEDURE IF EXISTS sp_InsertEmployee;

-- Change delimiter to create stored procedures
DELIMITER //

-- Stored procedure to get employees by department
CREATE PROCEDURE sp_GetEmployeesByDepartment(IN DeptID INT)
BEGIN
    SELECT EmployeeID, FirstName, LastName, Salary, JoinDate
    FROM Employees
    WHERE DepartmentID = DeptID;
END;
//

-- Stored procedure to insert a new employee
CREATE PROCEDURE sp_InsertEmployee (
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DepartmentID INT,
    IN p_Salary DECIMAL(10,2),
    IN p_JoinDate DATE
)
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (p_FirstName, p_LastName, p_DepartmentID, p_Salary, p_JoinDate);
END;
//

-- Reset delimiter to semicolon
DELIMITER ;

-- Example: call procedure to get employees in department 3 (IT)
CALL sp_GetEmployeesByDepartment(3);

-- Example: insert new employee
CALL sp_InsertEmployee('Alice', 'Walker', 2, 6200.00, '2022-08-10');

-- Verify insertion by retrieving employees in department 2 (Finance)
CALL sp_GetEmployeesByDepartment(2);
