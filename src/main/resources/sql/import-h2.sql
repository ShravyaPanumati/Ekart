-- password in plaintext: "password"
INSERT INTO USER (user_id, password, email, username, name, last_name, active)
VALUES
  (1, '$2a$06$OAPObzhRdRXBCbk7Hj/ot.jY3zPwR8n7/mfLtKIgTzdJa4.6TwsIm', 'user@mail.com', 'user', 'Name', 'Surname',
   1);
-- password in plaintext: "password"
INSERT INTO USER (user_id, password, email, username, name, last_name, active)
VALUES
  (2, '$2a$06$OAPObzhRdRXBCbk7Hj/ot.jY3zPwR8n7/mfLtKIgTzdJa4.6TwsIm', 'johndoe@gmail.com', 'johndoe', 'John', 'Doe', 1);
-- password in plaintext: "password"
INSERT INTO USER (user_id, password, email, username, name, last_name, active)
VALUES (3, '$2a$06$OAPObzhRdRXBCbk7Hj/ot.jY3zPwR8n7/mfLtKIgTzdJa4.6TwsIm', 'name@gmail.com', 'namesurname', 'Name',
        'Surname', 1);

INSERT INTO ROLE (role_id, role)
VALUES (1, 'ROLE_ADMIN');
INSERT INTO ROLE (role_id, role)
VALUES (2, 'ROLE_USER');

INSERT INTO USER_ROLE (user_id, role_id)
VALUES (1, 1);
INSERT INTO USER_ROLE (user_id, role_id)
VALUES (1, 2);
INSERT INTO USER_ROLE (user_id, role_id)
VALUES (2, 2);
INSERT INTO USER_ROLE (user_id, role_id)
VALUES (3, 2);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Laptop', 'High-performance laptop with 16GB RAM', 20, 85000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Gaming Console', 'Latest generation console with 4K support', 50, 45000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Desk Chair', 'Ergonomic office chair with lumbar support', 30, 12000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Wireless Earbuds', 'Noise-cancelling earbuds with Bluetooth 5.0', 200, 7500.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Smartwatch', 'Fitness smartwatch with heart rate monitor', 150, 10000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Electric Kettle', '1.5L stainless steel electric kettle', 500, 2500.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Tablet', '10-inch tablet with stylus support', 100, 20000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Smart TV', '50-inch 4K Ultra HD Smart TV', 70, 45000.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Bluetooth Speaker', 'Portable speaker with 10-hour battery life', 300, 3500.00);

INSERT INTO PRODUCT (name, description, quantity, price)
VALUES ('Backpack', 'Water-resistant travel backpack', 150, 2000.00);
