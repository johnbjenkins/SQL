SELECT title FROM books
WHERE released_year != 2017;

SELECT title FROM books
WHERE title LIKE "W%";

SELECT title FROM books
WHERE title NOT LIKE "W%";

SELECT title,released_year, author_fname,author_lname FROM books
WHERE released_year > 2000
ORDER BY released_year DESC;

SELECT title,released_year, author_fname,author_lname FROM books
WHERE released_year > 2010 AND author_lname = "Eggers"
ORDER BY released_year DESC;

SELECT title,released_year, author_fname,author_lname FROM books
WHERE title LIKE "%novel%" AND author_lname = "Eggers"
ORDER BY released_year DESC;

SELECT title,released_year, author_fname,author_lname FROM books
WHERE released_year <= 2015 AND released_year >= 2004
ORDER BY released_year DESC;

SELECT title,released_year, author_fname,author_lname FROM books
WHERE released_year BETWEEN 2004 AND 2015
ORDER BY released_year DESC;

SELECT CAST("2017-05-02" AS DATETIME);

SELECT name, birthdt FROM people
WHERE birthdt BETWEEN CAST("1980-01-01" AS DATETIME)
AND CAST("2000-01-01" AS DATETIME);

SELECT title, author_lname FROM books
WHERE author_lname IN ("Carver", "Lahiri", "Smith");

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ("Carver", "Lahiri", "Smith");

SELECT title, released_year FROM books
WHERE released_year>=2000 AND
released_year % 2 !=0;

SELECT title,released_year,
CASE
	WHEN released_year >= 2000 THEN "Modern Lit"
	ELSE "20th Century Lit"
END AS "Genre"
FROM books;

SELECT title,stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN "*"
		WHEN stock_quantity BETWEEN 51 AND 100 THEN "**"
		ELSE "***"
	END AS "Stock"
FROM books;