-- Week 5 - ERD/SQL Project




-- Car Dealership - USE ERD to Create SQL Database 


-- After the tables have been created, use SQL to add data to the database




SELECT * FROM customer;

ALTER SEQUENCE customer_customer_id_seq RESTART WITH 1;

INSERT INTO customer (
	first_name,
	last_name,
	home_address,
	phone_number,
	email_address,
	loyalty_status
) VALUES ('Warren', 'Buffet', '3936 Platinum Drive Omaha, NE 68198', '5822221848', 'W.Buffet@BHathaway.com', TRUE),
('Bill & Melinda', 'Gates', '363 Lamberts Branch Road Fort Lauderdale, FL 33301', '3137580493', 'BillMelindaGates@Microsoft.com', TRUE),
('MacKenzie', 'Scott', '2412 Lodgeville Road Minneapolis, MN 55402', '2027879618', 'MacKenzieScott@Giving.com', TRUE),
('Charles', 'Feeney', '4129 College Street Decatur, GA 30030', '5056441009', 'CharlieFeeney@Altantic.com', FALSE),
('Gordon & Betty', 'Moore', '2566 Clarksburg Park Road Springerville, AZ 85938', '5828885934', 'G.B.Moore@Intel.com', TRUE),
('T.Denny', 'Sanford', '1973 Woodlawn Drive Milwaukee, WI 53219', '2096411010', 'TDSanford@FPBank.com', FALSE),
('Lynn & Stacy', 'Schusterman', '4186 Jody Road Philadelphia, PA 19108', '4106105305', 'LynnStacyS@SEnergy.com', TRUE),
('Donald', 'Bren', '579 Ward Road El Paso, TX 79901', '2073234966', 'DonBren@IrvineCo.com', FALSE),
('George', 'Kaiser', '4316 Benedum Drive Fleischmanns, NY 12430', '2177738539', 'G.Kaiser@BOKFinancial.com', FALSE),
('Pierre', 'Omidyar', '1951 Straford Park Pittsburg, KY 40741', '5053694507', 'PierreO@Ebay.com', FALSE);


INSERT INTO customer(first_name, last_name, home_address, phone_number, email_address)
VALUES ('Elon', 'Musk', '3804 Roosevelt Street San Francisco, CA 94143', '5553699573', 'E.Musk@Tesla.com')


CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR(50), last_name VARCHAR(50), home_address VARCHAR, phone_number VARCHAR(10), email_address VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, home_address, phone_number, email_address)
	VALUES (first_name, last_name, home_address, phone_number, email_address);
END;
$$;


CALL add_customer('Elon', 'Musk', '3804 Roosevelt Street San Francisco, CA 94143', '5553699573', 'E.Musk@Tesla.com');




SELECT * FROM receipt;

-- COME BACK HERE!!!--
-- item_name/description/receipt_total
INSERT INTO receipt (
	first_name,
	last_name,
	customer_id,
	airplane_id,
	helicopter_id,
	yacht_id,
	seller_id,
	mechanic_id
) VALUES ('Warren', 'Buffet', 1, 2, 0, 0, 3, 0),
('Bill & Melinda', 'Gates', 2, 1, 2, 3, 2, 1),
('MacKenzie', 'Scott', 3, 0, 0, 2, 1, 0),
('Gordon & Betty', 'Moore', 5, 2, 3, 0, 1, 3),
('Lynn & Stacy', 'Schusterman', 7, 3, 2, 1, 3, 1);
-- item_name/description/receipt_total
-- COME BACK HERE!!!--


INSERT INTO receipt (
	item_name,
	description 
) VALUES ('2 Gulfstream Aerospace G600', 'The Gulfstream G600 is a twin-engine business jet designed and manufactured by Gulfstream Aerospace.'),
('2 Benetti FB272 M/Y Luminosity', 'Benetti''s flagship yacht. A tribute to the greatest of art and craftmanship. A truly hybrid world cruiser of cutting-edge technologies.'),
('Full Package', 'Airplane, Helicopter, and Yacht.'),
('Multiple', 'Airplane and Helicopter.'),
('Full Package', 'Airplane, Helicopter, and Yacht.');




SELECT * FROM product;


INSERT INTO product (
	airplane_id,
	helicopter_id,
	yacht_id,
	seller_id
) VALUES (2, 0, 0, 3),
(1, 2, 3, 2),
(0, 0, 2, 1),
(2, 3, 0, 1),
(3, 2, 1, 3);


INSERT INTO product (
	item_name,
	description 
) VALUES ('2 Gulfstream Aerospace G600', 'The Gulfstream G600 is a twin-engine business jet designed and manufactured by Gulfstream Aerospace.'),
('2 Benetti FB272 M/Y Luminosity', 'Benetti''s flagship yacht. A tribute to the greatest of art and craftmanship. A truly hybrid world cruiser of cutting-edge technologies.'),
('Full Package', 'Airplane, Helicopter, and Yacht.'),
('Multiple', 'Airplane and Helicopter.'),
('Full Package', 'Airplane, Helicopter, and Yacht.');




ALTER SEQUENCE mechanic_mechanic_id_seq RESTART WITH 1;

SELECT * FROM seller;

INSERT INTO seller (
	first_name,
	last_name,
	phone_number,
	email_address
) VALUES ('Rhonda', 'Robertson', '5559872303', 'R.Robertson@Lux.com'),
('Melvin', 'Pena II', '5552908470', 'M.PenaII@Lux.com'),
('William', 'Moon', '5550938452', 'Liam.Moon@Lux.com');


CREATE OR REPLACE PROCEDURE add_seller(first_name VARCHAR(50), last_name VARCHAR(50), phone_number VARCHAR(10), email_address VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, home_address, email_address)
	VALUES (first_name, last_name, home_address, email_address);
END;
$$;


CALL add_seller('John', 'McAfee', '2025 Oakmound Road Lombard, IL 60148', '5552970328', 'MrMcAfee@ProtectPC.com');




SELECT * FROM service;




INSERT INTO service (
	service_id,	
	aftercare_special,
	change_color,
	change_trim,
	sales_total,
	airplane_id,
	helicopter_id,
	yacht_id,
	mechanic_id
) VALUES (0, 'None', 'None', 'None', 0.00, 0, 0, 0, 0),
(1, 'None', 'None', 'Diamond', 10000000.00, 0, 0, 3, 1),
(2, 'Yes', 'Gray', 'None', 25000.00, 2, 0, 0, 3),
(3, 'None', 'None', 'Platinum', 7500000.00, 0, 0, 1, 1);




ALTER SEQUENCE mechanic_mechanic_id_seq RESTART WITH 1;

SELECT * FROM mechanic;

INSERT INTO mechanic (
	first_name,
	last_name,
	phone_number,
	email_address
) VALUES ('Alex', 'Henson', '5552839746', 'AlexHenson@Lux.com'),
('James', 'Edwards', '5559872342', 'J.Edwards@Lux.com'),
('Eric', 'Lawson', '5558970452', 'EricLaw@Lux.com');


CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR(50), last_name VARCHAR(50), phone_number VARCHAR(10), email_address VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, home_address, email_address)
	VALUES (first_name, last_name, home_address, email_address);
END;
$$;


CALL add_mechanic('Keanu', 'Reeves', '1383 Elk Street Rancho Santa Margarita, CA 92688', '5557064854', 'JohnWick@gmail.com');




INSERT INTO mechanic (
	mechanic_id,
	first_name,
	last_name,
	phone_number,
	email_address
) VALUES (0, 'None', 'None', '0000000000', 'None');




ALTER SEQUENCE airplane_airplane_id_seq RESTART WITH 1;

SELECT * FROM airplane;

INSERT INTO airplane (
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES ('Boeing', '737 MAX', 'White', 'None', 'The fourth generation of the Boeing 737, a narrow-body airliner manufactured by Boeing Comercial Airplanes (BCA), a division of American company Boeing.', 25000000.00),
('Gulfstream Aerospace', 'G600', 'Green', 'Gold', 'The Gulfstream G600 is a twin-engine business jet designed and manufactured by Gulfstream Aerospace.', 50000000.00),
('Pilatus', 'PC-24', 'White', 'Diamond', 'The Pilatus PC-24 is a light business jet produced by Pilatus Aircraft of Switzerland.', 75000000.00);




INSERT INTO airplane (
	airplane_id,	
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES (0, 'None', 'None', 'None', 'None', 'None', 0);




ALTER SEQUENCE helicopter_helicopter_id_seq RESTART WITH 1;

SELECT * FROM helicopter;

INSERT INTO helicopter (
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES ('AgustaWestland', 'Kopter AW09', 'Red', 'None', 'The Kopter AW09 is the Leonardo Helicopter Division''s, single-engine multirole helicopter.', 25000000.00),
('Bell Textron Inc.', 'Bell 505 Jet Ranger X', 'Yellow', 'Platinum', 'The Jett Rander X (JRX) is an American/Canadian light helicopter deleveloped and manufactured by Bell Helicopter.', 50000000.00),
('Sikorsky Helicopters', 'Sikorsky XV-2', 'Silver', 'Diamond', 'The Sikorsky XV-2, also known bt the Sikorsky Aircraft model number S-57, was developed for a joint research program between the US Air Force and the US Army.', 75000000.00);




INSERT INTO helicopter (
	helicopter_id,	
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES (0, 'None', 'None', 'None', 'None', 'None', 0);




SELECT * FROM yacht;

INSERT INTO yacht (
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES ('Amels', 'Project Signature', 'White', 'None', 'Amels signature yacht with complete luxury, designed to meet and exceed the standards of the broadest spectrum of clients.', 10000000.00),
('Benetti', 'FB272 M/Y Luminosity', 'White', 'Gold', 'Benetti''s flagship yacht. A tribute to the greatest of art and craftmanship. A truly hybrid world cruiser of cutting-edge technologies.', 15000000.00),
('Feadship', 'Gitana', 'White', 'Diamond', 'The pinnacle of luxury yachts. It is a representation of how a magnificent full displacement yacht can still remain family-oriented.', 20000000.00);



INSERT INTO yacht (
	yacht_id,	
	make,
	model,
	color,
	trim_,
	description,
	price
) VALUES (0, 'None', 'None', 'None', 'None', 'None', 0);


