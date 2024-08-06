--Scenario 1: Handle exceptions during fund transfers between account 
-- Create table
CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  CustomerID INT,
  Balance DECIMAL(10, 2)
);

-- Create table to log errors
CREATE TABLE ErrorLog (
  ErrorID INT AUTO_INCREMENT PRIMARY KEY,
  ErrorMessage VARCHAR(255),
  ErrorDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Stored procedure to transfer funds safely
DELIMITER //
CREATE PROCEDURE SafeTransferFunds(IN sourceAccountID INT, IN targetAccountID INT, IN amount DECIMAL(10, 2))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    INSERT INTO ErrorLog (ErrorMessage)
    VALUES ('Error occurred during fund transfer');
  END;

  START TRANSACTION;
  IF (SELECT Balance FROM Accounts WHERE AccountID = sourceAccountID) < amount THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
  END IF;

  UPDATE Accounts
  SET Balance = Balance - amount
  WHERE AccountID = sourceAccountID;

  UPDATE Accounts
  SET Balance = Balance + amount
  WHERE AccountID = targetAccountID;

  COMMIT;
END;//
DELIMITER ;
--Scenario 2: Manage errors when updating employee salaries
-- Create table
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(50),
  Salary DECIMAL(10, 2)
);

-- Create table to log errors
CREATE TABLE ErrorLog (
  ErrorID INT AUTO_INCREMENT PRIMARY KEY,
  ErrorMessage VARCHAR(255),
  ErrorDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Stored procedure to update salary
DELIMITER //
CREATE PROCEDURE UpdateSalary(IN employeeID INT, IN percentage DECIMAL(4, 2))
BEGIN
  DECLARE EXIT HANDLER FOR NOT FOUND
  BEGIN
    INSERT INTO ErrorLog (ErrorMessage)
    VALUES ('Employee ID not found');
  END;

  START TRANSACTION;
  UPDATE Employees
  SET Salary = Salary * (1 + percentage / 100)
  WHERE EmployeeID = employeeID;

  IF ROW_COUNT() = 0 THEN
    SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Employee ID not found';
  END IF;

  COMMIT;
END;//
DELIMITER ;
--Scenario 3: Ensure data integrity when adding a new customer 
-- Create table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50)
);

-- Create table to log errors
CREATE TABLE ErrorLog (
  ErrorID INT AUTO_INCREMENT PRIMARY KEY,
  ErrorMessage VARCHAR(255),
  ErrorDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Stored procedure to add new customer
DELIMITER //
CREATE PROCEDURE AddNewCustomer(IN customerID INT, IN name VARCHAR(50))
BEGIN
  DECLARE EXIT HANDLER FOR 1062
  BEGIN
    INSERT INTO ErrorLog (ErrorMessage)
    VALUES ('Customer ID already exists');
  END;

  INSERT INTO Customers (CustomerID, Name)
  VALUES (customerID, name);
END;//
DELIMITER ;
