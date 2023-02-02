TRUNCATE TABLE books RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (title, author_name) VALUES ('Pride and Prejudice', 'Jane Austen');
INSERT INTO books (title, author_name) VALUES ('Sense and Sensibility', 'Jane Austen');
INSERT INTO books (title, author_name) VALUES ('Little Women', 'Louisa Alcott');