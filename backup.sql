-- Dummy PostgreSQL Backup File

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    amount INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1, 'Ajay', 500, '2025-01-01'),
(2, 'Rahul', 700, '2025-01-01'),
(3, 'Neha', 300, '2025-01-02'),
(4, 'Amit', 900, '2025-01-02'),
(5, 'Priya', 450, '2025-01-03');