
-- NULL �� ó��
SELECT 
    map_price,
    pmap,
--    ratio_to_report(pmap) over(partition by map_price) as new_tab,
--     �ڹ��� exception ó���� ���� ��� �����ϱ�
--      example: ���������� 0�� ���Ե� ���. / null�� �ִ� �����Ϳ� �����Ҷ�
--     ((pmap / map_price)*100) as new_pmap 
--      null�� ó���ϴ� ���� =>nvl(�÷���, ��ü�� ����)
    CASE WHEN map_price = 0
            THEN  1
         WHEN map_price = 1
            THEN 2
            ELSE pmap /NVL( map_price,1 ) END AS promtion_ratio,
--          else pmap /nvl2( map_price,1,' blank ') end as promtion_ratio
     product
 FROM KOPO_PROMOTION
 WHERE product  = 'product56';
 
 ------------------------------------------ 
 
-- NULL �� ��ȸ
 
 select * from kopo_promotion
 where map_price is null;
 
 
 select * from  kopo_promotion
 where 1=1
 and map_price is not null;
  
 
 select * from  kopo_promotion
 where 1=1
 and map_price is null;
 
 select * from  kopo_promotion
 where 1=1
 and map_price = ''  
 
 SELECT LENGTHB(''), LENGTH(''), VSIZE(''), DUMP('') FROM dual
 