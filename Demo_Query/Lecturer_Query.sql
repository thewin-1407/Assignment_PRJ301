
-- Grade report of Student by Courses for Lecturer
SELECT 
    s.sid, 
    s.sname, 
    c.cname, 
    a.aname, 
    g.score
FROM 
    students s
JOIN 
    courses_students cs ON s.sid = cs.sid
JOIN 
    courses c ON cs.cid = c.cid
JOIN 
    assesments a ON c.subid = a.subid
JOIN 
    exams e ON a.aid = e.aid
JOIN 
    grades g ON e.eid = g.eid AND s.sid = g.sid
WHERE 
    s.sid = ? AND c.cid = ?

GO

-- View Subjects
SELECT subid, subname FROM subjects
where subid = 1

GO

-- View Assessment
SELECT a.aname, a.[weight]
FROM dbo.assesments a
JOIN dbo.subjects s ON a.subid = s.subid
WHERE s.subid = ?


