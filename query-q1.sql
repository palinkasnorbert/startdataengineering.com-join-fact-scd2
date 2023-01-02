/*I want to see the distribution of our 
high spending users by month, 
year and zip code(at time of purchase)*/

WITH high_spenders AS (
    SELECT user_id
    FROM items_purchased
    GROUP BY user_id
    HAVING sum(item_cost) > 1000
),
user_items AS (
    SELECT ip.item_purchased_id,
        ip.user_id,
        ip.item_cost,
        ud.zipcode,
        ip.purchased_datetime
    FROM items_purchased ip
        JOIN user_dim ud ON ip.user_id = ud.user_id
        AND ip.purchased_datetime BETWEEN ud.row_effective_datetime AND ud.row_expiration_datetime
)
SELECT 
    YEAR(ui.purchased_datetime) yr,
    MONTH(ui.purchased_datetime) mnth,
    ui.zipcode,
    COUNT(DISTINCT ui.user_id) num_high_spenders
FROM user_items ui
    JOIN high_spenders hs ON ui.user_id = hs.user_id
GROUP BY YEAR(ui.purchased_datetime),
    MONTH(ui.purchased_datetime),
    ui.zipcode
ORDER BY yr DESC,
    mnth DESC;