-- Drop tables and procedure if exist
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP PROCEDURE IF EXISTS sp_GetEmployeeCountByDepartment;

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

-- Insert departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

-- Insert many employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily', 'Davis', 4, 5500.00, '2021-11-05'),

('Alice', 'Walker', 2, 6200.00, '2022-08-10'),
('Bob', 'Brown', 3, 7100.00, '2020-12-12'),
('Charlie', 'Wilson', 1, 5200.00, '2021-06-07'),
('Diana', 'Moore', 4, 5800.00, '2019-10-19'),
('Ethan', 'Taylor', 3, 6900.00, '2017-04-25'),
('Fiona', 'Anderson', 2, 6300.00, '2016-02-14'),

('George', 'Thomas', 1, 5100.00, '2021-01-20'),
('Hannah', 'Jackson', 4, 5400.00, '2018-09-10'),
('Ian', 'White', 3, 7200.00, '2020-05-22'),
('Jackie', 'Martin', 2, 6100.00, '2019-03-03'),
('Karen', 'Lee', 1, 5000.00, '2018-11-11'),
('Liam', 'Perez', 3, 7000.00, '2021-07-16'),

('Mona', 'Clark', 4, 5600.00, '2022-01-30'),
('Nate', 'Lewis', 2, 6050.00, '2017-12-08'),
('Olivia', 'Robinson', 3, 6800.00, '2019-08-14'),
('Paul', 'Walker', 1, 5300.00, '2019-02-28');

-- Create stored procedure to count employees by department
DELIMITER //

CREATE PROCEDURE sp_GetEmployeeCountByDepartment(IN DeptID INT)
BEGIN
    SELECT COUNT(*) AS EmployeeCount
    FROM Employees
    WHERE DepartmentID = DeptID;
END;
//

DELIMITER ;

-- Call procedure for each department to see counts
CALL sp_GetEmployeeCountByDepartment(1);  -- HR
CALL sp_GetEmployeeCountByDepartment(2);  -- Finance
CALL sp_GetEmployeeCountByDepartment(3);  -- IT
CALL sp_GetEmployeeCountByDepartment(4);  -- Marketing
