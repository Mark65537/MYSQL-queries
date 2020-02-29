/*1*/
SELECT  a.joined_at, b.name, c.name FROM community_members a, users b, communities c
WHERE a.joined_at > '2013-01-01 00:00:00' AND a.user_id=b.id AND a.community_id=c.id 
ORDER BY a.joined_at DESC
