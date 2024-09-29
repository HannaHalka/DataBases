create database hanna4
use hanna4

CREATE TABLE IF NOT EXISTS opt_clients (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

CREATE TABLE IF NOT EXISTS opt_products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_category ENUM('Category1', 'Category2', 'Category3', 'Category4', 'Category5') NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS opt_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    client_id CHAR(36),
    product_id INT,
    FOREIGN KEY (client_id) REFERENCES opt_clients(id),
    FOREIGN KEY (product_id) REFERENCES opt_products(product_id)
);


-- bad query
select opt_clients.name, opt_clients.surname, opt_orders.order_date,
		opt_products.product_category, opt_products.product_name
from opt_orders
left join opt_clients on opt_orders.client_id = opt_clients.id
left join opt_products on opt_orders.product_id = opt_products.product_id 
where opt_clients.surname = 'Davis' and opt_orders.order_date >= '2024-01-01'

-- good query
-- creating ind for joins
create index ind_client_id on opt_orders(client_id)  -- already exists in MySQL 
create index ind_product_id on opt_orders(product_id) 
-- creating ind for where
create index ind_client_surname on opt_clients(surname)
create index ind_order_date on opt_orders(order_date)  -- if we runs once again same query, runs 4 times faster

with cte_clients as ( -- cte sometims improve perfomans but in our case it slows down
    select id, name, surname
    from opt_clients
    where surname = 'Davis'
),
cte_orders as (
    select order_id, order_date, client_id, product_id
    from opt_orders
    where order_date >= '2024-01-01'
)
select cte_clients.name, cte_clients.surname, cte_orders.order_date,
    opt_products.product_category, opt_products.product_name
from cte_orders
right join cte_clients on cte_orders.client_id = cte_clients.id
right join opt_products on cte_orders.product_id = opt_products.product_id;
