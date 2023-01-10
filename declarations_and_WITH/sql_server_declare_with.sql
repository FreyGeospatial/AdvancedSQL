-- https://www.youtube.com/watch?v=5KGjqnMss7g

DECLARE @my_int AS INT;
-- USE SET OR SELECT
SET @my_int = 3;
SET @my_int = @my_int + 1
select @my_int;	
select @my_int + 1
select @my_int
select @my_int=@my_int+1
select @my_int


/*
What is a CTE Query? :::: Common Table Expression

SQL WITH Statement allows you to:
1) write or refactor subqueries
2) write recursive queries
*/

--Standard subquery:
select *
from
(select * from employee) t0

-- or!!!

WITH [cteEmployeeQuery] AS (
  SELECT * FROM employee
)
select employeeId from cteEmployeeQuery

-- or!

WITH [cteEmployeeQuery] AS (
  SELECT employeeId FROM employee
)
select * from cteEmployeeQuery

--or!

WITH [cteEmployeeQuery] (employeeIdNewName) AS (
  SELECT employeeId FROM employee
)
select * from cteEmployeeQuery

--or!
WITH [cteEmployeeQuery] (employeeIdNewName) AS (
  SELECT employeeId FROM employee
)
select EmployeeIdNewName from cteEmployeeQuery
