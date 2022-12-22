CREATE DATABASE warehouse;
USE warehouse;
DROP TABLE IF EXISTS user_dim;
CREATE TABLE user_dim (
    user_key BIGINT,
    user_id VARCHAR(40),
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    address VARCHAR(100),
    zipcode VARCHAR(10),
    created_datetime DATETIME,
    updated_datetime DATETIME,
    row_effective_datetime DATETIME,
    row_expiration_datetime DATETIME,
    current_row_indicator VARCHAR(10)
);
INSERT INTO user_dim (
        user_key,
        user_id,
        first_name,
        last_name,
        address,
        zipcode,
        created_datetime,
        updated_datetime,
        row_effective_datetime,
        row_expiration_datetime,
        current_row_indicator
    )
VALUES (
        1000,
        'b0cc9fde-a29a-498e-824f-e52399991beb',
        'john',
        'doe',
        'world',
        10027,
        '2020-01-01 10:00:00',
        '2020-01-01 10:00:00',
        ' 2020-01-01 10:00:00',
        '2021-01-01 17:59:59',
        'expired'
    ),
    (
        1200,
        'b0cc9fde-a29a-498e-824f-e52399991beb',
        'john',
        'doe',
        'world',
        10012,
        '2020-01-01 10:00:00',
        '2021-01-01 18:00:00',
        '2021-01-01 18:00:00',
        '9999-12-31 00:00:00',
        'current'
    );
DROP TABLE IF EXISTS items_purchased;
CREATE TABLE items_purchased (
    item_purchased_id VARCHAR(40),
    order_id VARCHAR(40),
    user_id VARCHAR(40),
    item_id VARCHAR(40),
    item_cost decimal(10, 2),
    purchased_datetime DATETIME -- and other fact information
);
INSERT INTO items_purchased (
        item_purchased_id,
        order_id,
        user_id,
        item_id,
        item_cost,
        purchased_datetime
    )
VALUES (
        'nljbac724bbskd',
        'order_id_1',
        'b0cc9fde-a29a-498e-824f-e52399991beb',
        'item_id_1',
        1500.00,
        '2020-12-28 12:30:00'
    ),
    (
        'ljbkcfvbj6758njh',
        'order_id_23',
        'b0cc9fde-a29a-498e-824f-e52399991beb',
        'item_id_45',
        20.00,
        '2021-01-28 09:30:00'
    ),
    (
        'sjbv09uy7njhbvvj',
        'order_id_100',
        '11111111-2222-3333-44444444444',
        'item_id_12',
        32.00,
        '2021-02-01 11:00:00'
    );