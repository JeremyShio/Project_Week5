-- Week 5 - ERD/SQL Project




-- Car Dealership - USE ERD to Create SQL Database 


-- Create an ERD for a car dealership. The dealership sells both new and used cars, and it operates a service facility. Base your design on the following business rules:

-- A salesperson may sell many cars, but each car is sold by only one salesperson.
-- A customer may buy many cars, but each car is purchased by only one customer.
-- A salesperson writes a single invoice for each car he or she sells.
-- A customer gets an invoice for each car he or she buys.
-- A customer may come in just to have his or her car serviced; that is, a customer need not buy a car to be classified as a customer.
-- When a customer takes one or more cars in for repair or service, one service ticket is written for each car.
-- The car dealership maintains a service history for each of the cars serviced. The service  records are referenced by the car’s serial number.
-- A car brought in for service can be worked on by many mechanics, and each mechanic may work on many cars.




CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	home_address VARCHAR(75),
	phone_number VARCHAR(10),
	email_address VARCHAR(50),
	loyalty_status BOOLEAN
);

SELECT * FROM customer;




CREATE TABLE receipt (
	receipt_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	item_name VARCHAR(75),
	description VARCHAR,
	receipt_date TIMESTAMPTZ,
	receipt_total NUMERIC(20,2),
	customer_id INTEGER NOT NULL,
	airplane_id INTEGER NOT NULL,
	helicopter_id INTEGER NOT NULL,
	yacht_id INTEGER NOT NULL,
	seller_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL
);

SELECT * FROM receipt;


ALTER TABLE receipt 
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE receipt 
ADD FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id);

ALTER TABLE receipt 
ADD FOREIGN KEY (helicopter_id) REFERENCES helicopter(helicopter_id);

ALTER TABLE receipt 
ADD FOREIGN KEY (yacht_id) REFERENCES yacht(yacht_id);

ALTER TABLE receipt 
ADD FOREIGN KEY (seller_id) REFERENCES seller(seller_id);

ALTER TABLE receipt 
ADD FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);




CREATE TABLE receipt_product (
	receipt_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL
);

SELECT * FROM receipt_product;


ALTER TABLE receipt_product
ADD FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id);

ALTER TABLE receipt_product
ADD FOREIGN KEY (product_id) REFERENCES product(product_id);




CREATE TABLE product (
	product_id SERIAL PRIMARY KEY NOT NULL,
	item_name VARCHAR(75),
	description VARCHAR,
	sales_total NUMERIC(20,2),
	airplane_id INTEGER,
	helicopter_id INTEGER,
	yacht_id INTEGER,
	seller_id INTEGER
);

SELECT * FROM product;


ALTER TABLE product
ADD FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id);

ALTER TABLE product
ADD FOREIGN KEY (helicopter_id) REFERENCES helicopter(helicopter_id);

ALTER TABLE product
ADD FOREIGN KEY (yacht_id) REFERENCES yacht(yacht_id);

ALTER TABLE product
ADD FOREIGN KEY (seller_id) REFERENCES seller(seller_id);




CREATE TABLE seller (
	seller_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone_number VARCHAR(10),
	email_address VARCHAR(50)
);

SELECT * FROM seller;




CREATE TABLE receipt_service (
	receipt_id INTEGER NOT NULL,
	service_id INTEGER NOT NULL
);

SELECT * FROM receipt_service;


ALTER TABLE receipt_service
ADD FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id);

ALTER TABLE receipt_service
ADD FOREIGN KEY (service_id) REFERENCES service(service_id);




CREATE TABLE service (
	service_id SERIAL PRIMARY KEY NOT NULL,
	aftercare_special VARCHAR(50),
	change_color VARCHAR(50),
	change_trim VARCHAR(50),
	sales_total NUMERIC(20,2),
	airplane_id INTEGER,
	helicopter_id INTEGER,
	yacht_id INTEGER,
	mechanic_id INTEGER
);

SELECT * FROM service;


ALTER TABLE service
ADD FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id);

ALTER TABLE service
ADD FOREIGN KEY (helicopter_id) REFERENCES helicopter(helicopter_id);

ALTER TABLE service
ADD FOREIGN KEY (yacht_id) REFERENCES yacht(yacht_id);

ALTER TABLE service
ADD FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);




CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone_number VARCHAR(10),
	email_address VARCHAR(50)
);

SELECT * FROM mechanic;




CREATE TABLE product_airplane (
	seller_id INTEGER NOT NULL,
	airplane_id INTEGER NOT NULL
);

SELECT * FROM product_airplane;

ALTER TABLE product_airplane
ADD FOREIGN KEY (seller_id) REFERENCES seller(seller_id);

ALTER TABLE product_airplane
ADD FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id);




CREATE TABLE service_airplane (
	service_id INTEGER NOT NULL,
	airplane_id INTEGER NOT NULL
);

SELECT * FROM service_airplane;


ALTER TABLE service_airplane
ADD FOREIGN KEY (service_id) REFERENCES service(service_id);

ALTER TABLE service_airplane
ADD FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id);




CREATE TABLE airplane (
	airplane_id SERIAL PRIMARY KEY NOT NULL,
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	trim_ VARCHAR(50),
	description VARCHAR,
	price NUMERIC(20,2)
);

SELECT * FROM airplane;


CREATE TABLE product_helicopter (
	seller_id INTEGER NOT NULL,
	helicopter_id INTEGER NOT NULL
);

SELECT * FROM product_helicopter;


ALTER TABLE product_helicopter 
ADD FOREIGN KEY (seller_id) REFERENCES seller(seller_id);

ALTER TABLE product_helicopter 
ADD FOREIGN KEY (helicopter_id) REFERENCES helicopter(helicopter_id);




CREATE TABLE service_helicopter (
	service_id INTEGER NOT NULL,
	helicopter_id INTEGER NOT NULL
);

SELECT * FROM service_helicopter;


ALTER TABLE service_helicopter 
ADD FOREIGN KEY (service_id) REFERENCES service(service_id);

ALTER TABLE service_helicopter 
ADD FOREIGN KEY (helicopter_id) REFERENCES helicopter(helicopter_id);




CREATE TABLE helicopter (
	helicopter_id SERIAL PRIMARY KEY NOT NULL,
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	trim_ VARCHAR(50),
	description VARCHAR,
	price NUMERIC(20,2)
);

SELECT * FROM helicopter;


CREATE TABLE product_yacht (
	seller_id INTEGER NOT NULL,
	yacht_id INTEGER NOT NULL
);

SELECT * FROM product_yacht;


ALTER TABLE product_yacht
ADD FOREIGN KEY (seller_id) REFERENCES seller(seller_id);

ALTER TABLE product_yacht
ADD FOREIGN KEY (yacht_id) REFERENCES yacht(yacht_id);

	


CREATE TABLE service_yacht (
	service_id INTEGER NOT NULL,
	yacht_id INTEGER NOT NULL
);

SELECT * FROM service_yacht;


ALTER TABLE service_yacht
ADD FOREIGN KEY (service_id) REFERENCES service(service_id);

ALTER TABLE service_yacht
ADD FOREIGN KEY (yacht_id) REFERENCES yacht(yacht_id);

	


CREATE TABLE yacht (
	yacht_id SERIAL PRIMARY KEY NOT NULL,
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	trim_ VARCHAR(50),
	description VARCHAR,
	price NUMERIC(20,2)
);

SELECT * FROM yacht;



