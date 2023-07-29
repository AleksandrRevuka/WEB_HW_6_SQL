-- Знайти оцінки студентів в окремій групі з певного предмета.
SELECT s.student_id, s.student, j.gread
FROM students s
JOIN journal j ON s.student_id = j.student_id
JOIN subjects sub ON j.subject_id = sub.subject_id
JOIN groups g ON s.group_id = g.group_id
WHERE sub.subject_name = "History" AND g.group_name = "RV-56";