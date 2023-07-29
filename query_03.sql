-- Знайти середній бал у групах з певного предмета.
SELECT g.group_id, g.group_name, ROUND(AVG(j.gread), 2) AS average_grade
FROM groups g
JOIN students s ON g.group_id = s.group_id
JOIN journal j ON s.student_id = j.student_id
JOIN subjects sub ON j.subject_id = sub.subject_id
WHERE sub.subject_name = "Computer Science"
GROUP BY g.group_id, g.group_name;