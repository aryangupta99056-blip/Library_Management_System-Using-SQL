--LIBRARY_MANAGEMENT_SYSTEM(P2)\


--Creating Branch Tables



DROP TABLE IF EXISTS branch;
Create table branch
                (
                    branch_id VARCHAR(10) PRIMARY KEY,
                    manager_id VARCHAR(10),
					branch_address VARCHAR(55),
					contact_no VARCHAR(10)
				);
ALTER TABLE branch
ALTER COLUMN branch_id TYPE VARCHAR(25),
ALTER COLUMN manager_id TYPE VARCHAR(25),
ALTER COLUMN contact_no TYPE VARCHAR(25);

--Creating Employees Table



Create table employees
                 (emp_id VARCHAR(10) PRIMARY KEY,
				 emp_name VARCHAR(25),
				 position VARCHAR(15),
				 salary INT,
				 branch_id  VARCHAR(10)--FK
		);

ALTER TABLE employees
ALTER COLUMN salary TYPE FLOAT;

--Creating Books Table


create table books
            (  isbn VARCHAR(25) PRIMARY KEY,
			   book_title VARCHAR(75),
			   category VARCHAR(15),
			   rental_price FLOAT,
			   status VARCHAR(10),
			   author VARCHAR(30),
			   publisher VARCHAR(35)
            );
ALTER TABLE books
ALTER COLUMN category TYPE VARCHAR(25);
-- Creating Members Table


Create table members
        ( member_id VARCHAR(10) PRIMARY KEY,
		  member_name VARCHAR(25),
	      member_address VARCHAR(75),
	      reg_date Date
);



--Creating Issued_Status Table



create table issued_status
       (       issued_id VARCHAR(10) PRIMARY KEY,
			   issued_member_id VARCHAR(20),--FK
			   issued_book_name VARCHAR(75),
			   issued_date DATE,
			   issued_book_isbn VARCHAR(75),--FK
			   issued_emp_id VARCHAR(20) --FK
);


-- Creating Return_Status Table



create table return_status
        (       return_id VARCHAR(10) PRIMARY KEY,
                issued_id  VARCHAR(10),
                return_book_name VARCHAR(75),
                return_date DATE,
				return_book_isbn VARCHAR(20)
        );



--FOREIGN KEY

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY(issued_member_id)
REFERENCES members(member_id);


ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY(issued_book_isbn)
REFERENCES books(isbn );


ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY(issued_emp_id)
REFERENCES employees(emp_id );


ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY(branch_id)
REFERENCES branch(branch_id );


ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY(branch_id)
REFERENCES branch(branch_id );


ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY(issued_id)
REFERENCES issued_status(issued_id );

---------------------------------------------------------------------------------------------------------


select* from return_status