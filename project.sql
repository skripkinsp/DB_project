Drop table if EXISTS "Order";
Drop table if EXISTS "Clients";
Drop table if EXISTS "Courier";
Drop table if EXISTS "Package";
Drop table if EXISTS "Product_storage";
Drop table if EXISTS "Farm";
Drop table if EXISTS "Additionals";

Create table "Order" (
	id integer PRIMARY KEY,
	client_id integer,
	courier_id integer,
	address varchar(100),
	del_time timestamp,
	finished boolean,
	price float
);

Create table "Clients" (
	id integer PRIMARY KEY,
	name_ varchar(100),
	order_num integer,
	order_sum float,
	sale float
);

Create table "Clients_story" (
	client_id integer,
	name_ varchar(100),
	order_num integer,
	order_sum float,
	sale float,
	date_ timestamp,
);

CREATE TABLE "Courier" (
	id integer PRIMARY KEY,
	name_ varchar(100),
	workplace varchar(100)
);

CREATE TABLE "Package" (
	id integer PRIMARY KEY,
	product_id integer,
	type_ varchar(100),
	amount integer,
	price float,
	additionals_id integer
);

CREATE TABLE "Product_storage" (
	id integer PRIMARY KEY,
	name_ varchar(100),
	amount integer
);

CREATE TABLE "Farm" (
	id integer PRIMARY KEY, 
	plant_time timestamp,
	collect_time timestamp,
	amount integer
);

CREATE TABLE "Additionals" (
	id integer PRIMARY KEY,
	name_ varchar(100),
	amount integer,
	price integer
);

ALTER TABLE "Order" ADD FOREIGN KEY (id) REFERENCES "Package" (id);

ALTER TABLE "Order" ADD FOREIGN KEY (client_id) REFERENCES "Clients" (id);

ALTER TABLE "Clients" ADD FOREIGN KEY (id) REFERENCES "Clients_story" (client_id);

ALTER TABLE "Order" ADD FOREIGN KEY (courier_id) REFERENCES "Courier" (id);

ALTER TABLE "Package" ADD FOREIGN KEY (product_id) REFERENCES "Product_storage" (id);

ALTER TABLE "Product_storage" ADD FOREIGN KEY (id) REFERENCES "Farm" (id);

ALTER TABLE"Package" ADD FOREIGN KEY (additionals_id) REFERENCES "Additionals" (id);

INSERT INTO Clients_story (client_id, name_, order_num, order_sum, sale, date_)
VALUES
(1, 'Alice', 101, 150.00, 1, '2020-01-10'),
(1, 'Alice', 102, 200.00, 0, '2020-02-15'),
(2, 'Bob', 201, 300.00, 1, '2020-03-20'),
(2, 'Bob', 202, 250.00, 0, '2020-04-25'),
(3, 'Alice', 301, 180.00, 1, '2020-05-30'),
(3, 'Alice', 302, 230.00, 0, '2020-06-05'),
(4, 'Bob', 401, 280.00, 1, '2020-07-10'),
(4, 'Bob', 402, 320.00, 0, '2020-08-15'),
(5, 'Alice', 501, 210.00, 1, '2020-09-20'),
(5, 'Alice', 502, 190.00, 0, '2020-10-25'),
(6, 'Bob', 601, 350.00, 1, '2020-11-30'),
(6, 'Bob', 602, 270.00, 0, '2020-12-05'),
(7, 'Alice', 701, 165.00, 1, '2021-01-10'),
(7, 'Alice', 702, 215.00, 0, '2021-02-15'),
(8, 'Bob', 801, 260.00, 1, '2021-03-20'),
(8, 'Bob', 802, 240.00, 0, '2021-04-25'),
(9, 'Alice', 901, 195.00, 1, '2021-05-30'),
(9, 'Alice', 902, 235.00, 0, '2021-06-05'),
(10, 'Bob', 1001, 330.00, 1, '2021-07-10'),
(10, 'Bob', 1002, 310.00, 0, '2021-08-15'),
(11, 'Alice', 1101, 225.00, 1, '2021-09-20'),
(11, 'Alice', 1102, 205.00, 0, '2021-10-25'),
(12, 'Bob', 1201, 375.00, 1, '2021-11-30'),
(12, 'Bob', 1202, 295.00, 0, '2021-12-05'),
(13, 'Alice', 1301, 140.00, 1, '2022-01-10'),
(13, 'Alice', 1302, 190.00, 0, '2022-02-15'),
(14, 'Bob', 1401, 205.00, 1, '2022-03-20'),
(14, 'Bob', 1402, 185.00, 0, '2022-04-25'),
(15, 'Alice', 1501, 170.00, 1, '2022-05-30'),
(15, 'Alice', 1502, 210.00, 0, '2022-06-05');

INSERT INTO "Farm" (id, plant_time, collect_time, amount)
VALUES 
(1, '2023-03-15 08:00:00', '2023-04-01 10:00:00', 50),
(2, '2023-03-20 07:30:00', '2023-04-05 09:30:00', 30),
(3, '2023-03-25 09:00:00', '2023-04-10 11:45:00', 40),
(4, '2023-03-30 06:45:00', '2023-04-15 08:20:00', 25),
(5, '2023-04-05 10:30:00', '2023-04-20 12:15:00', 35),
(6, '2023-04-10 09:15:00', '2023-04-25 11:30:00', 45),
(7, '2023-04-15 07:00:00', '2023-04-30 09:40:00', 55),
(8, '2023-04-20 08:45:00', '2023-05-05 10:25:00', 60),
(9, '2023-04-25 06:30:00', '2023-05-10 08:00:00', 70),
(10, '2023-05-01 09:20:00', '2023-05-16 11:15:00', 65),
(11, '2023-05-07 11:00:00', '2023-05-22 13:30:00', 80),
(12, '2023-05-13 10:30:00', '2023-05-28 12:45:00', 75),
(13, '2023-05-19 08:15:00', '2023-06-03 10:20:00', 90),
(14, '2023-05-25 07:00:00', '2023-06-10 09:50:00', 100),
(15, '2023-05-31 09:45:00', '2023-06-15 11:35:00', 110),
(16, '2023-06-06 06:30:00', '2023-06-21 08:10:00', 120),
(17, '2023-06-12 08:20:00', '2023-06-27 10:00:00', 115),
(18, '2023-06-18 10:00:00', '2023-07-03 12:30:00', 130),
(19, '2023-06-24 09:30:00', '2023-07-09 11:45:00', 140),
(20, '2023-06-30 08:15:00', '2023-07-15 10:20:00', 150),
(21, '2023-07-06 06:00:00', '2023-07-21 08:30:00', 160),
(22, '2023-07-12 07:45:00', '2023-07-27 09:55:00', 165),
(23, '2023-07-18 09:30:00', '2023-08-02 11:40:00', 170),
(24, '2023-07-24 11:15:00', '2023-08-09 13:10:00', 175),
(25, '2023-07-30 10:00:00', '2023-08-15 12:25:00', 180),
(26, '2023-08-05 08:45:00', '2023-08-20 10:35:00', 190),
(27, '2023-08-11 07:30:00', '2023-08-26 09:50:00', 200),
(28, '2023-08-17 09:15:00', '2023-09-01 11:25:00', 210),
(29, '2023-08-23 06:00:00', '2023-09-08 08:45:00', 220),
(30, '2023-08-29 08:45:00', '2023-09-14 10:55:00', 230);

INSERT INTO "Additionals" (id, name_, amount, price)
VALUES 
(1, 'Potting soil', 20, 5),
(2, 'Fertilizer', 15, 10),
(3, 'Pest control spray', 10, 8),
(4, 'Garden gloves', 25, 10),
(5, 'Garden hose nozzle', 15, 12),
(6, 'Pruning shears', 18, 15),
(7, 'Watering can', 20, 10),
(8, 'Plant food', 12, 8),
(9, 'Mulch', 22, 6),
(10, 'Plant labels', 30, 4),
(11, 'Garden hand tools set', 25, 20),
(12, 'Insect repellent candles', 35, 18),
(13, 'Plant containers', 28, 14),
(14, 'Gardening knee pads', 15, 10),
(15, 'Plant stakes', 20, 5),
(16, 'Garden twine', 18, 7),
(17, 'Compost bin', 10, 25),
(18, 'Seed starter trays', 20, 15),
(19, 'Plant propagation kit', 12, 20),
(20, 'Garden cart', 8, 30),
(21, 'Hand rake', 25, 8),
(22, 'Garden shovel', 18, 12),
(23, 'Wheelbarrow', 10, 40),
(24, 'Plant support cages', 15, 10),
(25, 'Garden edging', 20, 9),
(26, 'Soil moisture meter', 22, 15),
(27, 'Garden seedling heat mats', 12, 20),
(28, 'Weeding tool', 20, 7),
(29, 'Rain gauge', 18, 10),
(30, 'Pruning saw', 10, 15);

INSERT INTO "Product_storage" (id, name_, amount)
VALUES 
(1, 'Rose bushes', 10),
(2, 'Tomato plants', 15),
(3, 'Lavender seedlings', 20),
(4, 'Apple tree saplings', 5),
(5, 'Cactus plants', 8),
(6, 'Hydrangea bushes', 12),
(7, 'Basil plants', 18),
(8, 'Lemon tree saplings', 3),
(9, 'Succulent varieties', 25),
(10, 'Orchid plants', 7),
(11, 'Pepper seedlings', 13),
(12, 'Bamboo plants', 9),
(13, 'Sunflower seed packets', 30),
(14, 'Tulip bulbs', 22),
(15, 'Daisy seedlings', 17),
(16, 'Fern varieties', 11),
(17, 'Palm tree saplings', 4),
(18, 'Hosta plants', 28),
(19, 'Carnation seedlings', 16),
(20, 'Lily bulbs', 20),
(21, 'Pine tree saplings', 6),
(22, 'Hibiscus plants', 14),
(23, 'Maple tree saplings', 8),
(24, 'Succulent arrangements', 23),
(25, 'Coleus plant varieties', 19),
(26, 'Geranium plants', 11),
(27, 'Spider plant varieties', 15),
(28, 'Peony bushes', 10),
(29, 'Zinnia seed packets', 26),
(30, 'Aloe vera plants', 12);

INSERT INTO "Package" (id, product_id, type_, amount, price, additionals_id)
VALUES 
(1, 1, 'Flower pot', 3, 9.99, 1),
(2, 2, 'Vegetable seedlings', 5, 15.50, 2),
(3, 1, 'Herb garden kit', 2, 12.75, 3),
(4, 3, 'Fruit tree sapling', 1, 20.00, 1),
(5, 2, 'Garden tool set', 1, 22.50, 2),
(6, 1, 'Plant stand', 4, 16.99, 3),
(7, 3, 'Potted succulent', 3, 11.25, 1),
(8, 2, 'Indoor plant', 2, 18.50, 2),
(9, 1, 'Hanging basket', 1, 14.00, 3),
(10, 3, 'Bouquet of flowers', 1, 25.75, 1),
(11, 2, 'Terrarium', 2, 19.50, 2),
(12, 1, 'Bulb assortment', 3, 13.99, 3),
(13, 3, 'Seed packets', 5, 8.75, 1),
(14, 2, 'Gardening gloves', 2, 9.50, 2),
(15, 1, 'Watering can', 1, 17.00, 3),
(16, 3, 'Garden decorations', 1, 30.50, 1),
(17, 2, 'Garden hose', 4, 26.75, 2),
(18, 1, 'Fertilizer spikes', 3, 14.99, 3),
(19, 3, 'Compost bin', 2, 32.50, 1),
(20, 2, 'Insect repellent', 1, 18.99, 2),
(21, 1, 'Plant labels', 1, 5.50, 3),
(22, 3, 'Mulch bags', 3, 9.75, 1),
(23, 2, 'Pruning shears', 2, 12.50, 2),
(24, 1, 'Garden trowel', 1, 8.00, 3),
(25, 3, 'Garden cart', 4, 39.50, 1),
(26, 2, 'Seeds starter kit', 2, 21.99, 2),
(27, 1, 'Plant saucer', 1, 6.75, 3),
(28, 3, 'Raised garden bed', 1, 45.00, 1),
(29, 2, 'Potting bench', 3, 29.75, 2),
(30, 1, 'Garden trellis', 2, 17.50, 3);

INSERT INTO "Clients" (id, name_, order_num, order_sum, sale)
VALUES 
(1, 'Alice', 5, 191.80, 0.1),
(2, 'Bob', 4, 167.15, 0),
(3, 'Charlie', 6, 230.90, 0.05),
(4, 'Danielle', 3, 141.75, 0.08),
(5, 'Eve', 7, 275.50, 0.12),
(6, 'Frank', 4, 188.25, 0.15),
(7, 'Grace', 5, 212.40, 0.09),
(8, 'Henry', 5, 205.75, 0.11),
(9, 'Ivy', 6, 242.30, 0.07),
(10, 'Jack', 3, 131.90, 0.13),
(11, 'Kate', 8, 310.25, 0.06),
(12, 'Luke', 4, 175.60, 0.14),
(13, 'Mia', 6, 238.75, 0.08),
(14, 'Nick', 3, 145.30, 0.12),
(15, 'Olivia', 7, 283.90, 0.1),
(16, 'Peter', 4, 202.75, 0.07),
(17, 'Queenie', 5, 219.60, 0.13),
(18, 'Roger', 5, 197.25, 0.15),
(19, 'Sarah', 6, 254.30, 0.1),
(20, 'Tom', 3, 136.90, 0),
(21, 'Ursula', 8, 320.25, 0.05),
(22, 'Victor', 4, 182.60, 0.11),
(23, 'Wendy', 6, 248.75, 0.06),
(24, 'Xander', 3, 153.30, 0.09),
(25, 'Yara', 7, 291.90, 0.12),
(26, 'Zane', 4, 195.75, 0.08),
(27, 'Amelia', 5, 225.60, 0.1),
(28, 'Ben', 5, 209.25, 0.07),
(29, 'Cathy', 6, 262.30, 0.13),
(30, 'Dylan', 3, 141.90, 0.1);

INSERT INTO "Courier" (id, name_, workplace) 
VALUES 
(1, 'John', 'Main St'),
(2, 'Sarah', 'Elm St'),
(3, 'Michael', 'Oak St'),
(4, 'Emily', 'Pine St'),
(5, 'William', 'Maple St'),
(6, 'Sophia', 'Birch St'),
(7, 'James', 'Cedar St'),
(8, 'Olivia', 'Walnut St'),
(9, 'Daniel', 'Spruce St'),
(10, 'Ava', 'Ash St');

INSERT INTO "Order" (id, client_id, courier_id, address, del_time, finished, price)
VALUES 
(1, 1, 1, '123 Main St', '2023-04-10 15:30:00', TRUE, 25.50),
(2, 2, 2, '456 Elm St', '2023-04-11 10:00:00', FALSE, 18.75),
(3, 1, 3, '789 Oak St', '2023-04-12 13:45:00', TRUE, 30.00),
(4, 3, 1, '321 Pine St', '2023-04-14 09:00:00', FALSE, 22.95),
(5, 2, 4, '654 Maple St', '2023-04-15 17:30:00', TRUE, 35.75),
(6, 3, 3, '987 Cedar St', '2023-04-16 11:15:00', FALSE, 27.80),
(7, 1, 2, '135 Birch St', '2023-04-18 14:00:00', TRUE, 40.20),
(8, 2, 1, '468 Ash St', '2023-04-19 08:45:00', FALSE, 32.50),
(9, 3, 4, '753 Walnut St', '2023-04-20 12:30:00', TRUE, 45.00),
(10, 1, 3, '246 Fir St', '2023-04-21 16:20:00', FALSE, 38.90),
(11, 2, 4, '579 Poplar St', '2023-04-23 10:10:00', TRUE, 50.75),
(12, 3, 1, '864 Spruce St', '2023-04-24 18:00:00', FALSE, 42.60),
(13, 1, 2, '159 Chestnut St', '2023-04-25 13:00:00', TRUE, 55.30),
(14, 2, 3, '492 Sycamore St', '2023-04-26 09:30:00', FALSE, 48.25),
(15, 3, 4, '725 Hemlock St', '2023-04-28 11:45:00', TRUE, 60.50),
(16, 1, 1, '369 Oakwood St', '2023-04-29 15:15:00', FALSE, 52.75),
(17, 2, 2, '642 Cedarwood St', '2023-04-30 08:00:00', TRUE, 65.00),
(18, 3, 3, '975 Pinecrest St', '2023-05-01 12:20:00', FALSE, 58.90),
(19, 1, 4, '318 Maplewood St', '2023-05-02 17:00:00', TRUE, 70.25),
(20, 2, 1, '561 Birchwood St', '2023-05-04 10:30:00', FALSE, 62.60),
(21, 3, 2, '894 Elmwood St', '2023-05-05 14:45:00', TRUE, 75.30),
(22, 1, 3, '137 Pineview St', '2023-05-06 09:40:00', FALSE, 67.25),
(23, 2, 4, '470 Cedarhill St', '2023-05-08 12:10:00', TRUE, 80.50),
(24, 3, 1, '703 Mapleridge St', '2023-05-09 16:50:00', FALSE, 72.60),
(25, 1, 2, '936 Birchridge St', '2023-05-10 15:00:00', TRUE, 85.25),
(26, 2, 3, '179 Pinevale St', '2023-05-11 08:30:00', FALSE, 77.60),
(27, 3, 4, '412 Maplegate St', '2023-05-12 14:20:00', TRUE, 90.30),
(28, 1, 1, '645 Cedarvale St', '2023-05-13 10:45:00', FALSE, 82.25),
(29, 2, 2, '878 Pinewood St', '2023-05-15 11:30:00', TRUE, 95.50),
(30, 3, 3, '101 Mapletree St', '2023-05-16 17:25:00', FALSE, 87.60);

SELECT client_id, SUM(price) as total_price
FROM "Order"
GROUP BY client_id
HAVING SUM(price) > 100
ORDER BY client_id;

SELECT type_, AVG(price) as avg_price
FROM "Package"
GROUP BY type_
ORDER BY type_;

SELECT ps.name_, SUM(ps.amount) as total_amount
FROM "Product_storage" ps
JOIN "Package" pr ON ps.id = pr.product_id
GROUP BY ps.name_
HAVING SUM(ps.amount) > (SELECT AVG(amount) FROM "Product_storage")
ORDER BY total_amount;

SELECT ps.name_, SUM(ps.amount) as total_amount
FROM "Product_storage" ps
JOIN "Package" pr ON ps.id = pr.product_id
GROUP BY ps.name_
HAVING SUM(ps.amount) > (SELECT AVG(amount) FROM "Product_storage")
ORDER BY total_amount;

SELECT c.name_, AVG(o.price) as avg_order_price
FROM "Order" o
JOIN "Courier" c ON o.courier_id = c.id
GROUP BY c.name_
ORDER BY avg_order_price DESC;

SELECT c.name_, COUNT(o.client_id) as num_orders, SUM(o.price) as total_orders
FROM "Order" o
JOIN "Clients" c ON o.client_id = c.id
GROUP BY c.name_
HAVING SUM(o.price) > 200
ORDER BY total_orders DESC;

SELECT id, AVG(amount) OVER (PARTITION BY id) as avg_plant_amount
FROM "Farm"
ORDER BY id;

SELECT client_id, COUNT(id) as num_orders, SUM(price) as total_orders
FROM "Order"
GROUP BY client_id
HAVING COUNT(id) > 2 AND SUM(price) > 150
ORDER BY client_id;

SELECT a.name_, SUM(amount) as total_amount, AVG(price) as avg_price
FROM "Additionals" a
GROUP BY a.name_
ORDER BY a.name_;

SELECT c.name_, COUNT(o.id) as num_orders, SUM(o.price) as total_price
FROM "Order" o
JOIN "Courier" c ON o.courier_id = c.id
GROUP BY c.name_
HAVING COUNT(o.id) > (SELECT AVG(num_orders) FROM (SELECT COUNT(id) as num_orders FROM "Order" GROUP BY courier_id) as avg_orders)
ORDER BY c.name_;



