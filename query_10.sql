-- Список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT sub.subject_name 
FROM students s
JOIN journal j ON s.student_id = j.student_id 
JOIN teachers t ON j.subject_id = t.subject_id
JOIN subjects sub ON t.subject_id = sub.subject_id 
WHERE s.student = "Allison Brown" AND t.teacher = "Leroy Scott";