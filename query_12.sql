-- Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT s.student_id, s.student, j.gread, j.gread_date 
FROM students s
JOIN journal j ON s.student_id = j.student_id
JOIN subjects sub ON j.subject_id = sub.subject_id
JOIN groups g ON s.group_id = g.group_id
WHERE sub.subject_name = "Computer Science" AND g.group_name = "RV-56" 
AND j.gread_date = (
SELECT MAX(gread_date) FROM journal WHERE gread_date);