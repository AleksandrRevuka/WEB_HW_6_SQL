-- Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(gread), 2) AS average_grade
FROM journal;