
 --     숫자 반올림, 타입변환     
 SELECT 
     regionid,
     item,
     targetweek,
     planweek,
     map_price,
     ir,
     pmap,
     ROUND(pmap*0.9) AS new_pmap,
     ROUND(pmap - (pmap*0.1)) AS Two_pmap,
     CAST((pmap - (pmap*0.1)) AS FLOAT ) AS Three_pmap,
     product
 FROM KOPO_PROMOTION;

--------------------------------------------

--조건 검색 IN

select * from kopo_product_volume
where 1=1
and yearweek between 201515 and 201516;

select * from kopo_product_volume
where 1=1
and yearweek in ('201515', '201516');

select * from kopo_product_volume
    where 1=1
        and productgroup = 'ST0002'
        and cast(yearweek as number) 
                in (201515,201516);
                
 --조건 검색 OR               
 --oracle 비교쿼리에서는 자동으로 숫자형으로 변환됨   
select * from kopo_product_volume
    where 1=1
    and productgroup = 'ST0002'   
    and(  yearweek = 201515 
    or    yearweek = 201516 );

--------------------------------------------

--특정 문자열로 검색 %
select * from tabs
where table_name like '%JHJ%';
 

--사용자 조건 입력받아 출력
select 
        regionid, productgroup, yearweek
        from  kopo_product_volume
        where produCtgroup  = &product
        or yearweek = '201544'


-- 기존 입력방식
select * 
        from kopo_promotion
        where 1=1
        and targetweek between 201501 and 201503 
         
        
--BETWEEN 함수와 사용자 조건 입력    
--BETWEEN 함수에선 자동적으로 조건 컬럼을 캐스팅을 해줌   
select * 
        from kopo_promotion
        where 1=1
        and targetweek between &stweek  and &edweek;
    
------------------------------------------------------------------------

    
-- 데이터 정렬
-- asc 오름차순, desc 내림차순
select * 
    from kopo_product_volume
    where 1=1
    order by yearweek asc;
                
     
-- 중복 데이터 걸러내기
select  distinct gender
    from kopo_customerdata;

-- 복합정렬 
select regionid,
       productgroup,
       yearweek
    from kopo_product_volume  
order by yearweek desc, productgroup asc, regionid asc    


--합집합 연산 
select *
        from kopo_product_volume
        where productgroup = 'ST0001'
    union 
select *
        from kopo_product_volume
        where productgroup = 'ST0002'  ;
 
--교집합 연산
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
INTERSECT
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';


-- 2015 ~ 2016 연주차 중 2015년도의 반분기를 제외한 DF출력
SELECT *
FROM KOPO_PRODUCT_VOLUME
where 1=1
AND PRODUCTGROUP = 'ST0001'
AND yearweek NOT IN (
                    SELECT DICTINCT YEARWEEK
                    FROM KOPO_PRODUCT_VOLUME
                    WHERE yearweek BETWEEN 201501 AND 201526
                    ) 
 ORDER BY REGIONID, PRODUCTGROUP, YEARWEEK;                   


-- 2017년 연주차 정보를 제외하고 DF출력                     
SELECT *
  FROM KOPO_PRODUCT_VOLUME
 WHERE     1 = 1
       AND PRODUCTGROUP = 'ST0001'
       AND yearweek NOT IN (SELECT DISTINCT YEARWEEK
                                                    FROM KOPO_channel_result_new);
                                         
SELECT A.*
  FROM (SELECT CONCAT (REGIONID, CONCAT ('_', PRODUCT))        AS KEY,
               REGIONID,
               PRODUCT,
               YEARWEEK,
               CASE WHEN QTY > 700000 THEN 700000 ELSE QTY END AS QTY
          FROM KOPO_CHANNEL_SEASONALITY_NEW
         WHERE     1 = 1
               AND PRODUCT IN ('PRODUCT1', 'PRODUCT2')
               AND SUBSTR (YEARWEEK, 5, 6) != '53') A
 WHERE 1 = 1 AND QTY = 0