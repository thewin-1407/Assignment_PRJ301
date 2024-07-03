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
    s.sid = 1 AND c.cid = 2

GO

-- Grade Report
SELECT 
    s.sid,
    s.sname,
    a.aname,
    g.score
FROM 
    grades g
JOIN 
    exams e ON g.eid = e.eid
JOIN 
    assesments a ON e.aid = a.aid
JOIN 
    courses_students cs ON g.sid = cs.sid
JOIN 
    students s ON g.sid = s.sid
WHERE 
    cs.cid = ?
ORDER BY 
    s.sid, a.aid
