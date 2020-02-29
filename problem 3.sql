SELECT u.name, c.name, p.name  FROM users u, permissions p, communities c,
(
    SELECT  community_members.community_id, community_members.user_id, community_member_permissions.permission_id  FROM community_members 
    JOIN community_member_permissions ON community_members.user_id=community_member_permissions.member_id
)AS result
WHERE result.user_id=u.id AND result.permission_id=p.id AND result.community_id=c.id 
AND length(c.name)>14 AND (u.name LIKE '%T%' OR  p.name LIKE '%articles%')