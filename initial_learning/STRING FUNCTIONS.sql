SELECT
REVERSE
(UPPER("Why does my cat look at me with such hatred?"));

SELECT REPLACE(CONCAT("I", " ", "like", " ", "cats"), " ", "_");	
# replaces spaces with underscores

SELECT REPLACE(title," ","->") AS "space replacement" FROM books;

SELECT 
	author_lname AS "forwards",
	REVERSE(author_lname) AS "backwards" 
FROM books;

SELECT UPPER(CONCAT(author_fname, " ",author_lname)) AS "FULL NAME IN CAPS" FROM books;

SELECT CONCAT(title, " was released in ",released_year)
AS "blurb"
FROM books;

SELECT title, (CHAR_LENGTH(title)) AS "character count" FROM books;

SELECT
CONCAT((SUBSTRING(title,1,10)),"...") AS "short title",
CONCAT(author_lname,", ",author_fname) AS "author",
CONCAT(stock_quantity," in stock") AS "quantity"
FROM books;
