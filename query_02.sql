-- Знайти студента із найвищим середнім балом з певного предмета.
SELECT s.student_id, s.student, AVG(j.gread) AS average_grade
FROM students s
JOIN journal j ON s.student_id = j.student_id
JOIN subjects sub ON j.subject_id = sub.subject_id
WHERE sub.subject_name = "Computer Science"
GROUP BY s.student_id, s.student
ORDER BY average_grade DESC
LIMIT 1;