/* I want to see the high spending users first name, last name, zip code along
WITH how long they lived at each zip code (duration_of_stay). 
If they are currently living at a zip code THEN the duration_of_stay should be Null. */
WITH high_spenders AS (
    SELECT user_id
    FROM items_purchased
    GROUP BY user_id
    HAVING sum(item_cost) > 1000
), --gives back one column, one row, one user_id = high spender
user_items AS (
    SELECT ip.item_purchased_id,
        ip.user_id,
        ud.first_name,
        ud.last_name,
        ip.item_cost,
        ud.zipcode,
        ip.purchased_datetime
    FROM items_purchased ip
        JOIN user_dim ud ON ip.user_id = ud.user_id
        AND ip.purchased_datetime BETWEEN ud.row_effective_datetime AND ud.row_expiration_datetime
) --gives 2 rows, 2 items purchased of the high_spender user
SELECT 
    ui.first_name firstname,
    ui.last_name lastname,
    ui.zipcode,
    DATEDIFF(DAY, ud.row_effective_datetime, ud.row_expiration_datetime) duration_of_stay
FROM user_items ui
    JOIN high_spenders hs ON ui.user_id = hs.user_id
    JOIN user_dim ud ON ui.user_id = ud.user_id