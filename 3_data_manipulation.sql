--- Adding/removing books, authors, members ---
-- For removing items from a table
DELETE FROM loans WHERE loan_id = 5;
DELETE FROM books WHERE book_id = 4;
DELETE FROM authors WHERE author_id = 3;
DELETE FROM genres WHERE genre_id = 5;

-- For adding things to a table
INSERT INTO genres(genre_id, genre_name) VALUES 
(6, 'Historical Fiction'),
(7, 'Non-Fiction'),
(8, 'Biography');

INSERT INTO authors(author_id, first_name, last_name) VALUES 
(5, 'George', 'Orwell'),
(6, 'Jane', 'Austen'),
(7, 'Mark', 'Twain');

INSERT INTO books(book_id, title, author_id, genre_id, publication_year) VALUES 
(6, '1984', 5, 1, 1949),
(7, 'Pride and Prejudice', 6, 2, 1813),
(8, 'The Adventures of Tom Sawyer', 7, 3, 1876);

INSERT INTO members(member_id, member_name, email, phone_number, address, date_joined, is_active, date_of_birth) VALUES
(4, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '2020-01-15', TRUE, '1990-05-10'),
(5, 'Bob', 'Smith', 'bob.smith@example.com', '234-567-8901', '2021-02-20', TRUE, '1985-08-25');


-- Recording book loans and returns.
INSERT INTO loans(loan_id, member_id, copy_id, date_loaned, due_date, date_returned, fine_amount, fine_paid) VALUES
(6, 1, 2, '2023-01-15', '2023-02-15', '2023-02-14', 0.00, FALSE),
(7, 2, 5, '2023-01-16', '2023-02-16', '2023-02-19', 50000.00, TRUE),
(8, 3, 1, '2023-01-17', '2023-02-17', NULL, 0.00, FALSE);


-- Finding books by a specific author.
SELECT
    B.book_name,
    B.publication_year,
    G.genre_name
FROM
    books AS B
JOIN
    book_authors AS BA ON B.book_id = BA.book_id
JOIN
    authors AS A ON BA.author_id = A.author_id
LEFT JOIN
    genres AS G ON B.genre_id = G.genre_id
WHERE
    A.author_name = 'George Orwell';

-- Listing all books currently on loan.
SELECT * FROM loans WHERE date_returned IS NULL;

-- Identifying overdue books.
SELECT * FROM loans WHERE due_date < CURRENT_DATE AND date_returned IS NULL;

-- Counting books loaned by each member.
SELECT member_id, COUNT(*) FROM loans GROUP BY member_id;