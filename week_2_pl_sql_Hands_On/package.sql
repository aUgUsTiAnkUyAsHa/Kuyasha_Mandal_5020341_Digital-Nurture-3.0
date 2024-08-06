-- TABLE CREATION FOR THE QUERY
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE accounts (
  account_id INT PRIMARY KEY,
  customer_id INT,
  balance DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  salary DECIMAL(10, 2)
);
--Scenario 1: Group all customer-related procedures and functions into a package
DELIMITER //

CREATE PACKAGE CustomerManagement AS
BEGIN
  PROCEDURE AddCustomer(p_name VARCHAR(255), p_email VARCHAR(255))
  BEGIN
    INSERT INTO customers (name, email)
    VALUES (p_name, p_email);
  END;

  PROCEDURE UpdateCustomer(p_customer_id INT, p_name VARCHAR(255), p_email VARCHAR(255))
  BEGIN
    UPDATE customers
    SET name = p_name, email = p_email
    WHERE customer_id = p_customer_id;
  END;

  FUNCTION GetCustomerBalance(p_customer_id INT) RETURNS DECIMAL(10, 2)
  BEGIN
    DECLARE balance DECIMAL(10, 2);
    SELECT SUM(balance) INTO balance
    FROM accounts
    WHERE customer_id = p_customer_id;
    RETURN balance;
  END;
END //

DELIMITER ;
--Scenario 2: Create a package to manage employee data
DELIMITER //

CREATE PACKAGE EmployeeManagement AS
BEGIN
  PROCEDURE HireEmployee(p_name VARCHAR(255), p_email VARCHAR(255), p_salary DECIMAL(10, 2))
  BEGIN
    INSERT INTO employees (name, email, salary)
    VALUES (p_name, p_email, p_salary);
  END;

  PROCEDURE UpdateEmployee(p_employee_id INT, p_name VARCHAR(255), p_email VARCHAR(255), p_salary DECIMAL(10, 2))
  BEGIN
    UPDATE employees
    SET name = p_name, email = p_email, salary = p_salary
    WHERE employee_id = p_employee_id;
  END;

  FUNCTION CalculateAnnualSalary(p_employee_id INT) RETURNS DECIMAL(10, 2)
  BEGIN
    DECLARE salary DECIMAL(10, 2);
    SELECT salary INTO salary
    FROM employees
    WHERE employee_id = p_employee_id;
    RETURN salary * 12;
  END;
END //

DELIMITER ;
--Scenario 3: Group all account-related operations into a package
DELIMITER //

CREATE PACKAGE AccountOperations AS
BEGIN
  PROCEDURE OpenAccount(p_customer_id INT, p_balance DECIMAL(10, 2))
  BEGIN
    INSERT INTO accounts (customer_id, balance)
    VALUES (p_customer_id, p_balance);
  END;

  PROCEDURE CloseAccount(p_account_id INT)
  BEGIN
    DELETE FROM accounts
    WHERE account_id = p_account_id;
  END;

  FUNCTION GetTotalBalance(p_customer_id INT) RETURNS DECIMAL(10, 2)
  BEGIN
    DECLARE balance DECIMAL(10, 2);
    SELECT SUM(balance) INTO balance
    FROM accounts
    WHERE customer_id = p_customer_id;
    RETURN balance;
  END;
END //

DELIMITER ;

