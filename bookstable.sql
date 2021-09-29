CREATE TABLE table_name (
    studentID int,
    FirstName varchar(255),
    LastName varchar(255),
    BookISBN varchar(255),
    DueDate DATE,
    DueTime Time(fsp),
);

<form name="form1" method="post" action="" onSubmit="return validate();">
<table border="1" cellpadding="3" cellspacing="1" align="center">
<tr>
</tr>
<tr>
<td></td>
<td><strong>Book Title</strong></td>
<td><strong>BorrowedDate</strong></td>
<td><strong>Duration</strong></td>
<td><strong>Overdue</strong></td>
<td><strong>Renewed</strong></td>
<td><strong>Student ID</strong></td>
</tr>
DELIMITER $$
CREATE PROCEDURE issue_loan (IN book_isbn CHAR(17), IN stu_no INT)

BEGIN

DECLARE availablebooks INT;
DECLARE allowedtobook BIT;

SET availablebooks = (SELECT DISTINCT
        c.isbn
    FROM
        loan l
            INNER JOIN
        student s ON l.no = s.no
            INNER JOIN
        copy c ON l.code = c.code
    WHERE
        return_date IS NOT NULL);

IF(availablebooks = book_isbn) AND s.embargo = 0 THEN
INSERT INTO loan VALUES
(code, stu_no, CURDATE(), CURDATE()+c.duration,'');
ELSE 
SIGNAL SQLSTATE '450000' SET MESSAGE_TEXT ='no Books Available';
END IF;

END$$

SET @book_available = (SELECT COUNT(*)
    FROM loan l
    INNER JOIN student s ON l.no = s.no
    INNER JOIN copy c ON l.code = c.code
    WHERE c.fk_isbn = book_isbn AND s.embargo = 0 AND l.return_date IS NULL);

IF @book_available
THEN 
    INSERT INTO loan (fk_code, fk_no, pk_taken, due, return_date)
    VALUES (code, stu_no, CURDATE(), CURDATE()+c.duration,'');
ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='no Books Available';
END IF
