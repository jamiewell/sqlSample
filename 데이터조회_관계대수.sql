select * from tabs;
select * from kopo_product_volume;
select * from KOPO_CHANNEL_RESULT_A01;
select * from KOPO_CHANNEL_RESULT_A02;
select * from kopo_product_volume_a01;
select * from kopo_product_volume_a02;

--데이터 대소문자 구분하기 문자열은 홀따옴표사용
select * from kopo_product_volume
    where 1=1
    and yearweek >= 201601
    and productgroup = 'ST0001';
 

-- ctrl + e 코스트 확인
-- union => 테이블의 모든  속성을  합치기 때문에 중복처리 발생 - cost 상승
--union all  => 테이블간의 중복 속성를 제거하고 합침
  
select REGIONID, PRODUCTGROUP, YEARWEEK, VOLUME
from kopo_product_volume_a01
 union all
select REGIONID, PRODUCTGROUP, YEARWEEK, VOLUME
 from kopo_product_volume_a02;

select REGIONID, PRODUCTGROUP, YEARWEEK, qty
    from  KOPO_CHANNEL_RESULT_A01
union 
select REGIONID, PRODUCTGROUP, YEARWEEK, qty
    from KOPO_CHANNEL_RESULT_A02;
    
select *  from  KOPO_CHANNEL_RESULT_A01
union all
select *  from KOPO_CHANNEL_RESULT_A02;    
  

--속성,컬럼 갯수와 컬럼정보가 같아야 유니언이 가능. 
select * from kopo_product_volume_a01    
    union all
 select * from kopo_product_volume_a02;      





