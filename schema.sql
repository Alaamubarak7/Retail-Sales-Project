create table customers(
   customer_id int PRIMARY KEY,
   name varchar(30),
   email VARCHAR(100),
   city VARCHAR(50)
)


CREATE TABLE categories (
   category_id INT PRIMARY KEY,
   category_name VARCHAR(50)
)


CREATE TABLE products(
   product_id INT PRIMARY KEY,
   name VARCHAR(100),
   price DECIMAL(10,2),
   category_id INT,
   FOREIGN KEY(category_id)REFERENCES categories(category_id)
)


CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)



CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
)


CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  amount DECIMAL(10,2),
  method VARCHAR(30),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);