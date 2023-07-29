-- Знайти список студентів у певній групі.
SELECT s.student_id, s.student 
FROM students s
JOIN groups g ON s.group_id = g.group_id
WHERE g.group_name = "VZ-70"