CREATE DATABASE RetailDB;
USE RetailDB;

-- A2. Create tables (data types + PRIMARY KEY, NOT NULL, DEFAULT, UNIQUE, FOREIGN KEY)

CREATE TABLE categories (
    category_id    INT           AUTO_INCREMENT PRIMARY KEY,
    category_name  VARCHAR(50)   NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id     INT            AUTO_INCREMENT PRIMARY KEY,
    product_name   VARCHAR(100)   NOT NULL,
    category_id    INT            NOT NULL,
    unit_price     DECIMAL(10,2)  NOT NULL,
    stock_qty      INT            NOT NULL DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id    INT            AUTO_INCREMENT PRIMARY KEY,
    full_name      VARCHAR(80)    NOT NULL,
    email          VARCHAR(100)   UNIQUE,
    city           VARCHAR(50)    DEFAULT 'Bengaluru',
    joined_date    DATE           DEFAULT (CURRENT_DATE)
);

CREATE TABLE orders (
    order_id       INT            AUTO_INCREMENT PRIMARY KEY,
    customer_id    INT            NOT NULL,
    order_date     DATE           NOT NULL,
    status         VARCHAR(20)    NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id        INT            AUTO_INCREMENT PRIMARY KEY,
    order_id       INT            NOT NULL,
    product_id     INT            NOT NULL,
    quantity       INT            NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- A3. ALTER : add, modify, rename and remove columns
ALTER TABLE customers ADD COLUMN phone VARCHAR(15);                 -- add a column
ALTER TABLE customers ADD COLUMN loyalty_points INT DEFAULT 0;      -- add with default
ALTER TABLE customers MODIFY COLUMN phone VARCHAR(20);              -- change data type/size
ALTER TABLE customers RENAME COLUMN phone TO mobile_no;             -- rename column
ALTER TABLE customers DROP COLUMN mobile_no;                        -- remove a column

-- A4. Index (speeds up searches)
CREATE INDEX idx_products_name ON products(product_name);

-- A5. TRUNCATE vs DROP (practice on a throw-away table)
CREATE TABLE feedback_temp (
    fb_id     INT AUTO_INCREMENT PRIMARY KEY,
    comments  VARCHAR(200) NOT NULL
);
INSERT INTO feedback_temp (comments) VALUES ('Good service'), ('Fresh vegetables'), ('Long queue');

TRUNCATE TABLE feedback_temp;     -- removes ALL rows, keeps the table structure
DROP TABLE feedback_temp;         -- removes the table itself

DESCRIBE customers;               -- view the final structure
SHOW TABLES;