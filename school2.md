SELECT exam.exam_name,  Student.student_name, 
SUM(CASE WHEN Answers.student_answer = Solution.solution THEN 1 ELSE 0 END) AS correct_answer, 
SUM(CASE WHEN Answers.student_answer != Solution.solution THEN 1 ELSE 0 END) AS incorrect_answer,
COUNT(exam.exam_id) AS total_answer,
SUM(Questions.marks)

#(CASE when correct_answer / total_answer * 100 > 60 then 'PASS' else 'FAIL' end) as Student_Result
FROM Answers
JOIN Solution ON Answers.question_id = Solution.question_id
JOIN Questions ON Answers.question_id = Questions.id
JOIN Student ON Answers.student_id = Student.student_id
JOIN exam ON Questions.exam_id = exam.exam_id
WHERE Questions.exam_id = 1
GROUP BY Student.student_name
