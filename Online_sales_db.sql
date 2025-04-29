CREATE DATABASE online_sales;
USE online_sales;

-- Creating Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creating Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creating Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    product_id INT,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating Order Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Creating Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(50),
    payment_amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Inserting sample data into Customers table
INSERT INTO Customers (first_name, last_name, email, phone, address, city, state, postal_code, country, created_at)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'New York', 'NY', '10001', 'USA', '2024-12-01 10:00:00'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', '2024-12-10 11:30:00'),
('Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', '789 Oak St', 'Chicago', 'IL', '60601', 'USA', '2025-01-01 09:00:00'),
('Emily', 'Davis', 'emily.davis@example.com', '333-789-0123', '101 Pine St', 'San Francisco', 'CA', '94101', 'USA', '2025-01-15 14:20:00'),
('Sarah', 'Brown', 'sarah.brown@example.com', '444-567-8901', '202 Maple St', 'Austin', 'TX', '73301', 'USA', '2025-02-01 08:45:00');

-- Inserting sample data into Products table
INSERT INTO Products (product_name, price, category, created_at)
VALUES
('Laptop', 1200.00, 'Electronics', '2024-11-15 13:00:00'),
('Smartphone', 800.00, 'Electronics', '2024-11-20 14:00:00'),
('Headphones', 150.00, 'Accessories', '2024-12-05 10:30:00'),
('Tablet', 400.00, 'Electronics', '2025-01-01 09:30:00'),
('Smartwatch', 250.00, 'Accessories', '2025-01-20 16:00:00'),
('Bluetooth Speaker', 120.00, 'Accessories', '2025-02-01 11:45:00'),
('Gaming Mouse', 80.00, 'Accessories', '2025-02-10 15:10:00'),
('Wireless Keyboard', 100.00, 'Accessories', '2025-02-15 12:00:00');

-- Inserting sample data into Orders table
INSERT INTO Orders (customer_id, product_id, total_amount, order_status, shipping_address, order_date)
VALUES
(1, 1, 2000.00, 'Shipped', '123 Main St, New York, NY 10001', '2025-03-01'),
(2, 2, 800.00, 'Pending', '456 Elm St, Los Angeles, CA 90001', '2025-02-15'),
(3, 1, 1500.00, 'Shipped', '789 Oak St, Chicago, IL 60601', '2025-01-10'),
(4, 3, 350.00, 'Shipped', '101 Pine St, San Francisco, CA 94101', '2025-03-10'),
(5, 2, 850.00, 'Pending', '202 Maple St, Austin, TX 73301', '2025-01-25');

-- Inserting sample data into Order Items table
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price, total_price)
VALUES
(1, 1, 1, 1200.00, 1200.00),
(1, 2, 1, 800.00, 800.00),
(2, 2, 1, 800.00, 800.00),
(3, 1, 1, 1200.00, 1200.00),
(3, 4, 1, 400.00, 400.00),
(4, 3, 1, 150.00, 150.00),
(5, 2, 1, 800.00, 800.00),
(5, 3, 1, 150.00, 150.00);

-- Inserting sample data into Payments table
INSERT INTO Payments (order_id, payment_method, payment_status, payment_amount, payment_date)
VALUES
(1, 'Credit Card', 'Completed', 2000.00, '2025-03-05'),
(2, 'PayPal', 'Pending', 800.00, '2025-02-18'),
(3, 'Credit Card', 'Completed', 1500.00, '2025-01-15'),
(4, 'Debit Card', 'Completed', 350.00, '2025-03-15'),
(5, 'PayPal', 'Pending', 850.00, '2025-01-30');
