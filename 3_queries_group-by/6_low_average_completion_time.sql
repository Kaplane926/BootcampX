SELECT students.name as student, avg(assignment_submissions.duration) as average_assignemnt_duration, avg(assignments.duration) as average_estimated_duration
FROM assignments
JOIN assignment_submissions ON assignments.id = assignment_id
JOIN students ON students.id = student_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignemnt_duration;