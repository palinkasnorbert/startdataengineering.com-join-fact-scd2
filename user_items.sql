SELECT ip.item_purchased_id,
        ip.user_id,
        ip.item_cost,
        ud.zipcode,
        ip.purchased_datetime
FROM items_purchased ip
        JOIN user_dim AS ud ON ip.user_id = ud.user_id
        AND ip.purchased_datetime BETWEEN ud.row_effective_datetime AND ud.row_expiration_datetime