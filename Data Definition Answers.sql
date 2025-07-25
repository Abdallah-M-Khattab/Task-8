--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table compeny.Employees 
(
E_id int,
E_name varchar(50) not null,
E_salary decimal not null
)
------------------------------------------------------------------------------------------------------------
--Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE compeny.Employees
ADD Department varchar(50);
-----------------------------------------------------------------------------------------------------------
--Remove the "Salary" column from the "Employees" table.
ALTER TABLE compeny.Employees
drop COLUMN E_salary
------------------------------------------------------------------------------------------------------------
--Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Employees.Department' , 'DeptName','COLUMN'

------------------------------------------------------------------------------------------------------------
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table compeny.Projects 
(
P_id int ,
P_name varchar(50)
)
------------------------------------------------------------------------------------------------------------
--Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE compeny.Employees ADD PRIMARY KEY(E_id);
------------------------------------------------------------------------------------------------------------
--Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE compeny.Employees
ADD CONSTRAINT E_name UNIQUE(E_name);
------------------------------------------------------------------------------------------------------------
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE compeny.Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
);
------------------------------------------------------------------------------------------------------------
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE compeny.Customers
ADD CONSTRAINT unique_fullname UNIQUE (FirstName, LastName);
------------------------------------------------------------------------------------------------------------
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE compeny.Orders 
(
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL
);
------------------------------------------------------------------------------------------------------------
--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE compeny.Orders
ADD CONSTRAINT chk_totalamount_positive CHECK (TotalAmount > 0);
------------------------------------------------------------------------------------------------------------
--Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales;
ALTER SCHEMA Sales TRANSFER compeny.Orders;
------------------------------------------------------------------------------------------------------------
--Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders';
------------------------------------------------------------------------------------------------------------


