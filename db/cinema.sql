DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (name) VALUES ('Sir Cody MacDuck');
INSERT INTO customers (name) VALUES ('Vincent Freeman');
INSERT INTO customers (name) VALUES ('Duncan MacLeod');

INSERT INTO films (title, price) VALUES ('CodeClan: The film', 10);
INSERT INTO films (title, price) VALUES ('Gataca', 10);
INSERT INTO films (title, price) VALUES ('Highlander', 10);

INSERT INTO tickets (film_id, customer_id) VALUES (1, 1);
INSERT INTO tickets (film_id, customer_id) VALUES (2, 2);
INSERT INTO tickets (film_id, customer_id) VALUES (3, 3);
