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
