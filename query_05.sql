-- Знайти, які курси читає певний викладач.
SELECT t.teacher, s.subject_name 
FROM teachers t 
JOIN subjects s ON t.subject_id  = s.subject_id 
WHERE t.teacher = "Leroy Scott";