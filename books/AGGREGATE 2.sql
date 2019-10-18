SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname,author_lname) FROM books;

SELECT COUNT(title) FROM books WHERE title LIKE "%the%";

SELECT author_lname,
COUNT(*)
FROM books
GROUP BY author_lname;

SELECT author_fname,author_lname,
COUNT(*)
FROM books GROUP BY author_lname,author_fname;

SELECT released_year,
COUNT(*)
FROM books
GROUP BY released_year;

SELECT CONCAT("In ", released_year," ", COUNT(*), " book(s) released")
AS "Annual Count"
FROM books
GROUP BY released_year;

SELECT MIN(released_year)
FROM books;

SELECT MAX(pages),title
FROM books; ***GENERATES AN ERROR***

SELECT title, pages 
FROM books 
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT title,pages FROM books
ORDER BY pages DESC LIMIT 1;
# Does the same as previous block but with single query

SELECT author_fname,author_lname,MIN(released_year)
FROM books
GROUP BY author_lname,author_fname;

SELECT author_fname,author_lname,MAX(pages)
FROM books
GROUP BY author_lname,author_fname;

SELECT SUM(pages)
FROM books;

SELECT author_fname,author_lname, SUM(pages)
FROM books
GROUP BY author_lname, author_fname;

SELECT AVG(released_year) FROM books;

SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages)
FROM books
GROUP BY author_lname, author_fname;