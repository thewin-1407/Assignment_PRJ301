-- View Courses for Student
SELECT
    s.sid AS StudentID,
    s.sname AS StudentName,
    c.cname AS CourseName,
    l.lname AS LecturerName
FROM
    students s
INNER JOIN
    courses_students cs ON s.sid = cs.sid
INNER JOIN
    courses c ON cs.cid = c.cid
INNER JOIN
    lecturers l ON c.lid = l.lid
WHERE
    s.sid = ?

GO

-- View Subject by Courses for Student
SELECT
    s.sname AS StudentName,
    su.subid AS SubjectID,
    su.subname AS SubjectName
FROM
    students s
INNER JOIN
    courses_students cs ON s.sid = cs.sid
INNER JOIN
    courses c ON cs.cid = c.cid
INNER JOIN
    subjects su ON c.subid = su.subid
WHERE
    s.sid = ?

GO

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

