{{ config(
    materialized='table',
    schema='sai'
) }}

WITH source_data AS (
    SELECT
        FIRSTNAME,
        LASTNAME,
        ORDERID,
        ORDERNAME,
        ORDERQUANTITY,
        ORDERDATE,
        PAYMENTTYPE,
        PRICE_USD * 0.94 AS PRICE_EUROS
    FROM {{ source('sasank_sai', 'INBOUND_TABLE') }}
)

SELECT * 
FROM source_data;




