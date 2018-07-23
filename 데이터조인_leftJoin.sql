
--73건    
select * from kopo_region_mst;
--124658건
select * from kopo_channel_seasonality_new;


--left join
--124658건
select count(*) from
(
select a.regionid,  a.product, a.yearweek, a.qty, b.regionname 
    from kopo_channel_seasonality_new a 
    left join kopo_region_mst b 
    on a.regionid = b.regionid
    );
    

-- 77건  
SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW
    WHERE 1=1
    AND REGIONID = 'A77';


--314건
select 
*
from
(
select a.regionid,  a.product, a.yearweek, a.qty, b.regionname 
    from kopo_channel_seasonality_new a 
    left join kopo_region_mst b 
    on a.regionid = b.regionid
    )  
    where 1=1
    and regionid = 'A77';
    
    

   