WITH transactions AS (
    SELECT 
        *
        ,SPLIT_PART(transaction_code,'-',1) AS Bank
        ,CASE online_or_in_person
            WHEN 1 THEN 'Online'
            WHEN 2 THEN 'In-Person'
        END as "Online or In-Person"
        ,DATE(TRANSACTION_DATE, 'DD/MM/YYYY 00:00:00') as Date
        ,DAYNAME(DATE(TRANSACTION_DATE, 'DD/MM/YYYY 00:00:00')) 
        as "Transaction Date"
    FROM PD2023_WK01
)

/* Output 1
SELECT 
    Bank, SUM(value) AS Value
FROM transactions
GROUP BY Bank
*/

/* Output 2
SELECT 
    Bank, "Transaction Date", "Online or In-Person", SUM(value) AS Value
FROM transactions
GROUP BY Bank, "Transaction Date", "Online or In-Person"
*/

SELECT 
    Bank, customer_code, SUM(value) AS Value
FROM transactions
GROUP BY Bank, customer_code


;


// PD 2023 wk1


SELECT 
    SPLIT_PART(transaction_code,'-',1) as BANK
    , CASE online_or_in_person
        WHEN 1 THEN 'Online'
        WHEN 2 THEN 'In-person'
        END as online_or_in_person
    , TO_DATE(transaction_date,'DD/MM/YYYY 00:00:00') as date
    ,DAYNAME(date) as weekday
    ,*
FROM PD2023_WK01;


// Aggregation 1: Total Value of Transactions by each bank

SELECT 
     SPLIT_PART(transaction_code,'-',1) as BANK
    ,SUM(VALUE) as "Total Transactions"
FROM PD2023_WK01
GROUP BY BANK;

// Aggregation 2: Total Value of Transactions by each bank, day of week, type of transaction

SELECT 
     SPLIT_PART(transaction_code,'-',1) as BANK
    ,CASE online_or_in_person
        WHEN 1 THEN 'Online'
        WHEN 2 THEN 'In-person'
        END as "transaction type"
    ,DAYNAME(TO_DATE(transaction_date,'DD/MM/YYYY 00:00:00')) as "day of week"
    ,SUM(VALUE) as "Total Transactions"
FROM PD2023_WK01
GROUP BY 
     BANK
    ,"transaction type"
    ,"day of week"
;

// Aggregation 3: Total Value of Transactions by each bank and customer code


SELECT 
     SPLIT_PART(transaction_code,'-',1) as BANK
     ,customer_code  
     ,SUM(VALUE) as "Total Transactions"
FROM PD2023_WK01
GROUP BY 
    BANK
    ,customer_code
;

// ----------------------------------------------
