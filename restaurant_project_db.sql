INSERT INTO Customers (name, phone, email)
VALUES
('Ravi', '9876543210', 'ravi@gmail.com'),
('Anita', '9123456780', 'anita@gmail.com');
SELECT * FROM Customers;
CREATE TABLE Menu (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);
SHOW TABLES;
INSERT INTO Menu (item_name, category, price)
VALUES
('Veg Biryani', 'Main Course', 180.00),
('Chicken Biryani', 'Main Course', 220.00),
('Coke', 'Beverage', 40.00),
('Ice Cream', 'Dessert', 90.00);
SELECT * FROM Menu;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SHOW TABLES;
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, CURDATE(), 400.00);
SELECT * FROM Orders;
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);
INSERT INTO Order_Items (order_id, item_id, quantity)
VALUES
(1, 1, 2),
(1, 3, 1);
SELECT * FROM Order_Items;
SELECT 
    c.name AS Customer_Name,
    o.order_id,
    m.item_name,
    oi.quantity,
    m.price,
    (oi.quantity * m.price) AS Total_Item_Price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.item_id = m.item_id;
SELECT 
    o.order_id,
    SUM(oi.quantity * m.price) AS Total_Bill
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.item_id = m.item_id
WHERE o.order_id = 1
GROUP BY o.order_id;
UPDATE Orders o
JOIN (
    SELECT 
        o.order_id,
        SUM(oi.quantity * m.price) AS total
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Menu m ON oi.item_id = m.item_id
    GROUP BY o.order_id
) t ON o.order_id = t.order_id
SET o.total_amount = t.total;
UPDATE Orders o
JOIN (
    SELECT 
        o.order_id,
        SUM(oi.quantity * m.price) AS total
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Menu m ON oi.item_id = m.item_id
    GROUP BY o.order_id
) t ON o.order_id = t.order_id
SET o.total_amount = t.total
WHERE o.order_id = 1;
SELECT * FROM Orders;
SELECT 
    order_date,
    SUM(total_amount) AS Total_Daily_Sales
FROM Orders
GROUP BY order_date;
SELECT 
    m.item_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Menu m ON oi.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_quantity_sold DESC;
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
DESC Customers;
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
SELECT 
    c.name
FROM Customers c
LEFT JOIN Orders o 
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
INSERT INTO Customers (customer_id, name)
VALUES
(1, 'Arun'),
(2, 'Priya'),
(3, 'Karthik'),
(4, 'Divya'),
(5, 'Rahul'),
(6, 'Sneha'),
(7, 'Vikram'),
(8, 'Meena'),
(9, 'Ajay'),
(10, 'Kavya');
INSERT INTO Customers (name)
VALUES
('Arun'),
('Priya'),
('Karthik'),
('Divya'),
('Rahul'),
('Sneha'),
('Vikram'),
('Meena'),
('Ajay'),
('Kavya');
SELECT * FROM Customers;
ALTER TABLE Customers 
MODIFY customer_id INT AUTO_INCREMENT;
INSERT INTO Customers (name)
VALUES
('Arun'),
('Priya'),
('Karthik'),
('Divya'),
('Rahul'),
('Sneha'),
('Vikram'),
('Meena'),
('Ajay'),
('Kavya');
SELECT * FROM Customers;
SELECT * FROM Customers
WHERE customer_id > 10;
DELETE FROM Orders
WHERE customer_id > 10;
SELECT * FROM Customers;
SELECT * FROM Customers
WHERE customer_id > 10;
DELETE FROM Orders
WHERE customer_id > 10;
DELETE FROM Customers
WHERE customer_id > 10;
SELECT * FROM Customers;
UPDATE Customers
SET phone = CASE customer_id
    WHEN 3 THEN '9988776655'
    WHEN 4 THEN '9876501234'
    WHEN 5 THEN '9123409876'
    WHEN 6 THEN '9876123456'
    WHEN 7 THEN '9123789456'
    WHEN 8 THEN '9876540987'
    WHEN 9 THEN '9123498765'
    WHEN 10 THEN '9876509876'
END
WHERE customer_id BETWEEN 3 AND 10;
SELECT * FROM Customers;
UPDATE Customers
SET email = CASE customer_id
    WHEN 3 THEN 'karthik@example.com'
    WHEN 4 THEN 'divya@example.com'
    WHEN 5 THEN 'rahul@example.com'
    WHEN 6 THEN 'sneha@example.com'
    WHEN 7 THEN 'vikram@example.com'
    WHEN 8 THEN 'meena@example.com'
    WHEN 9 THEN 'ajay@example.com'
    WHEN 10 THEN 'kavya@example.com'
END
WHERE customer_id BETWEEN 3 AND 10;
SELECT * FROM Customers;
INSERT INTO Menu (item_name, price)
VALUES
('Burger', 120),
('Pizza', 250),
('Pasta', 180),
('Sandwich', 90),
('Fries', 80),
('Coke', 40),
('Coffee', 60),
('Ice Cream', 70),
('Biryani', 200),
('Noodles', 150);
SELECT * FROM Menu;
UPDATE Menu
SET category = CASE item_name
    WHEN 'Burger' THEN 'Main Course'
    WHEN 'Pizza' THEN 'Main Course'
    WHEN 'Pasta' THEN 'Main Course'
    WHEN 'Sandwich' THEN 'Main Course'
    WHEN 'Fries' THEN 'Snack'
    WHEN 'Coke' THEN 'Beverage'
    WHEN 'Coffee' THEN 'Beverage'
    WHEN 'Ice Cream' THEN 'Dessert'
    WHEN 'Biryani' THEN 'Main Course'
    WHEN 'Noodles' THEN 'Main Course'
END
WHERE item_name IN ('Burger','Pizza','Pasta','Sandwich','Fries','Coke','Coffee','Ice Cream','Biryani','Noodles');
SET SQL_SAFE_UPDATES = 0;

-- Run your UPDATE query again
UPDATE Menu
SET category = CASE item_name
    WHEN 'Burger' THEN 'Main Course'
    WHEN 'Pizza' THEN 'Main Course'
    WHEN 'Pasta' THEN 'Main Course'
    WHEN 'Sandwich' THEN 'Main Course'
    WHEN 'Fries' THEN 'Snack'
    WHEN 'Coke' THEN 'Beverage'
    WHEN 'Coffee' THEN 'Beverage'
    WHEN 'Ice Cream' THEN 'Dessert'
    WHEN 'Biryani' THEN 'Main Course'
    WHEN 'Noodles' THEN 'Main Course'
END
WHERE item_name IN ('Burger','Pizza','Pasta','Sandwich','Fries','Coke','Coffee','Ice Cream','Biryani','Noodles')
SET SQL_SAFE_UPDATES = 0;

-- Run your UPDATE query again
UPDATE Menu
SET category = CASE item_name
    WHEN 'Burger' THEN 'Main Course'
    WHEN 'Pizza' THEN 'Main Course'
    WHEN 'Pasta' THEN 'Main Course'
    WHEN 'Sandwich' THEN 'Main Course'
    WHEN 'Fries' THEN 'Snack'
    WHEN 'Coke' THEN 'Beverage'
    WHEN 'Coffee' THEN 'Beverage'
    WHEN 'Ice Cream' THEN 'Dessert'
    WHEN 'Biryani' THEN 'Main Course'
    WHEN 'Noodles' THEN 'Main Course'
END
WHERE item_name IN ('Burger','Pizza','Pasta','Sandwich','Fries','Coke','Coffee','Ice Cream','Biryani','Noodles');

-- Re-enable safe updates (optional)
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Menu;
UPDATE Menu
SET category = CASE item_id
    WHEN 1 THEN 'Main Course'
    WHEN 2 THEN 'Main Course'
    WHEN 3 THEN 'Main Course'
    WHEN 4 THEN 'Main Course'
    WHEN 5 THEN 'Snack'
    WHEN 6 THEN 'Beverage'
    WHEN 7 THEN 'Beverage'
    WHEN 8 THEN 'Dessert'
    WHEN 9 THEN 'Main Course'
    WHEN 10 THEN 'Main Course'
END
WHERE item_id BETWEEN 1 AND 10;
SELECT * FROM Menu;
DESC Menu;
UPDATE Menu
SET item_name = CASE item_id
        WHEN 1 THEN 'Burger'
        WHEN 2 THEN 'Pizza'
        WHEN 3 THEN 'Pasta'
        WHEN 4 THEN 'Sandwich'
        WHEN 5 THEN 'Fries'
        WHEN 6 THEN 'Coke'
        WHEN 7 THEN 'Coffee'
        WHEN 8 THEN 'Ice Cream'
        WHEN 9 THEN 'Biryani'
        WHEN 10 THEN 'Noodles'
    END,
    price = CASE item_id
        WHEN 1 THEN 120
        WHEN 2 THEN 250
        WHEN 3 THEN 180
        WHEN 4 THEN 90
        WHEN 5 THEN 80
        WHEN 6 THEN 40
        WHEN 7 THEN 60
        WHEN 8 THEN 70
        WHEN 9 THEN 200
        WHEN 10 THEN 150
    END,
    category = CASE item_id
        WHEN 1 THEN 'Main Course'
        WHEN 2 THEN 'Main Course'
        WHEN 3 THEN 'Main Course'
        WHEN 4 THEN 'Main Course'
        WHEN 5 THEN 'Snack'
        WHEN 6 THEN 'Beverage'
        WHEN 7 THEN 'Beverage'
        WHEN 8 THEN 'Dessert'
        WHEN 9 THEN 'Main Course'
        WHEN 10 THEN 'Main Course'
    END
WHERE item_id BETWEEN 1 AND 10;
SELECT * FROM Menu;
DELETE FROM Menu
WHERE item_id BETWEEN 11 AND 14;
SELECT * FROM Menu;
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2026-02-20', 0),
(2, '2026-02-20', 0),
(3, '2026-02-21', 0),
(4, '2026-02-21', 0),
(5, '2026-02-22', 0),
(6, '2026-02-22', 0),
(7, '2026-02-23', 0),
(8, '2026-02-23', 0),
(9, '2026-02-24', 0),
(10, '2026-02-24', 0);
INSERT INTO Order_Items (order_id, item_id, quantity)
VALUES
-- Order 1
(1, 1, 2),  -- 2 Burgers
(1, 6, 2),  -- 2 Coke

-- Order 2
(2, 2, 1),  -- 1 Pizza
(2, 5, 1),  -- 1 Fries

-- Order 3
(3, 3, 2),  -- 2 Pasta
(3, 7, 1),  -- 1 Coffee

-- Order 4
(4, 4, 3),  -- 3 Sandwich
(4, 6, 2),  -- 2 Coke

-- Order 5
(5, 5, 2),  -- 2 Fries
(5, 10, 1), -- 1 Noodles

-- Order 6
(6, 1, 1),  -- 1 Burger
(6, 3, 1),  -- 1 Pasta

-- Order 7
(7, 8, 2),  -- 2 Ice Cream
(7, 6, 1),  -- 1 Coke

-- Order 8
(8, 9, 1),  -- 1 Biryani
(8, 4, 2),  -- 2 Sandwich

-- Order 9
(9, 2, 1),  -- 1 Pizza
(9, 5, 1),  -- 1 Fries

-- Order 10
(10, 7, 2), -- 2 Coffee
(10, 10, 1);-- 1 Noodles
UPDATE Orders o
JOIN (
    SELECT 
        oi.order_id,
        SUM(oi.quantity * m.price) AS total
    FROM Order_Items oi
    JOIN Menu m ON oi.item_id = m.item_id
    GROUP BY oi.order_id
) t ON o.order_id = t.order_id
SET o.total_amount = t.total;
-- Orders
SELECT * FROM Orders;

-- Order items
SELECT * FROM Order_Items;

-- Join example
SELECT o.order_id, c.name AS customer_name, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
