CREATE OR REPLACE TABLE `your_project.your_dataset.orders` (
  order_id INT64,
  customer_id INT64,
  order_date DATE,
  order_status STRING,
  order_amount NUMERIC
);

INSERT INTO `your_project.your_dataset.orders`
  (order_id, customer_id, order_date, order_status, order_amount)
VALUES
  (4, 104, DATE '2023-01-18', 'Cancelled', 0.00),
  (18, 118, DATE '2023-02-01', 'Cancelled', 0.00),
  (11, 111, DATE '2023-01-25', 'Cancelled', 0.00),
  (14, 114, DATE '2023-01-28', 'Delivered', 180.50),
  (10, 110, DATE '2023-01-24', 'Delivered', 220.40),
  (17, 117, DATE '2023-01-31', 'Delivered', 310.00),
  (3, 103, DATE '2023-01-17', 'Delivered', 89.99),
  (7, 107, DATE '2023-01-21', 'Delivered', 150.20),
  (19, 119, DATE '2023-02-02', 'Pending', 85.00),
  (1, 101, DATE '2023-01-15', 'Pending', 250.75),
  (12, 112, DATE '2023-01-26', 'Pending', 130.00),
  (8, 108, DATE '2023-01-22', 'Pending', 200.00),
  (5, 105, DATE '2023-01-19', 'Pending', 300.00),
  (15, 115, DATE '2023-01-29', 'Pending', 250.00),
  (6, 106, DATE '2023-01-20', 'Shipped', 45.60),
  (9, 109, DATE '2023-01-23', 'Shipped', 75.00),
  (20, 120, DATE '2023-02-03', 'Shipped', 195.95),
  (16, 116, DATE '2023-01-30', 'Shipped', 60.75),
  (2, 102, DATE '2023-01-16', 'Shipped', 125.50),
  (13, 113, DATE '2023-01-27', 'Shipped', 99.99);