DROP TABLE IF EXISTS months;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget INT4
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  transaction_date DATE,
  payee VARCHAR(255),
  amount DECIMAL(7,2),
  category_id INT4 REFERENCES categories(id)
);

CREATE TABLE months (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  start_date DATE,
  end_date DATE
);
