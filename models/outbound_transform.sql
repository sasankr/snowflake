{{ config(
    materialized='table'
) }}

WITH source_data AS (
    SELECT
        FIRSTNAME,
        LASTNAME AS SURNAME, -- Transform LASTNAME to SURNAME
        ORDERID,
        ORDERNAME AS ORDERDESCRIPTION, -- Transform ORDERNAME to ORDERDESCRIPTION
        ORDERQUANTITY,
        TO_CHAR(TO_DATE(ORDERDATE, 'mm-dd-yyyy'), 'dd-mm-yyyy') AS ORDERDATE,
        PAYMENTTYPE,
        PRICE_USD * 0.94 AS PRICE_EUROS -- Assuming you want to convert PRICE_USD to PRICE_EUROS
    FROM {{ source('sai', 'INBOUND_TABLE') }}  -- Using the source defined in sources.yml
)

SELECT * 
FROM source_data












