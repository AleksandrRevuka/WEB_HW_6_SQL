-- Знайти список курсів, які відвідує студент.
SELECT DISTINCT sub.subject_name
FROM students s 
JOIN journal j ON s.student_id = j.student_id 
JOIN subjects sub ON j.subject_id = sub.subject_id 
WHERE s.student = "Allison Brown";