/*2*/
SELECT result.community_id, c.name, p.name, count(result.user_id)  FROM users u, permissions p, communities c,
(
    SELECT  community_members.community_id, community_members.user_id, community_member_permissions.permission_id  FROM community_members 
    JOIN community_member_permissions ON community_members.user_id=community_member_permissions.member_id
)AS result
WHERE result.user_id=u.id AND result.permission_id=p.id AND result.community_id=c.id
GROUP BY p.name,c.name,result.community_id HAVING result.community_id
ORDER BY result.community_id DESC, p.name ASC/*нельзя отсортировать по возрастанию колличества разрешений так как от этого ничего не поменяется и никокого толка не будет потому что не бывает больше 5 разрешений, поэтому я отсортировал по алфавиту :)*/
LIMIT 100
