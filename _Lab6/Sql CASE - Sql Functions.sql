use NORTHWND;

--CASE
/* C programming
switch(grade) {
    case 'A' :
        printf("Excellent!\n" );
        break;
    case 'B' :
    case 'C' :
        printf("Well done\n" );
        break;
    case 'D' :
        printf("You passed\n" );
        break;
    case 'F' :
        printf("Better try again\n" );
        break;
    default :
        printf("Invalid grade\n" );
}
*/
select ProductName, UnitPrice, ReorderLevel,
case
	when ReorderLevel = 0 then 'Customers don''t like this'
	when ReorderLevel <= 15 then 'Some customers like this'
	when ReorderLevel <= 25 then 'Many customers like this'
--	else 'Everyone likes this'
end as 'Feedback'
from Products;

/************************
MSSQLSever Functions
************************/

/****** STRING ******/
--ASCII 	Returns the ASCII value for the specific character
print ascii('A');
select Address, ascii(Address) as 'Ascii Code of First Char'
from Customers;

--CHAR 	Returns the character based on the ASCII code
print char(65);

--CHARINDEX 	Returns the position of a substring in a string
print charindex('t', 'Aptech');
select charindex('m', 'HelloWorld');

--LEN 	Returns the length of a string
print len('Aptech');
select CompanyName, len(CompanyName) as '#'
from Suppliers;

--LOWER 	Converts a string to lower-case
--UPPER 	Converts a string to upper-case
print upper('aptech');
select CustomerID, lower(CustomerID) as 'lower'
from Customers;

--SUBSTRING() function extracts some characters from a string.
--SUBSTRING(string, start, length)
print substring('Hello World', 2, 4);


/****** MATH ******/
--count(), max(), min(), avg(), sum()

--ABS	Returns the absolute value of a number
print abs(-23);


--FLOOR	Returns the largest integer value that is <= to a number
print floor(3.4);
print floor(-3.4);

--CEILING	Returns the smallest integer value that is >= a number
print ceiling(1.2);
print ceiling(-1.2);

--PI	Returns the value of PI
print pi();

--POWER	Returns the value of a number raised to the power of another number
print power(3,2); --3^2

--RAND	Returns a completely random number >= 0 and <1
print rand(); --[0, 1)
print rand()*17; --[0,17)

--SQRT	Returns the square of a number
print sqrt(4);

--ISNUMERIC	Tests whether an expression is numeric
print isnumeric(12.21); --1
print isnumeric('hello'); --0

/****** DATE ******/
--GETDATE	Returns the current database system date and time
print getdate();

--ISDATE	Checks an expression and returns 1 if it is a valid date, otherwise 0
print isdate('2018-12-12'); --1
print isdate('2018-13-12'); --0


--DATEADD	Adds a time/date interval to a date and then returns the date
--DATEADD(interval, number, date)
/*interval	Required. The time/date interval to add. Can be one of the following values:
year, yyyy, yy = Year
quarter, qq, q = Quarter
month, mm, m = month
day, dy, y = Day
week, ww, wk = Week
hour, hh = hour
minute, mi, n = Minute
second, ss, s = Second
millisecond, ms = Millisecond */

print dateadd(month, 4, getdate());
print dateadd(week, -3, getdate());

--DATEDIFF	Returns the difference between two dates
--DATEDIFF(interval, date1, date2)
/*interval	Required. The part to return. Can be one of the following values:
year, yyyy, yy = Year
quarter, qq, q = Quarter
month, mm, m = month
day, dy, y = Day
week, ww, wk = Week
hour, hh = hour
minute, mi, n = Minute
second, ss, s = Second
millisecond, ms = Millisecond*/

print datediff(year, '2011-12-12', '2018-10-25');
print datediff(month, '2021-12-12', '2018-10-25');

--DATEFROMPARTS	Returns a date from the specified parts (year, month, and day values)
declare @mydate datetime;
set @mydate = DATEFROMPARTS(2018, 09, 11);
print @mydate;

--DATEPART	Returns a specified part of a date (as integer)
declare @year smallint, @month smallint, @day smallint;
set @year = DATEPART(year, getdate());
set @month = DATEPART(month, getdate());
set @day = DATEPART(day, getdate());
print @year;
print @month;
print @day;


--DAY(), MONTH(), YEAR()
declare @year smallint, @month smallint, @day smallint;
set @year = year(getdate());
set @month = month(getdate());
set @day = day(getdate());
print @year;
print @month;
print @day;


/****** SQL Server Advanced Functions ******/
--CAST	Converts a value (of any type) into a specified datatype
select ProductName + ': ' + UnitPrice as 'Details'
from Products
order by ProductName;

select ProductName + ': ' + cast(UnitPrice as varchar(10)) as 'Details'
from Products
order by ProductName;


--ISNULL() function lets you return an alternative value when an expression is NULL
select CompanyName + ' - ' + City + ' - ' + Region as 'Supplier''s Location'
from Suppliers;

select CompanyName + ' - ' + City + ' - ' + isnull(Region, 'n/a') as 'Supplier''s Location'
from Suppliers;


