SELECT * FROM kopo_customerdata;

select 
       gender
       ,avg(total_amount)
       ,sum(total_amount)
       ,max(total_amount)
       ,min(total_amount)
       ,count(total_amount)
    from kopo_customerdata
    group by gender;
    
    
select
     A.student_id
    ,A.team_id
    ,score_math
    ,avg_math
     
    from 
        kopo_student_2018 A,
        (select
            team_id
            ,avg(score_math) as avg_math
            from kopo_student_2018
            group by team_id) B
    where 1 = 1
    and A.team_id = B.team_id(+)  ;  
            
    
    
    select 
        gender
        , avg(total_amount) as avg_total 
        from kopo_customerdata
     group by gender

            
            
select * from kopo_student_2018;

SELECT A.KEY, COUNT(*)
FROM (
    SELECT 
        CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEY
        ,REGIONID
        , PRODUCT
        , YEARWEEK
        , CASE WHEN QTY > 700000
                THEN 700000
                ELSE QTY END AS QTY
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE 1=1
        AND PRODUCT IN ('PRODUCT1','PRODUCT2')
        AND SUBSTR(YEARWEEK,5,6) != '53'
)A
GROUP BY KEY
ORDER BY KEY

select *from KOPO_CHANNEL_SEASONALITY_NEW


SELECT * FROM 
(SELECT 
        CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEY
        ,REGIONID
        , PRODUCT
        , YEARWEEK
        , CASE WHEN QTY > 700000
                THEN 700000
                ELSE QTY END AS QTY
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE 1=1
        AND PRODUCT IN ('PRODUCT1','PRODUCT2')
        AND SUBSTR(YEARWEEK,5,6) != '53')A
LEFT JOIN        
(SELECT B.KEY
    , AVG(QTY)
    , SUM(QTY)
    , COUNT(QTY)
FROM (
    SELECT 
        CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEY
        ,REGIONID
        , PRODUCT
        , YEARWEEK
        , CASE WHEN QTY > 700000
                THEN 700000
                ELSE QTY END AS QTY
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE 1=1
        AND PRODUCT IN ('PRODUCT1','PRODUCT2')
        AND SUBSTR(YEARWEEK,5,6) != '53'
)B
GROUP BY KEY)B
ON A.KEY = B.KEY
WHERE 1=1
AND REGIONID = 'A43'

