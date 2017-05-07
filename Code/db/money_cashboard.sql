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

INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Jan 2017','2017-01-01','2017-01-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Feb 2017','2017-02-01','2017-02-28');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Mar 2017','2017-03-01','2017-03-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Apr 2017','2017-04-01','2017-04-30');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('May 2017','2017-05-01','2017-05-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Jun 2017','2017-06-01','2017-06-30');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Jul 2017','2017-07-01','2017-07-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Aug 2017','2017-08-01','2017-08-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Sep 2017','2017-09-01','2017-09-30');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Oct 2017','2017-10-01','2017-10-31');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Nov 2017','2017-11-01','2017-11-30');
INSERT INTO months
  (name,start_date,end_date)
VALUES
  ('Dec 2017','2017-12-01','2017-12-31');












