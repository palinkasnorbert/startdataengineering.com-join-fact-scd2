SELECT  user_id
FROM items_purchased
GROUP BY  user_id
HAVING SUM(item_cost) > 1000;