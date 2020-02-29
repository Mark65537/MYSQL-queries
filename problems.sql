/*1*/
SELECT  a.joined_at, b.name, c.name FROM community_members a, users b, communities c
WHERE a.joined_at > '2013-01-01 00:00:00' AND a.user_id=b.id AND a.community_id=c.id 
ORDER BY a.joined_at DESC
/*2*/
SELECT c.id, c.name, p.name, COUNT(result_cmp.member_id)  FROM communities c, permissions p, 
(
  SELECT cm.community_id, result_cmp.permission_id, count(result_cmp.member_id)  FROM community_members cm,
  (
    SELECT permission_id, member_id  FROM community_member_permissions
    ORDER BY permission_id 
  )AS result_cmp
  WHERE result_cmp.member_id=cm.user_id 
)AS result_cm
GROUP BY p.name
ORDER BY c.id DESC
LIMIT 100
