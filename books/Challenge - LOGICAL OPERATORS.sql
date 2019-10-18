SELECT title, author_fname,author_lname,released_year FROM books
WHERE released_year < 1980;

SELECT title, author_fname,author_lname FROM books
WHERE author_lname IN ("Eggers", "Chabon");

SELECT title, author_fname,author_lname, released_year FROM books
WHERE author_lname = "Lahiri" AND released_year > 2000;
 
SELECT title, author_fname,author_lname, pages FROM books
WHERE pages BETWEEN 100 AND 200;  

SELECT author_lname, author_fname, title FROM books
WHERE author_lname LIKE "C%" OR author_lname LIKE "S%";

SELECT title,author_lname, 
	CASE
		WHEN title LIKE "%stories%" THEN "Short Stories"
		WHEN title LIKE "%kids%" OR title LIKE "%Heart%" THEN "Memoir"
		ELSE "Novel"
	END AS "TYPE"
FROM books;


SELECT author_fname,author_lname,
	CASE
		WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), " book")
		ELSE CONCAT(COUNT(*), " books")
	END AS "Count"
FROM books
GROUP BY author_lname,author_fname;

