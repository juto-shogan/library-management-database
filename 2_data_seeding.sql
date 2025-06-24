INSERT INTO authors(author_id, author_name, author_nationality, birth_date, death_date, biography) VALUES
(1, 'George Orwell', 'British', '1903-06-25', '1950-01-21', 'George Orwell was an English novelist and essayist, journalist and critic.'),
(2, 'J.K. Rowling', 'British', '1965-07-31', NULL, 'J.K. Rowling is a British author, best known for writing the Harry Potter fantasy series.'),
(3, 'Haruki Murakami', 'Japanese', '1949-01-12', NULL, 'Haruki Murakami is a contemporary Japanese writer, known for his surreal and dreamlike narratives.'),
(4, 'Gabriel Garcia Marquez', 'Colombian', '1927-03-06', '2014-04-17', 'Gabriel Garcia Marquez was a Colombian novelist, known for his magical realism.'),
(5, 'Jane Austen', 'British', '1775-12-16', '1817-07-18', 'Jane Austen was an English novelist known for her six major novels.');

INSERT INTO members(member_id, member_name, email, phone_number, address, date_joined, is_active, date_of_birth) VALUES
(1, 'Alice Smith', 'alice.smith@example.com', '123-456-7890', '123 Main St, Anytown, USA', '2020-01-15', TRUE, '1990-05-10'),
(2, 'Bob Johnson', 'bob.johnson@example.com', '234-567-8901', '456 Elm St, Othertown, USA', '2021-02-20', TRUE, '1985-08-25'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '345-678-9012', '789 Oak St, Sometown, USA', '2019-03-30', TRUE, '1992-12-05'),
(4, 'David Wilson', 'david.wilson@example.com', '456-789-0123', '101 Pine St, Anycity, USA', '2020-04-10', TRUE, '1980-03-15'),
(5, 'Eva Green', 'eva.green@example.com', '567-890-1234', '202 Maple St, Othercity, USA', '2021-05-25', TRUE, '1995-07-20');

INSERT INTO publishers(publisher_id, publisher_name) VALUES
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Simon & Schuster'),
(4, 'Hachette Livre'),
(5, 'Macmillan Publishers');

INSERT INTO genres(genre_id, genre_name) VALUES
(1, 'Fiction'),
(2, 'Science Fiction'),
(3, 'Fantasy'),
(4, 'Mystery'),
(5, 'Romance');

INSERT INTO books(book_id, book_name, description, isbn, publisher_id, publication_year, edition, language, page_count, genre_id) VALUES
(1, '1984', 'A dystopian novel set in a totalitarian society ruled by Big Brother.', '978-0451524935', 1, 1949, 'First Edition', 'English', 328, 1),
(2, 'Harry Potter and the Philosopher''s Stone', 'The first book in the Harry Potter series about a young wizard.', '978-0747532699', 2, 1997, 'First Edition', 'English', 223, 3),
(3, 'Kafka on the Shore', 'A surreal novel blending reality and fantasy.', '978-1400079278', NULL, 2002, NULL, 'English', 505, 2),
(4, 'One Hundred Years of Solitude', 'A multi-generational story of the Buendía family in the fictional town of Macondo.', '978-0060883287', 4, 1967, NULL, 'English', 417, 1),
(5, 'Pride and Prejudice', 'A romantic novel that critiques the British landed gentry at the end of the 18th century.', '978-1503290563', NULL, 1813, NULL, 'English', 279, 5);

INSERT INTO book_authors(book_id, author_id) VALUES
(1, 1), -- 1984 by George Orwell
(2, 2), -- Harry Potter by J.K. Rowling
(3, 3), -- Kafka on the Shore by Haruki Murakami
(4, 4), -- One Hundred Years of Solitude by Gabriel Garcia Marquez
(5, 5); -- Pride and Prejudice by Jane Austen

INSERT INTO book_copies(copy_id, book_id, barcode, status, shelf_location, acquisition_date, condition) VALUES
(1, 1, 'BC-1984-001', 'Available', 'Fiction-A', '2023-01-01', 'Good'),
(2, 1, 'BC-1984-002', 'Available', 'Fiction-A', '2023-01-02', 'New'),
(3, 2, 'BC-HarryPotter-001', 'Available', 'Fantasy-H', '2023-01-03', 'Good'),
(4, 3, 'BC-Kafka-001', 'Available', 'Fiction-M', '2023-01-04', 'Excellent'),
(5, 4, 'BC-OneHundredYears-001', 'Available', 'Fiction-G', '2023-01-05', 'Worn'),
(6, 5, 'BC-PridePrejudice-001', 'Available', 'Romance-A', '2023-01-06', 'Good');

INSERT INTO loans(loan_id, member_id, copy_id, date_loaned, due_date, date_returned, fine_amount, fine_paid) VALUES
(1, 1, 1, '2023-01-10', '2023-02-10', NULL, 0.00, FALSE),
(2, 2, 2, '2023-01-11', '2023-02-11', NULL, 0.00, FALSE),
(3, 3, 3, '2023-01-12', '2023-02-12', NULL, 0.00, FALSE),
(4, 4, 4, '2023-01-13', '2023-02-13', NULL, 0.00, FALSE),
(5, 5, 5, '2023-01-14', '2023-02-14', NULL, 0.00, FALSE);