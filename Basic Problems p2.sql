SELECT* FROM books
SELECT* FROM branch
SELECT* FROM employees
SELECT* FROM issued_status
SELECT* FROM members
SELECT* FROM return_status



--PROJECT TASK:

--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"


INSERT INTO books
            (isbn , book_title, category, rental_price, status, author, publisher )
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee',  'J.B. Lippincott & Co.');

SELECT * FROM books


--Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = '154 Church St'
WHERE member_id = 'C101';

SELECT* FROM members;


--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.


DELETE FROM issued_status
WHERE issued_id ='IS121';
SELECT* FROM issued_status;



--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.


SELECT* FROM issued_status
WHERE issued_emp_id ='E101';



--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.


SELECT 
      issued_emp_id,
	  COUNT(*)
FROM issued_status
GROUP BY 1
HAVING COUNT(*) >1;


--CTAS
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_issued_cnt AS 
SELECT
      b.isbn,
	  b.book_title,
	  COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;

--Task 7: Retrieve All Books in a Specific Category:


SELECT*
FROM books
WHERE category ='History';


--Task 8: Find Total Rental Income by Category:


SELECT
     b.category,
	 SUM (b.rental_price),
	 COUNT(*)
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1;


--Task 9: List Members Who Registered in the Last 180 Days:


SELECT* FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';


INSERT INTO members(member_id,member_name,member_address,reg_date)
VALUES('C120','Jhon Doe','777 Los Ag','2026-02-26'),
      ('C121','Joe Root','145 7NY Wood Lane','2026-01-15');


--Task 10: List Employees with Their Branch Manager's Name and their branch details:


SELECT
      em1.*,
	  br.manager_id,
	  em2.emp_name AS manager
FROM employees AS em1
JOIN 
     branch AS br
ON br.branch_id = em1.branch_id
JOIN
    employees AS em2
ON br.manager_id = em2.emp_id;


--Task 11. Create a Table of Books with Rental Price Above a Certain Threshold(7USD):

CREATE TABLE expensive_books
AS
SELECT* FROM books
WHERE rental_price > 7.00;


--Task 12: Retrieve the List of Books Not Yet Returned

SELECT* FROM issued_status AS ist
LEFT JOIN return_status AS rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL



----------------------------------------------------------------------------------------------------