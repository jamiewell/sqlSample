
--expression 명령어는 '원본 데이터테이블'을 수정하는 것 이 아닌,
--select로 '출력하는 데이터테이블'을 수정할 때 사용
----------------------------------------------------------------
-- epxression1. 
select 
    'KOPO_D510' as MEASUREID,
    cast(yearweek as number) * volume as test
 from KOPO_PRODUCT_VOLUME;
 
 --cast => 데이터 자료형을 변환
 
----------------------------------------------------------------
 --expresssion2.
 select
    'D516' as measured,
    3*4 as tempvalue,
 regionid || '-' ||
 productgroup || '-' ||
 yearweek as key,
 concat(regionid ,  productgroup) as con,
 regionid,
 productgroup,
 yearweek,
 volume
from kopo_product_volume;

----------------------------------------------------------------
--중복값 제거 DISTINCT  
----------------------------------------------------------------

SELECT  DISTINCT
    REGIONID,
    PRODUCTGROUP AS PRODUCT
FROM KOPO_CHANNEL_SEASONALITY;

SELECT  DISTINCT
    REGIONID
FROM KOPO_CHANNEL_SEASONALITY;

 

----------------------------------------------------------------
--데이터 개수 확인 COUNT
----------------------------------------------------------------

SELECT count(*) from KOPO_CHANNEL_seasonality;

SELECT count(*) from KOPO_PRODUCT_VOLUME;

 
----------------------------------------------------------------
--where 조건절
 ----------------------------------------------------------------
 
SELECT 
    *
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
AND VOLUME >= '450000';