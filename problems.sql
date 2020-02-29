/*1*/
SELECT  a.joined_at, b.name, c.name FROM community_members a, users b, communities c
WHERE a.joined_at > '2013-01-01 00:00:00' AND a.user_id=b.id AND a.community_id=c.id 
ORDER BY a.joined_at DESC
/*2*/
SELECT result.community_id, c.name, p.name, count(result.user_id)  FROM users u, permissions p, communities c,
(
    SELECT  community_members.community_id, community_members.user_id, community_member_permissions.permission_id  FROM community_members 
    JOIN community_member_permissions ON community_members.user_id=community_member_permissions.member_id
)AS result
WHERE result.user_id=u.id AND result.permission_id=p.id AND result.community_id=c.id
GROUP BY p.name,c.name,result.community_id HAVING result.community_id>4
ORDER BY result.community_id DESC, p.name ASC
LIMIT 100
