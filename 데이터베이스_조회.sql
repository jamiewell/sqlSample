
--expression ��ɾ�� '���� ���������̺�'�� �����ϴ� �� �� �ƴ�,
--select�� '����ϴ� ���������̺�'�� ������ �� ���
----------------------------------------------------------------
-- epxression1. 
select 
    'KOPO_D510' as MEASUREID,
    cast(yearweek as number) * volume as test
 from KOPO_PRODUCT_VOLUME;
 
 --cast => ������ �ڷ����� ��ȯ
 
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
--�ߺ��� ���� DISTINCT  
----------------------------------------------------------------

SELECT  DISTINCT
    REGIONID,
    PRODUCTGROUP AS PRODUCT
FROM KOPO_CHANNEL_SEASONALITY;

SELECT  DISTINCT
    REGIONID
FROM KOPO_CHANNEL_SEASONALITY;

 

----------------------------------------------------------------
--������ ���� Ȯ�� COUNT
----------------------------------------------------------------

SELECT count(*) from KOPO_CHANNEL_seasonality;

SELECT count(*) from KOPO_PRODUCT_VOLUME;

 
----------------------------------------------------------------
--where ������
 ----------------------------------------------------------------
 
SELECT 
    *
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
AND VOLUME >= '450000';