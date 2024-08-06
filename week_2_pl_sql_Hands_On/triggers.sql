--Scenario 1: Automatically update the last modified date when a customer's record is updated
-- Create table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  LastModified DATE
);

-- Trigger to update last modified date
DELIMITER //
CREATE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
  SET NEW.LastModified = CURDATE();
END;//
DELIMITER ;
--Scenario 2: Maintain an audit log for all transactions
-- Create tables
CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  CustomerID INT,
  TransactionDate DATE,
  Amount DECIMAL(10, 2)
);

CREATE TABLE AuditLog (
  LogID INT PRIMARY KEY AUTO_INCREMENT,
  TransactionID INT,
  LogDate DATE,
  LogAction VARCHAR(50),
  FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

-- Trigger to log transactions
DELIMITER //
CREATE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (TransactionID, LogDate, LogAction)
  VALUES (NEW.TransactionID, CURDATE(), 'INSERT');
END;//
DELIMITER ;
--Scenario 3: Enforce business rules on deposits and withdrawals
-- Create table
CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  CustomerID INT,
  Balance DECIMAL(10, 2)
);

CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  AccountID INT,
  TransactionDate DATE,
  Amount DECIMAL(10, 2),
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Trigger to check transaction rules
DELIMITER //
CREATE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
  DECLARE current_balance DECIMAL(10, 2);
  SELECT Balance INTO current_balance
  FROM Accounts
  WHERE AccountID = NEW.AccountID;

  IF NEW.Amount < 0 AND ABS(NEW.Amount) > current_balance THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
  ELSEIF NEW.Amount <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid transaction amount';
  END IF;
END;//
DELIMITER ;
