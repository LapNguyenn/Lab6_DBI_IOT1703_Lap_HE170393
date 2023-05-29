use NORTHWND;
--write sql to compare 2 lowercase strings, print out the alphabetically smaller string
--@str1 = 'aprotrain', @str2 = 'aptech' --> print 'aprotrain'
declare @str1 nvarchar(40) = lower('aprotrain'), @str2 nvarchar(40) = lower('aptech');
if @str1 < @str2
	print @str1
else if (@str2 < @str1)
	print @str2
else
	print 'equal'


--write sql to remove all spaces in a string
--@str = 'This is     my homework    !' -->print Thisismyhomework!
declare @str nvarchar(40) = 'This is     my homework    !'
set @str = REPLACE(@str,' ', '')
print @str





--given 1 string with multiple spaces, write sql to separate the string by spaces.
--@str = 'aprotrain    aptech hanoi' 
	-->aprotrain
	-->aptech
	-->hanoi
DECLARE @str nvarchar(40) = 'aprotrain    aptech hanoi'
set @str = LTRIM(@str)
DECLARE @startPoint int = 1
DECLARE @endPoint int
DECLARE @substring nvarchar(40)
DECLARE @len int = len(@str)

WHILE @startPoint <= @len
BEGIN
    SET @endPoint = CHARINDEX(' ', @str, @startPoint)

    IF @endPoint = 0
       SET @endPoint = LEN(@str) + 1
    
    SET @substring = SUBSTRING(@str, @startPoint, @endPoint - @startPoint)

    IF @substring <> ' '
        PRINT @substring
    
    SET @startPoint = @endPoint + 1
END

--given 2 lowercase strings @str1, @str2; write sql to check
--if @str1 starts with @str2, print TRUE, otherwise FALSE
-----@str1 = 'hello world', @str2 = 'hello' -->print TRUE
-----@str1 = 'abcdefgh', @str2 = 'abd' -->print FALSE
DECLARE @str1 nvarchar(100) = 'hello world'
DECLARE @str2 nvarchar(100) = 'hello'

IF LEFT(@str1, LEN(@str2)) = @str2
	PRINT 'TRUE'
ELSE
	PRINT 'FALSE'



--given 2 lowercase strings @str1, @str2; write sql to check
--if @str1 ends with @str2, print TRUE, otherwise FALSE
-----@str1 = 'abcdefgh', @str2 = 'fgh' -->print TRUE
-----@str1 = 'hello world', @str2 = 'hello' -->print FALSE
DECLARE @str1 nvarchar(100) = 'hello world'
DECLARE @str2 nvarchar(100) = 'hello'

IF RIGHT(@str1, LEN(@str2)) = @str2
	PRINT 'TRUE'
ELSE
	PRINT 'FALSE'




--Look at Orders table, select:
--if ShippedDate is after RequiredDate, print Late + #days between shipped and required
--if ShippedDate is before RequiredDate, print Early + #days between shipped and required
--if ShippedDate is null, assume the order is shipped TODAY
--e.g.
/*result:
OrderID	Early/Late
10263	Early 20 days
10264	Late 2 days
10265	Early 10 days
*/
select OrderID,
	CASE
		WHEN ShippedDate IS NULL THEN 'Not shipped yet!'
		WHEN ShippedDate > RequiredDate then 'Late ' + CAST(DATEDIFF(day, RequiredDate, ShippedDate) as nvarchar) + ' days'
		WHEN ShippedDate < RequiredDate then 'Early ' + CAST(DATEDIFF(day, ShippedDate, RequiredDate) as nvarchar) + ' days'
		ELSE 'Order is shipped TODAY'
	END AS "Ship Status"
from Orders
WHERE OrderID in (10263, 10264, 10265)


--Look at Employees table, select EmployeeID, LastName, FirstName, '#birthday party'
--column '#birthday party' shows how many birthday party has happened since Birthdate to HireDate
/*
EmployeeID	LastName	FirstName	#birthday party
1	Davolio	Nancy	43
2	Fuller	Andrew	40
3	Leverling	Janet	28
4	Peacock	Margaret	55
5	Buchanan	Steven	38
6	Suyama	Michael	30
7	King	Robert	33
8	Callahan	Laura	36
9	Dodsworth	Anne	28
*/
select EmployeeID, LastName, FirstName, DATEDIFF(day, BirthDate, HireDate)/365 AS '#birthday party'
from Employees



--optional
--generate 5000 random numbers between 0 and 100, print the average of the 5000 numbers
DECLARE @count int = 0;
DECLARE @sum int = 0;

WHILE (@count < 5000)
BEGIN
    SET @sum = @sum + (RAND() * 100);
    SET @count = @count + 1;
END;

DECLARE @avg float = @sum / 5000;
PRINT @avg;

--do the task 20 times, print all 20 averages...what can you infer from the results?

