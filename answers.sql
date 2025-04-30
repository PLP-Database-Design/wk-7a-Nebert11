-- Question 1:
-- Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order

--Answer:
-- I created another normalized (products) table to hold a single product 

CREATE TABLE products(
    orderID INT, 
    customerName VARCHAR(50), 
    products VARCHAR(50)
);

-- Then inserted the values separating the products to ensure each row contains one product per order
INSERT INTO products VALUES (101, 'John Doe', 'Laptop');
INSERT INTO products VALUES (101, 'John Doe', 'Mouse');

INSERT INTO products VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO products VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO products VALUES (102, 'Jane Smith', 'Mouse');

INSERT INTO products VALUES (103, 'Emily Clark', 'Phone');

-- Question 2:
-- - Write an SQL query to transform this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

-- Answer:
-- Here i create two new tables, order and orderItems tables. This tables will contain different details.
-- Orders table contains orderID and customerName. This makes sure customerName is not partially dependant on orderID + products. It instead depends only in orderID

CREATE TABLE orders(
    orderID INT PRIMARY KEY,
    customerName VARCHAR(100)
);

INSERT INTO orders(orderID, customerName)
VALUES(101, 'John Doe'),
(102,'Jane SMith'),
(103, 'Emily Clark');

-- orderItems table contains orderID, products and quantity columns. 

CREATE TABLE orderItems (
    orderID INT,
    products VARCHAR(100),
    quantity VARCHAR(100),
    PRIMARY KEY (orderID, products),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

INSERT INTO orderItems(orderID, products, quantity) VALUES (101, 'Laptop', 2);
INSERT INTO orderItems(orderID, products, quantity) VALUES (101, 'Mouse', 1);

INSERT INTO orderItems(orderID, products, quantity) VALUES (102, 'Tablet', 3);
INSERT INTO orderItems(orderID, products, quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO orderItems(orderID, products, quantity) VALUES (102, 'Mouse', 2);

INSERT INTO orderItems(orderID, products, quantity) VALUES (103, 'Phone', 1);