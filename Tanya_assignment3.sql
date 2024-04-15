create table Customers (customer_id int primary key,
first_name varchar(30),
last_name varchar(30),
date_of_birth date,
email varchar(30),
phone_number varchar(20),
address text)

INSERT INTO Customers values
(1, 'John', 'Doe', '1990-05-15', 'john.doe@example.com', '+1234567890', '123 Main St, Anytown, USA'),
(2, 'Jane', 'Smith', '1985-09-20', 'jane.smith@example.com', '+1987654321', '456 Elm St, Othertown, USA'),
(3, 'Alice', 'Johnson', '1992-12-10', 'alice.johnson@example.com', '+1122334455', '789 Oak St, Anycity, USA'),
(4, 'Bob', 'Williams', '1988-03-25', 'bob.williams@example.com', '+1555666777', '101 Maple Ave, Othercity, USA'),
(5, 'Emily', 'Brown', '1995-07-05', 'emily.brown@example.com', '+1444333222', '321 Pine St, Anystate, USA'),
(6, 'Michael', 'Jones', '1980-01-30', 'michael.jones@example.com', '+1777888999', '543 Cedar St, Anyvillage, USA'),
(7, 'Sarah', 'Martinez', '1983-11-12', 'sarah.martinez@example.com', '+1666999888', '987 Birch St, Othervillage, USA'),
(8, 'David', 'Garcia', '1998-08-08', 'david.garcia@example.com', '+1888777666', '741 Oak St, Anytown, USA'),
(9, 'Jessica', 'Lee', '1993-04-17', 'jessica.lee@example.com', '+1999888777', '852 Walnut St, Othercity, USA'),
(10, 'Matthew', 'Taylor', '1987-06-22', 'matthew.taylor@example.com', '+1223344556', '963 Elm St, Anycity, USA')
INSERT INTO Customers VALUES
(11, 'Olivia', 'Anderson', '1994-09-28', 'olivia.anderson@example.com', '+1112233445', '147 Pine St, Anytown, USA'),
(12, 'Ethan', 'Wilson', '1989-02-15', 'ethan.wilson@example.com', '+1223344556', '369 Oak St, Othertown, USA'),
(13, 'Ava', 'Thompson', '1996-11-03', 'ava.thompson@example.com', '+1334455667', '258 Elm St, Anycity, USA'),
(14, 'Liam', 'Davis', '1990-07-18', 'liam.davis@example.com', '+1445566778', '741 Maple Ave, Othercity, USA'),
(15, 'Sophia', 'Hernandez', '1985-04-10', 'sophia.hernandez@example.com', '+1556677889', '963 Cedar St, Anystate, USA')
INSERT INTO Customers VALUES
(101, 'A', 'Lim', '1994-10-30', 'lim@example.com', '+1100233045', '147 Avenue St, Anytown, USA')

create table Accounts(account_id int primary key,
customer_id int,
account_type varchar(30),
balance int,
foreign key (customer_id) references Customers(customer_id)) 

INSERT INTO Accounts VALUES
    (1, 1, 'Savings', 5000),
    (2, 2, 'Current', 2500),
    (3, 3, 'Savings', 10000),
    (4, 4, 'Current', 800),
    (5, 5, 'Zero Balance', 0),
    (6, 6, 'Savings', 3500),
    (7, 7, 'Current', 6000),
    (8, 8, 'Zero Balance', 0),
    (9, 9, 'Savings', 1500),
    (10, 10, 'Current', 10000)
	INSERT INTO Accounts VALUES
    (11, 11, 'Savings', 2000),
    (12, 12, 'Current', 4000),
    (13, 13, 'Savings', 6000),
    (14, 14, 'Current', 3000),
    (15, 15, 'Zero Balance', 0)
	INSERT INTO Accounts VALUES
    (41, 101, 'Current', 5000)


create table Transactions(transaction_id int primary key,
account_id int,
transaction_type varchar(40),
amount int,
transaction_date date,
foreign key (account_id) references Accounts(account_id))

INSERT INTO Transactions VALUES
    (1, 1, 'Deposit', 1000, '2024-04-01'),
    (2, 8, 'Withdrawal', 500, '2024-04-05'),
    (3, 2, 'Deposit', 200, '2024-04-02'),
    (4, 9, 'Withdrawal', 100, '2024-04-07'),
    (5, 3, 'Deposit', 1500, '2024-04-03'),
    (6, 3, 'Withdrawal', 800, '2024-04-09'),
    (7, 4, 'Deposit', 300, '2024-04-04'),
    (8, 2, 'Withdrawal', 200, '2024-04-06'),
    (9, 5, 'Deposit', 2000, '2024-04-05'),
    (10, 6, 'Withdrawal', 1500, '2024-04-08'),
    (11, 6, 'Transfer', 500, '2024-04-10'),
    (12, 6, 'Transfer', 500, '2024-04-10'),
    (13, 8, 'Transfer', 1000, '2024-04-12'),
    (14, 7, 'Transfer', 1000, '2024-04-12')
INSERT INTO Transactions VALUES
    (15, 11, 'Deposit', 1500, '2024-04-15'),
    (16, 12, 'Withdrawal', 800, '2024-04-16'),
    (17, 13, 'Deposit', 200, '2024-04-17'),
    (18, 14, 'Withdrawal', 500, '2024-04-18'),
    (19, 15, 'Deposit', 1000, '2024-04-19')

--TASK 1
--1
SELECT c.first_name, c.last_name, at.account_type, c.email
FROM Customers c, Accounts at
WHERE c.customer_id = at.customer_id
--2
SELECT c1.first_name, c1.last_name, 
	t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Transactions t, Accounts a, Customers c1, Customers c2
WHERE
    t.account_id = a.account_id
    AND a.customer_id = c1.customer_id
    AND a.customer_id = c2.customer_id
--3
UPDATE Accounts SET balance = balance + 1000 WHERE account_id = 1
--4
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers
--5
DELETE FROM Accounts WHERE balance = 0 AND account_type = 'Savings'
--6
SELECT first_name,last_name,address,email FROM Customers WHERE address like '%Anytown%'
--7
SELECT balance FROM Accounts WHERE account_id = 4
--8
SELECT * FROM Accounts WHERE account_type = 'Current' AND balance > 1000
--9
SELECT * FROM Transactions WHERE account_id = 8
--10
SELECT account_id, balance * 0.05 AS interest_accrued
FROM Accounts WHERE account_type = 'Savings'
--11
SELECT * FROM Accounts WHERE balance < 5000 AND account_type != 'Zero Balance'
--12
SELECT * FROM Customers WHERE address NOT LIKE '%Anytown%'

--TASK 3
--1
SELECT AVG(balance) AS average_balance FROM Accounts
--2
SELECT TOP 10 * FROM Accounts ORDER BY balance DESC
--3
SELECT SUM(t.amount) AS total_amount_deposited FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE t.transaction_type = 'Deposit'
AND t.transaction_date = '2024-04-01'
--4
select top 1 *from customers
ORDER BY date_of_birth
select top 1 *from customers
ORDER BY date_of_birth desc
--5
SELECT t.transaction_id, 
a.account_type,a.account_type
FROM Transactions t 
JOIN Accounts a ON t.account_id = a.account_id
--6
SELECT c.customer_id, c.first_name,c.last_name, 
a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
--7
SELECT t.transaction_id, t.transaction_date, t.amount,
    a.account_type, a.balance,
    c.first_name, c.last_name
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE a.account_id = 14
--8
SELECT customer_id, COUNT(customer_id) AS num_accounts
FROM Accounts
GROUP BY customer_id HAVING COUNT(*) > 1
--9 doubt
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT SUM(amount)
        FROM Transactions t
        JOIN Accounts a ON t.account_id = a.account_id
        WHERE a.customer_id = c.customer_id
        AND t.transaction_type = 'Deposit'
    ) AS total_deposits,
    (
        SELECT SUM(amount)
        FROM Transactions t
        JOIN Accounts a ON t.account_id = a.account_id
        WHERE a.customer_id = c.customer_id
        AND t.transaction_type = 'Withdrawal'
    ) AS total_withdrawals,
    (
        SELECT SUM(amount)
        FROM Transactions t
        JOIN Accounts a ON t.account_id = a.account_id
        WHERE a.customer_id = c.customer_id
        AND t.transaction_type = 'Deposit'
    ) -
    (
        SELECT SUM(amount)
        FROM Transactions t
        JOIN Accounts a ON t.account_id = a.account_id
        WHERE a.customer_id = c.customer_id
        AND t.transaction_type = 'Withdrawal'
    ) AS difference
FROM
    Customers c
ORDER BY
    c.customer_id;
--10 doubt
SELECT account_id, AVG(balance) AS average_daily_balance
FROM Accounts GROUP BY account_id
--11
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts GROUP BY account_type
--12
SELECT account_id, COUNT(*) AS transaction_count
FROM Transactions GROUP BY account_id ORDER BY transaction_count DESC
--13
SELECT c.first_name, c.last_name, a.account_type, 
SUM(a.balance) AS aggregate_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name,
    a.account_type
ORDER BY aggregate_balance DESC
--14
SELECT transaction_id, transaction_type, amount, transaction_date, account_id, COUNT(*) 
FROM Transactions
GROUP BY transaction_type, amount, transaction_date, account_id,transaction_id
HAVING COUNT(*)> 1

--TASK 4
--1
SELECT c.customer_id, c.first_name, c.last_name,
    a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance = (SELECT MAX(balance) FROM Accounts)
--2
--3
SELECT account_id,amount FROM Transactions
WHERE amount > ( SELECT AVG(amount) FROM Transactions)
--4
select customer_id,first_name from customers 
where customer_id not in (select customer_id from transactions)
--5
SELECT SUM(balance) AS total_balance_no_transactions
FROM Accounts
WHERE account_id NOT IN (
    SELECT DISTINCT account_id
    FROM Transactions
)
--6
SELECT * FROM Transactions WHERE account_id IN (
    SELECT account_id FROM Accounts WHERE balance = (
        SELECT MIN(balance) FROM Accounts))
--7
SELECT customer_id, first_name, last_name
FROM Customers WHERE customer_id IN (
    SELECT customer_id
    FROM Accounts GROUP BY customer_id
    HAVING COUNT(DISTINCT account_type) > 1
)
--8
SELECT account_type, cOUNT(*) AS num_accounts,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM Accounts GROUP BY account_type
--9
SELECT * FROM Transactions
WHERE account_id IN (
    SELECT account_id FROM Accounts WHERE customer_id = 8)
--10
SELECT account_type,
    (SELECT SUM(balance) FROM Accounts 
	WHERE account_type = A.account_type) AS total_balance
FROM Accounts AS A
GROUP BY account_type