-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.student_id, s.student, ROUND(AVG(j.gread), 2) AS average_grade
FROM students s 
JOIN journal j on s.student_id = j.student_id
GROUP BY s.student_id, s.student
ORDER BY average_grade DESC
LIMIT 5;