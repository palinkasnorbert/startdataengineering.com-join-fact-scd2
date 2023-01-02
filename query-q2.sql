/* I want to see the high spending users first name, last name, zip code along
WITH how long they lived at each zip code (duration_of_stay). 
If they are currently living at a zip code THEN the duration_of_stay should be Null. */
WITH high_spenders AS (
    SELECT user_id
    FROM items_purchased
    GROUP BY user_id
    HAVING sum(item_cost) > 1000
)
SELECT 
    ud.first_name firstname
    , ud.last_name lastname
    , ud.zipcode
    , CASE 
        WHEN current_row_indicator = 'expired' THEN DATEDIFF(DAY, ud.row_effective_datetime, ud.row_expiration_datetime)
        ELSE NULL
        END duration_of_stay
FROM user_dim ud
    JOIN high_spenders hs ON ud.user_id = hs.user_id
ORDER BY ud.row_expiration_datetime ASC