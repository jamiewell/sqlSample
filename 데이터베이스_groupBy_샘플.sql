
select *
from RMSE_MAE_EXAMPLE_STEP2; 

--2.

select 
    abs(qty - prediction) as mae
from RMSE_MAE_EXAMPLE_STEP2; 



select 
    A.substr(yearweek,5) as week   
    ,sqrt(avg(power(abs(qty - prediction),2))) as rsme
 from RMSE_MAE_EXAMPLE_STEP2 A
 group by week;


select 
    A.item
    ,sqrt(avg(power(abs(qty - prediction),2))) as rsme
 from RMSE_MAE_EXAMPLE_STEP2 A
 group by item;



--3._1

create table MSE_MAE_EXAMPLE_STEP2_HyOjaeJUNG_1
as
(
select
    A.ITEM
    ,avg( abs(qty - prediction) ) as MAE
from RMSE_MAE_EXAMPLE_STEP2 A
group by item

);

--3._2

create table MSE_MAE_EXAMPLE_STEP2_HyOjaeJUNG_2 as 
   select
        week
        ,avg( abs(qty - prediction)) as MAE
    from
    (
        select
            A.*,
            substr(A.yearweek,5) as week   
        from RMSE_MAE_EXAMPLE_STEP2 A
    )
    GROUP by week
    ORDER by week ;


-- 4._1

-- item을 groupBy -> 2개의 상품군("AA","BB") * 각 상품군의 7개 연주차정보
-- power_error 합의 평균은  즉 7로 나뉜다. 

select
    ITEM
    ,avg(ERR) AS MAE
    ,avg(POW_ERROR) as POW_ERR_AVG
    ,sqrt(AVG(POW_ERROR)) AS RSME
from
    (
    select
        A.*
        ,(abs(A.qty - A.prediction)) as ERR
        ,(power((A.qty - A.prediction),2)) as POW_ERROR
    from RMSE_MAE_EXAMPLE_STEP2 A
    )
group by ITEM
order by ITEM ;


-- 4._2

-- week를 groupBy -> 7개의 주차정보 * 2개의 상품군
-- power_error합의 평균은 즉 2로 나뉜다
   select
        WEEK
        ,avg( abs(qty - prediction)) as MAE
        ,avg(POW_ERROR) as POW_ERR_AVG
        ,sqrt( avg( POW_ERROR ) ) as rsme
    from
    (
        select
            A.*
            ,substr(A.yearweek,5) as WEEK
            ,abs(A.qty - A.prediction) as ERR
            ,power((A.qty- A.prediction),2) as POW_ERROR   
        from RMSE_MAE_EXAMPLE_STEP2 A
    )
    group by WEEK
    order by WEEK ;


--------------------------------------
-- 집계 함수 & HAVING 조건
--------------------------------------

select 
    regionid,
    product,
    count(*)
from kopo_channel_seasonality
group by regionid, product
having count(*) < 200;


select
    regionid, 
    product, 
    avg(qty) 
from kopo_channel_seasonality
--1. 모수 줄이기
where regionid = 'A01'
group by regionid, product
--2. 조건걸 having
having sum(qty) >= 10000
--having by avg(qty) > 10000
order by regionid, product;