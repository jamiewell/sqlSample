
--matser table
select * from kopo_stock_log;
--log result
select * from kopo_stock_mst;

select * from kopo_KOSPI_join_ex_hyo;

create table kopo_KOSPI_join_ex_hyo as
(
select 
        A.*,
        B.*
from  kopo_stock_mst A
left join kopo_stock_log B
    on A.screen_code = B.st_code  
    where 1=1
    and screed_div = 'KOSPI'
);

-- LEFT JOIN 
select 
        A.*,
        B.*
from kopo_stock_mst A
left join kopo_stock_log B
    on A.screen_code = B.st_code   
    where 1=1
    and screed_div = 'KOSPI';

--������ LEFT out JOIN
select 
    A.*,
    B.*
from kopo_stock_mst A,
     kopo_stock_log B
    where 1=1
    AND A.screen_code = B.st_code(+) 
    and screed_div = 'KOSPI';


--MST ����
select 
        A.*,
        B.*
from kopo_stock_mst A
    left join kopo_stock_log B
    on A.screen_code = B.st_code  ;

select 
        A.*,
        B.*
from kopo_stock_mst A
right join kopo_stock_log B
on A.screen_code = B.st_code  ;

--LOG ����

select 
    
    A.*,
    B.*
from kopo_stock_log  A
left join kopo_stock_mst B
on  A.st_code  = B.screen_code  
and A.st_code  = B.screen_code;


--���� ����
select 
    A.*,
    concat(b.ST_CODE,CONCAT('-',B.volume)) as new,
    B.OPEN, A.SCREED_DIV AS SCREEN_div
from kopo_stock_mst A
right join kopo_stock_log B
on A.screen_code = B.st_code  ;