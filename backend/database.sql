-- Drop and recreate the customers table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    gender INT,  -- 0 = Female, 1 = Male
    email VARCHAR(100), 
    phone VARCHAR(20),
    birth_date DATE, 
    address VARCHAR(150)
);

-- Insert a larger set of customer data
INSERT INTO customers (customer_id, first_name, last_name, gender, email, phone, birth_date, address) VALUES
(1, 'John', 'Doe', 1, 'john.doe@example.com', '555-1234', '1990-01-01', '123 Maple St, Springfield'),
(2, 'Jane', 'Smith', 0, 'jane.smith@example.com', '555-5678', '1985-05-15', '456 Oak St, Springfield'),
(3, 'Alice', 'Johnson', 0, 'alice.johnson@example.com', '555-8765', '1992-10-30', '789 Pine St, Springfield'),
(4, 'Michael', 'Williams', 1, 'michael.williams@example.com', '555-2345', '1988-02-20', '321 Birch St, Springfield'),
(5, 'Laura', 'Brown', 0, 'laura.brown@example.com', '555-3456', '1995-08-12', '654 Cedar St, Springfield'),
(6, 'David', 'Jones', 1, 'david.jones@example.com', '555-4567', '1982-11-22', '987 Walnut St, Springfield'),
(7, 'Emma', 'Davis', 0, 'emma.davis@example.com', '555-6789', '1993-07-17', '123 Elm St, Springfield'),
(8, 'Oliver', 'Garcia', 1, 'oliver.garcia@example.com', '555-7890', '1989-09-05', '456 Willow St, Springfield'),
(9, 'Sophia', 'Miller', 0, 'sophia.miller@example.com', '555-8901', '1991-12-10', '789 Fir St, Springfield'),
(10, 'James', 'Martinez', 1, 'james.martinez@example.com', '555-9012', '1987-04-25', '321 Redwood St, Springfield');

-- Drop and recreate the orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_date DATE, 
    total_amount DECIMAL(10, 2), 
    shipping_address VARCHAR(150),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Insert more order data
INSERT INTO orders (order_id, customer_id, order_date, total_amount, shipping_address) VALUES
(1, 1, '2024-01-15', 59.97, '123 Maple St, Springfield'),
(2, 2, '2024-01-20', 119.96, '456 Oak St, Springfield'),
(3, 1, '2024-02-05', 29.97, '123 Maple St, Springfield'),
(4, 3, '2024-02-18', 19.99, '789 Pine St, Springfield'),
(5, 4, '2024-03-10', 89.98, '321 Birch St, Springfield'),
(6, 5, '2024-03-22', 109.98, '654 Cedar St, Springfield'),
(7, 6, '2024-04-01', 59.99, '987 Walnut St, Springfield'),
(8, 7, '2024-04-14', 29.99, '123 Elm St, Springfield'),
(9, 8, '2024-05-05', 49.95, '456 Willow St, Springfield'),
(10, 9, '2024-05-25', 19.98, '789 Fir St, Springfield'),
(11, 10, '2024-06-15', 79.97, '321 Redwood St, Springfield'),
(12, 3, '2024-06-30', 39.98, '789 Pine St, Springfield'),
(13, 7, '2024-07-05', 29.99, '123 Elm St, Springfield'),
(14, 4, '2024-07-20', 59.98, '321 Birch St, Springfield'),
(15, 5, '2024-08-01', 49.99, '654 Cedar St, Springfield'),
(16, 2, '2024-08-15', 119.96, '456 Oak St, Springfield'),
(17, 8, '2024-09-01', 69.95, '456 Willow St, Springfield'),
(18, 9, '2024-09-12', 39.97, '789 Fir St, Springfield'),
(19, 10, '2024-09-25', 29.99, '321 Redwood St, Springfield'),
(20, 6, '2024-10-05', 59.99, '987 Walnut St, Springfield'),
(21, 6, '2024-10-08', 39.99, '987 Walnut St, Springfield'),
(22, 8, '2024-10-01', 89.98, '456 Willow St, Springfield');

-- Drop and recreate the products table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100), 
    cost DECIMAL(10, 2), 
    selling_price DECIMAL(10, 2),
    description VARCHAR(255), 
    stock_quantity INT
);

-- Insert product data
INSERT INTO products (product_id, product_name, cost, selling_price, description, stock_quantity) VALUES
(1, 'Drug A', 15.00, 19.99, 'A useful widget.', 100),
(2, 'Drug B', 20.00, 29.99, 'An even more useful widget.', 150),
(3, 'Drug C', 30.00, 39.99, 'The most useful widget.', 75),
(4, 'Drug D', 12.00, 19.99, 'Never used widget.', 50),
(5, 'Drug X', 40.00, 49.99, 'An advanced gadget.', 80),
(6, 'Drug Y', 50.00, 59.99, 'An improved version of Gadget X.', 60),
(7, 'Drug Z', 70.00, 89.99, 'A powerful tool.', 45),
(8, 'Drug W', 7.00, 9.99, 'A necessary accessory.', 200),
(9, 'Drug G', 7.00, 9.99, 'An item that has not sold.', 300);

-- Drop and recreate the order_items table
DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY, 
    order_id INT, 
    product_id INT, 
    quantity INT, 
    price_at_purchase DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Insert more order item data
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 2, 19.99),
(2, 1, 2, 1, 29.99),
(3, 2, 3, 4, 39.99),
(4, 3, 1, 3, 19.99),
(5, 4, 4, 1, 19.99),
(6, 5, 5, 2, 49.99),
(7, 6, 6, 1, 59.99),
(8, 7, 7, 1, 89.99),
(9, 8, 2, 3, 29.99),
(10, 9, 8, 5, 9.99),
(11, 10, 3, 2, 39.99),
(12, 11, 1, 4, 19.99),
(13, 12, 2, 2, 29.99),
(14, 13, 4, 1, 19.99),
(15, 14, 5, 1, 49.99),
(16, 15, 6, 3, 59.99),
(17, 16, 7, 1, 89.99),
(18, 17, 8, 2, 9.99),
(19, 18, 1, 1, 19.99),
(20, 19, 3, 1, 39.99),
(21, 20, 2, 1, 29.99),
(22, 21, 5, 2, 49.99),
(23, 22, 4, 2, 19.99);