BEGIN;

CREATE TABLE IF NOT EXISTS public.authors
(
    author_id bigserial NOT NULL,
    author_name character varying(255) NOT NULL,
    author_nationality character varying(100),
    birth_date date,
    death_date date,
    biography text,
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS public.members
(
    member_id bigserial NOT NULL,
    member_name character varying(255) NOT NULL,
    email character varying(255) UNIQUE,
    phone_number character varying(50),
    address text,
    date_joined date DEFAULT current_date,
    is_active boolean DEFAULT TRUE,
    date_of_birth date,
    PRIMARY KEY (member_id)
);

CREATE TABLE IF NOT EXISTS public.publishers
(
    publisher_id bigserial NOT NULL,
    publisher_name character varying(255) UNIQUE NOT NULL,
    PRIMARY KEY (publisher_id)
);

CREATE TABLE IF NOT EXISTS public.genres
(
    genre_id bigserial NOT NULL,
    genre_name character varying(100) UNIQUE NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS public.books
(
    book_id bigserial NOT NULL,
    book_name character varying(255) NOT NULL,
    description text,
    isbn character varying(17) UNIQUE,
    publisher_id bigint, -- Foreign Key to public.publishers
    publication_year integer,
    edition character varying(50),
    language character varying(50),
    page_count integer,
    genre_id bigint, -- Foreign Key to public.genres
    PRIMARY KEY (book_id)
);

CREATE TABLE IF NOT EXISTS public.book_copies
(
    copy_id bigserial NOT NULL,
    book_id bigint NOT NULL,
    barcode character varying(50) UNIQUE NOT NULL,
    status character varying(50) NOT NULL DEFAULT 'Available',
    shelf_location character varying(100),
    acquisition_date date DEFAULT current_date,
    condition character varying(50),
    PRIMARY KEY (copy_id)
);

CREATE TABLE IF NOT EXISTS public.book_authors
(
    book_id bigint NOT NULL,
    author_id bigint NOT NULL,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE IF NOT EXISTS public.loans
(
    loan_id bigserial NOT NULL,
    member_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    date_loaned timestamp without time zone NOT NULL DEFAULT current_timestamp,
    due_date timestamp without time zone NOT NULL,
    date_returned timestamp without time zone,
    fine_amount numeric(10, 2) DEFAULT 0.00,
    fine_paid boolean DEFAULT FALSE,
    PRIMARY KEY (loan_id)
);

ALTER TABLE IF EXISTS public.books
    ADD CONSTRAINT fk_books_publisher_id FOREIGN KEY (publisher_id)
    REFERENCES public.publishers (publisher_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL; -- If a publisher is deleted, books remain but publisher_id becomes NULL

ALTER TABLE IF EXISTS public.books
    ADD CONSTRAINT fk_books_genre_id FOREIGN KEY (genre_id)
    REFERENCES public.genres (genre_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL; -- If a genre is deleted, books remain but genre_id becomes NULL

ALTER TABLE IF EXISTS public.book_copies
    ADD CONSTRAINT fk_book_copies_book_id FOREIGN KEY (book_id)
    REFERENCES public.books (book_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE IF EXISTS public.book_authors
    ADD CONSTRAINT fk_book_authors_book_id FOREIGN KEY (book_id)
    REFERENCES public.books (book_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS public.book_authors
    ADD CONSTRAINT fk_book_authors_author_id FOREIGN KEY (author_id)
    REFERENCES public.authors (author_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS public.loans
    ADD CONSTRAINT fk_loans_member_id FOREIGN KEY (member_id)
    REFERENCES public.members (member_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.loans
    ADD CONSTRAINT fk_loans_copy_id FOREIGN KEY (copy_id)
    REFERENCES public.book_copies (copy_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;
