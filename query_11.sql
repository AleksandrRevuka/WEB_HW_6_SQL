-- Середній бал, який певний викладач ставить певному студентові.
SELECT ROUND(AVG(j.gread), 2) AS average_grade
FROM students s
JOIN journal j ON s.student_id = j.student_id 
JOIN teachers t ON j.subject_id = t.subject_id 
WHERE s.student = "Allison Brown" AND t.teacher = "Leroy Scott"