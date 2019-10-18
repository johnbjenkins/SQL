SELECT COUNT(title)
FROM books;

SELECT released_year, COUNT(title)
FROM books
GROUP BY released_year;

SELECT SUM(stock_quantity)
FROM books;

SELECT author_fname, author_lname, AVG(released_year)
FROM books
GROUP BY author_lname,author_fname;

SELECT 	CONCAT(author_fname, " ", author_lname) AS "Author", 
		CONCAT("Wrote the longest book which is ",pages, " pages long") AS "statement" 
FROM books 
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT 	released_year AS "year",
		COUNT(title) AS "# books",
		AVG(pages) AS "avg pages"
FROM books
GROUP BY released_year;