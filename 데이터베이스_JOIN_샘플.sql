
-- 150��
select * from customerdata;

-- 10��
select * from customer_name;


-- left join 150��
select count(*)
from
(
select 
    A.custid, 
    A.emi, 
    B.CUSTNAME   
from customerdata A
left join customer_name B
on A.custid = B.custid
);

-- left join (+) ��� 
-- custname ������ ã��
select *
from
(
select 
    A.custid, 
    A.emi, 
    B.CUSTNAME
from customerdata A
     ,customer_name B
where 1=1
and A.custid = B.custid(+)
)
where 1=1
and custname is null;


-- inner join 9��
select 
    A.custid, A.emi, B.CUSTNAME
from customerdata A
inner join customer_name B
on A.custid = B.custid;

-- inner join where ������ ��� 9��
select 
    A.custid, A.emi, B.CUSTNAME
from customerdata A
     ,customer_name B
where 1=1
and A.custid = B.custid;

--right join 10��
select 
    A.custid, A.emi, B.CUSTNAME
from customerdata A
right join customer_name B
on A.custid = B.custid;


--(+)LEFT OUTER JOIN
SELECT 
A.*
,B.*
 FROM 
 CUST_MGT A
 ,CUST_MGT B
 WHERE 1=1
 AND A.CUSTID = B.MGRID;
 