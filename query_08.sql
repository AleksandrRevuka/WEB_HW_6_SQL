-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT ROUND(AVG(j.gread), 2) AS average_grade
FROM teachers t 
JOIN journal j ON t.subject_id = j.subject_id 
WHERE t.teacher = "Leroy Scott";