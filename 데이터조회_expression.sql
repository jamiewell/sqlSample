--새로운 컬럼 설정

--expression 이용  concat  / ||


select
 regionid || productgroup || yearweek as key,
 regionid,
 productgroup,
 yearweek,
 volume
from kopo_product_volume;


select
    'D516' as measured,
    3*4 as tempvalue,
 regionid || productgroup || yearweek as key,
 regionid,
 productgroup,
 yearweek,
 volume
from kopo_product_volume;


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


select
   concat(regionid,concat('-',productgroup)) as con,
 regionid,
 productgroup,
 yearweek,
 volume
from kopo_product_volume;


select
    yearweek AS PLANID,
   REGIONID as newCode
from kopo_product_volume;


--중복값 제거 distinct
SELECT
   DISTINCT REGIONID, PRODUCTGROUP
FROM KOPO_PRODUCT_VOLUME
