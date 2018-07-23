
-- NULL 값 처리
SELECT 
    map_price,
    pmap,
--    ratio_to_report(pmap) over(partition by map_price) as new_tab,
--     자바의 exception 처리와 같은 방법 적용하기
--      example: 나눗셈에서 0이 포함된 경우. / null이 있는 데이터와 연산할때
--     ((pmap / map_price)*100) as new_pmap 
--      null값 처리하는 쿼리 =>nvl(컬럼명, 대체할 숫자)
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
 
-- NULL 값 조회
 
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
 