-- View Student by Courses for Lecturer
SELECT
    s.sid AS StudentID,
    s.sname AS StudentName,
    c.cname AS CourseName
FROM
    students s
INNER JOIN
    courses_students cs ON s.sid = cs.sid
INNER JOIN
    courses c ON cs.cid = c.cid
INNER JOIN
    lecturers l ON c.lid = l.lid
WHERE
    l.lid = ?
    AND c.cid = ?

GO

-- 
SELECT
    l.lname AS LecturerName,
    sub.subname AS SubjectName,
    a.aname AS AssessmentName,
    a.weight AS AssessmentWeight,
    e.eid AS ExamID,
    e.[from] AS ExamDate,
    e.duration AS ExamDuration
FROM
    lecturers l
INNER JOIN
    courses c ON l.lid = c.lid
INNER JOIN
    subjects sub ON c.subid = sub.subid
INNER JOIN
    assesments a ON sub.subid = a.subid
INNER JOIN
    exams e ON a.aid = e.aid
WHERE
    l.lname = ?
    AND sub.subname = ?


