CREATE DATABASE school;


CREATE TABLE Student (
	student_id INT AUTO_INCREMENT,
	student_name VARCHAR(255),
	student_age INT NOT NULL,
	address VARCHAR(255),
	PRIMARY KEY (student_id)
);


CREATE TABLE Teacher(
	teacher_id INT AUTO_INCREMENT,
	teacher_name VARCHAR(255),
	teacher_subject VARCHAR(255),
	PRIMARY KEY (teacher_id)
)


CREATE TABLE class(
	id INT AUTO_INCREMENT,
	class INT NOT NULL,
	PRIMARY KEY (id)
);



CREATE TABLE exam(
	exam_id INT AUTO_INCREMENT,
	exam_name VARCHAR(255),
	exam_subject VARCHAR(255),
	exam_teacher_id INT NOT NULL,
	class_id INT NOT NULL,
	FOREIGN KEY (exam_teacher_id) REFERENCES Teacher(teacher_id),
	FOREIGN KEY (class_id) REFERENCES class(id),	
	PRIMARY KEY (exam_id)
);



ALTER TABLE Student
ADD FOREIGN KEY (class_id) REFERENCES class(id)


ALTER TABLE Teacher
#add column class_id int not null
ADD FOREIGN KEY (class_id) REFERENCES class(id)



CREATE TABLE Questions (
	id INT AUTO_INCREMENT,
	question TEXT,
	marks INT NOT NULL,
	exam_id INT NOT NULL,
	FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
	PRIMARY KEY (id)
);



CREATE TABLE Answers(
	id INT AUTO_INCREMENT,
	question_id INT NOT NULL,
	student_answer ENUM ('TRUE', 'FALSE'),
	student_id INT NOT NULL,
	FOREIGN KEY (student_id)  REFERENCES Student(student_id),
	FOREIGN KEY (question_id)  REFERENCES Questions(id),
	PRIMARY KEY (id)
);


ALTER TABLE Answers
ADD COLUMN student_marks INT NOT NULL


CREATE TABLE Result (
	id INT AUTO_INCREMENT,
	student_id INT NOT NULL,
	student_marks INT NOT NULL,
	question_id INT NOT NULL,
	FOREIGN KEY (student_id)  REFERENCES Student(student_id),
	FOREIGN KEY (question_id)  REFERENCES Questions(id),
	#FOREIGN KEY (student_marks)  REFERENCES Answers(student_marks),
	PRIMARY KEY (id)
);



CREATE TABLE Solution (
	id INT AUTO_INCREMENT,
	solution ENUM('TRUE', 'False'),
	question_id INT NOT NULL,
	FOREIGN KEY (question_id)  REFERENCES Questions(id),
	PRIMARY KEY (id)
);


# Query Student by Class
SELECT Student.student_name, Class.class FROM Student
JOIN Class ON Student.class_id = Class.id
WHERE Class.class=10

# Query Student by Teacher

SELECT Student.student_name, Class.class, Teacher.teacher_name, Teacher.teacher_subject 
FROM Student
JOIN Class ON Student.class_id = Class.id
JOIN Teacher ON Class.id = Teacher.class_id
WHERE Teacher.teacher_name = 'Naomi Sanchez'



# Query question by exam

SELECT * FROM Questions 
JOIN exam ON Questions.exam_id = exam.exam_id
WHERE exam.exam_id = 1



# Query question by exam

SELECT * FROM Questions 
JOIN exam ON Questions.exam_id = exam.exam_id
JOIN Solution ON Questions.id = Solution.question_id
JOIN Answers ON Questions.id = Answers.question_id
WHERE exam.exam_id = 1 AND Answers.student_id =1 AND Answers.student_answer != Solution.solution


# Query solution by exam with question

SELECT
Questions.question, Solution.solution, exam.exam_subject
FROM Solution
JOIN Questions ON Solution.question_id = Questions.id
JOIN exam ON Questions.exam_id = exam.exam_id
WHERE exam.exam_id = 1




ALTER TABLE class  RENAME TO Class

# Query student answers by exam

SELECT Student.student_name, 
Questions.question,
Answers.student_answer,
exam.exam_id,
exam.exam_name
FROM Answers
JOIN Student ON Answers.student_id = Student.student_id 
JOIN Questions ON Answers.question_id = Questions.id
JOIN exam ON Questions.exam_id  = exam.exam_id 




ALTER TABLE Result
DROP FOREIGN KEY Result_ibfk_2 


ALTER TABLE Result
DROP COLUMN question_id


ALTER TABLE Result
ADD COLUMN exam_id INT NOT NULL


ALTER TABLE Result
ADD FOREIGN KEY (exam_id) REFERENCES exam(exam_id)




# calculate total marks of a student by checking it with correct answer

SELECT
Answers.student_id,
SUM(Questions.marks) AS total_marks
FROM Answers
JOIN Solution ON Answers.question_id = Solution.question_id
JOIN Questions ON Answers.question_id = Questions.id
WHERE Answers.student_answer = Solution.solution AND Questions.exam_id = 1
GROUP BY Answers.student_id



ALTER TABLE Solution
MODIFY COLUMN solution ENUM ('TRUE', 'FALSE')









# Query student result by exam

SELECT Student.student_id, Student.student_name,
Result.student_marks, exam.exam_name, exam_subject
FROM Student
JOIN Result ON Student.student_id = Result.student_id
JOIN exam ON Result.exam_id = exam.exam_id
WHERE exam.exam_name = 'Unit 1'



# query top students
SELECT Student.student_id, Student.student_name,
Result.student_marks, exam.exam_name, exam_subject
FROM Student
JOIN Result ON Student.student_id = Result.student_id
JOIN exam ON Result.exam_id = exam.exam_id
#WHERE exam.exam_subject = 'English'
ORDER BY student_marks DESC





# query top students by exam
SELECT Student.student_id, Student.student_name,
Result.student_marks, exam.exam_name, exam_subject
FROM Student
JOIN Result ON Student.student_id = Result.student_id
JOIN exam ON Result.exam_id = exam.exam_id
WHERE exam.exam_subject = 'English'
ORDER BY student_marks DESC




ALTER TABLE Answers
DROP COLUMN student_marks





SELECT exam.exam_name, Student.student_name, COUNT(Answers.student_answer)
FROM Student
JOIN Answers ON Student.student_id = Answers.student_id
JOIN Questions ON Answers.question_id = Questions.id
JOIN exam ON Questions.exam_id = exam.exam_id
JOIN Solution ON Answers.student_answer = Solution.solution
WHERE Answers.student_answer = Solution.solution AND Student.student_id =1 AND exam.exam_id =1
GROUP BY  exam.exam_name, Student.student_name



SELECT exam.exam_name,  Student.student_name,
COUNT(Answers.student_answer) AS total_correct_ans
SUM(CASE WHEN Answers.student_answer = TRUE THEN 1 ELSE 0 END)
FROM Answers
JOIN Solution ON Answers.question_id = Solution.question_id
JOIN Questions ON Answers.question_id = Questions.id
JOIN Student ON Answers.student_id = Student.student_id
JOIN exam ON Questions.exam_id = exam.exam_id
WHERE Answers.student_answer = Solution.solution AND Questions.exam_id = 1
GROUP BY Answers.student_id



SELECT  exam.exam_id, COUNT(exam.exam_id)
FROM Questions
JOIN exam ON Questions.exam_id = exam.exam_id
GROUP BY exam.exam_id



