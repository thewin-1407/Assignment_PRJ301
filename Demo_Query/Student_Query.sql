-- View Grade by Subject for Student
SELECT
    s.sname AS StudentName,
    su.subname AS SubjectName,
    a.aname AS AssessmentName,
    g.score AS Score
FROM
    students s
INNER JOIN
    grades g ON s.sid = g.sid
INNER JOIN
    exams e ON g.eid = e.eid
INNER JOIN
    assesments a ON e.aid = a.aid
INNER JOIN
    subjects su ON a.subid = su.subid
WHERE
    s.sid = ?
    AND su.subid = ?

GO

-- View Student in Courses by Student
SELECT DISTINCT s.sid, s.sname, c.cname
FROM students s
JOIN courses_students cs ON s.sid = cs.sid
JOIN courses c ON c.cid = cs.cid
WHERE c.cid = ?

GO

-- View Courses by Student ID
SELECT
    c.cname,
    l.lname,
	s.sname
FROM
    courses c
INNER JOIN
    lecturers l ON c.lid = l.lid
INNER JOIN
    courses_students cs ON c.cid = cs.cid
INNER JOIN
    students s ON cs.sid = s.sid
WHERE
    s.sid = 1


GO

