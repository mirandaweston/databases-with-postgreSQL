-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Lemon drizzle cake', '45', '5');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Chocolate brownie', '40', '3');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Sticky toffee pudding', '30', '4');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('White chocolate cheesecake', '25', '4');