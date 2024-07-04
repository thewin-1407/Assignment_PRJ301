-- View Grade by sid & subid
SELECT 
    s.sname,
    sb.subname, 
    a.aname, 
	a.weight,
    g.score
FROM 
    grades g
JOIN 
    students s ON g.sid = s.sid
JOIN 
    exams e ON g.eid = e.eid
JOIN 
    assesments a ON e.aid = a.aid
JOIN 
    subjects sb ON a.subid = sb.subid
WHERE 
    g.sid = ?
AND 
    sb.subid = ?

GO

--View Subject by sid
SELECT  sb.subid, sb.subname
FROM students s
JOIN courses_students cs ON s.sid = cs.sid
JOIN courses c ON cs.cid = c.cid
JOIN subjects sb ON c.subid = sb.subid
WHERE s.sid = ?



