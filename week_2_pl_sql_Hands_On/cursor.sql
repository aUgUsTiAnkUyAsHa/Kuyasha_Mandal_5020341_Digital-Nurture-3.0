-- TABLE CREATION FOR THE QUERY
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100)
);

CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  CustomerID INT,
  TransactionDate DATE,
  Amount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
--Scenario 1: Generate monthly statements for all customers
DECLARE
  CURSOR GenerateMonthlyStatements IS
    SELECT c.CustomerID, c.Name, t.TransactionDate, t.Amount
    FROM Customers c
    JOIN Transactions t ON c.CustomerID = t.CustomerID
    WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSTIMESTAMP)
    AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSTIMESTAMP);

  v_CustomerID Customers.CustomerID%TYPE;
  v_Name Customers.Name%TYPE;
  v_TransactionDate Transactions.TransactionDate%TYPE;
  v_Amount Transactions.Amount%TYPE;
BEGIN
  OPEN GenerateMonthlyStatements;
  LOOP
    FETCH GenerateMonthlyStatements INTO v_CustomerID, v_Name, v_TransactionDate, v_Amount;
    EXIT WHEN GenerateMonthlyStatements%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Statement for ' || v_Name || ' (Customer ID: ' || v_CustomerID || ')');
    DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || v_TransactionDate);
    DBMS_OUTPUT.PUT_LINE('Amount: ' || v_Amount);
    DBMS_OUTPUT.PUT_LINE('------------------------');
  END LOOP;
  CLOSE GenerateMonthlyStatements;
END;
--Scenario 2: Apply annual fee to all accounts
-- Create tables
CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  CustomerID INT,
  Balance DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- PL/SQL block to apply annual fee
DECLARE
  CURSOR ApplyAnnualFee IS
    SELECT AccountID, Balance
    FROM Accounts;

  v_AccountID Accounts.AccountID%TYPE;
  v_Balance Accounts.Balance%TYPE;
  annual_fee CONSTANT DECIMAL(10, 2) := 25.00; -- assume annual fee is $25.00
BEGIN
  OPEN ApplyAnnualFee;
  LOOP
    FETCH ApplyAnnualFee INTO v_AccountID, v_Balance;
    EXIT WHEN ApplyAnnualFee%NOTFOUND;
    UPDATE Accounts
    SET Balance = Balance - annual_fee
    WHERE AccountID = v_AccountID;
    DBMS_OUTPUT.PUT_LINE('Annual fee applied to account ' || v_AccountID);
  END LOOP;
  CLOSE ApplyAnnualFee;
END;
--Scenario 3: Update the interest rate for all loans based on a new policy
-- Create tables
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  CustomerID INT,
  InterestRate DECIMAL(4, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- PL/SQL block to update loan interest rates
DECLARE
  CURSOR UpdateLoanInterestRates IS
    SELECT LoanID, InterestRate
    FROM Loans;

  v_LoanID Loans.LoanID%TYPE;
  v_InterestRate Loans.InterestRate%TYPE;
  new_interest_rate CONSTANT DECIMAL(4, 2) := 5.50; -- assume new interest rate is 5.50%
BEGIN
  OPEN UpdateLoanInterestRates;
  LOOP
    FETCH UpdateLoanInterestRates INTO v_LoanID, v_InterestRate;
    EXIT WHEN UpdateLoanInterestRates%NOTFOUND;
    UPDATE Loans
    SET InterestRate = new_interest_rate
    WHERE LoanID = v_LoanID;
    DBMS_OUTPUT.PUT_LINE('Interest rate updated for loan ' || v_LoanID);
  END LOOP;
  CLOSE UpdateLoanInterestRates;
END;-

