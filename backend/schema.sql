CREATE TABLE customers (
    customer_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    gender INT,  -- 0 = Female, 1 = Male
    email VARCHAR(100), 
    phone VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100), 
    cost DECIMAL(10, 2), 
    selling_price DECIMAL(10, 2),
    description VARCHAR(255)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY, 
    order_id INT, 
    product_id INT, 
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
