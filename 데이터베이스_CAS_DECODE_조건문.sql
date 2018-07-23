
-------------------------------------
--CASE 조건문
-------------------------------------
--        데이터 조회시 컬럼안의 데이터 값의 조건을 잠시 변경하여 조회.
--          lower (소문자) upper (대문자)
select 
        A.*,
       case when lower(A.gender)  = 'not availabe'
            then 0
            when A.gender = 'Male'
            then 1
            else 2 end as sort_order
from kopo_customerdata A
order by sort_order;   


-- CASE WHEN 조건문으로 null 값 데이터 처리
SELECT 
    A.*
    ,CASE WHEN A.yearweek IS NULL
         THEN 0  
    END    
    from kopo_product_volume A
    order by productgroup;

 
-- CASE WHEN 조건문으로 특정 데이터 값 조회
SELECT *
FROM 
            (SELECT CASE
                   WHEN TOTAL_AMOUNT > 100000
                   THEN
                       10000
                   WHEN TOTAL_AMOUNT > 1000 AND TOTAL_AMOUNT < 100000
                   THEN
                       1000
                   ELSE
                       0000
               END
                AS TOTAL_AMOUNT
            FROM KOPO_CUSTOMERDATA A)
WHERE 1 = 1 AND TOTAL_AMOUNT = 1000;
 
 
-- CASE WHEN 조건문으로  구간 설정
SELECT
    CUSTOMERCODE,
    CASE WHEN TOTAL_AMOUNT > 100000
    THEN 'HIGH'
    WHEN TOTAL_AMOUNT > 1000 AND TOTAL_AMOUNT < 100000
    THEN 'AMID'
    ELSE 'BELOW'
    END AS TOTAL_AMOUNT
FROM KOPO_CUSTOMERDATA A;

-- 성별 구분 컬럼 생성
SELECT 
    sort_order
FROM (SELECT A.*,
              DECODE (A.GENDER,  'Male', 1,  'Female', 2,  'non')  AS SORT_ORDER
            FROM KOPO_CUSTOMERDATA A)
WHERE 1 = 1 AND sort_order = 1;



-------------------------------------
-- DECODE 함수
--------------------------------------
select * FROM DT_RESULT_FINAL3;


--정확도 산출: 예측값이 0인 경우 0 처리, 0.5이면 'NOPE',  
SELECT 
    A.*, 
  decode(PREDICTION,0,0
                ,0.5, 'nope'
                ,(1-ABS(PREDICTION - QTY)/PREDICTION)
  ) as ACCURACY  
FROM DT_RESULT_FINAL3 A;
