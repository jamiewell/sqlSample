
 --     ���� �ݿø�, Ÿ�Ժ�ȯ     
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

--���� �˻� IN

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
                
 --���� �˻� OR               
 --oracle ������������ �ڵ����� ���������� ��ȯ��   
select * from kopo_product_volume
    where 1=1
    and productgroup = 'ST0002'   
    and(  yearweek = 201515 
    or    yearweek = 201516 );

--------------------------------------------

--Ư�� ���ڿ��� �˻� %
select * from tabs
where table_name like '%JHJ%';
 

--����� ���� �Է¹޾� ���
select 
        regionid, productgroup, yearweek
        from  kopo_product_volume
        where produCtgroup  = &product
        or yearweek = '201544'


-- ���� �Է¹��
select * 
        from kopo_promotion
        where 1=1
        and targetweek between 201501 and 201503 
         
        
--BETWEEN �Լ��� ����� ���� �Է�    
--BETWEEN �Լ����� �ڵ������� ���� �÷��� ĳ������ ����   
select * 
        from kopo_promotion
        where 1=1
        and targetweek between &stweek  and &edweek;
    
------------------------------------------------------------------------

    
-- ������ ����
-- asc ��������, desc ��������
select * 
    from kopo_product_volume
    where 1=1
    order by yearweek asc;
                
     
-- �ߺ� ������ �ɷ�����
select  distinct gender
    from kopo_customerdata;

-- �������� 
select regionid,
       productgroup,
       yearweek
    from kopo_product_volume  
order by yearweek desc, productgroup asc, regionid asc    


--������ ���� 
select *
        from kopo_product_volume
        where productgroup = 'ST0001'
    union 
select *
        from kopo_product_volume
        where productgroup = 'ST0002'  ;
 
--������ ����
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
INTERSECT
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';


-- 2015 ~ 2016 ������ �� 2015�⵵�� �ݺб⸦ ������ DF���
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


-- 2017�� ������ ������ �����ϰ� DF���                     
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