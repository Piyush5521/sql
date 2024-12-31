MERGE employee AS T
USING employee_s AS S
			ON T.e_id = S.e_id
WHEN MATCH
		THEN UPDATE SET T.e_salary = S.e_salary, T.e_age = S.e_age
WHEN NOT MATCH BY TARGET
		THEN INSERT (e_id, e_name, e_salary, e_age, e_gender, e_dept)
		VALUES (S.e_id, S.e_name, S.e_salary, S.e_age, S.e_gender, S.e_dept)
WHEN NOT MATCH BY SOURCE 
		THEN DELETE;		











INSERT INTO employee_s (s_id, s_name, s_salary, s_age, s_gender, s_dept) 
VALUES
(1, 'Tom', 17000, 25, 'Male', 'IT'),
(2, 'Sam', 19000, 27, 'Male', 'QA'),
(3, 'Jack', 23000, 28, 'Male' , 'Tech'),
(6, 'Jeff', 21000, '27', 'Male', 'Tech'),
(7, 'Jen', 20000, '26', 'Female', 'Designer'),
(8, 'Anne', 19000, '25', 'Female', 'Tech');









ALTER TABLE employee_s RENAME COLUMN s_dept TO e_dept






CREATE FUNCTION add_five(@num AS INT)
RETURNS INT
AS
BEGIN
RETURN (
@num+5
)
END

SELECT dbo.add_five(10)






SELECT * FROM employee

CREATE FUNCTION select_gender(@gender AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
SELECT * FROM employee WHERE e_gender = @gender
)

SELECT * FROM dbo.select_gender('Male')









USE [MASTER]
go
ALTER DATABASE [company]
SET recovery FULL WITH NO_WAIT
go 
