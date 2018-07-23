
---------------------------------------------------------------------------------
--�־��� ���ڿ����� �������� Ư�� ���ڸ� ä��

select 
    lpad(week,4,'*') 
    ,A.*
    from sort_example A
order by lpad(week,4,'*') ;

select 
    lpad(week,2,0)
    ,qty
from sort_example
order by lpad(week,2,0) desc;

select lpad(week,2,'-') from sort_example;



select lpad(customercode,10,'0') from kopo_customerdata;
select length(customercode) from kopo_customerdata;
select substr(customercode,-4) from kopo_customerdata;


---------------------------------------------------------------------------------
-- �ο쿡 �ִ� ���ڿ� �����Ϳ� ������ ���ԵǾ� ������

select * from test_trim;
edit  test_trim ;
select length(var_test) from test_trim;
select length(trim(var_test)) from test_trim;


---------------------------------------------------------------------------------

SELECT * FROM KOPO_CUSTOMERDATA;

SELECT 
        A.*
        ,LPAD(CUSTOMERCODE,10,0) AS LPAD
        ,SUBSTR(LPAD(1503983,10,0),7 ) AS SUBSTR
        ,REPLACE (LPAD (CUSTOMERCODE, 10, 0) 
                ,SUBSTR (LPAD (CUSTOMERCODE, 10, 0), 7), '****') AS REPLACE
  FROM KOPO_CUSTOMERDATA A;


SELECT    
        RPAD (CUSTOMERCODE, 9, 0) 
       || CONCAT ('-', SUBSTR (RPAD (CUSTOMERCODE, 9, 0), 3, 2)) AS RPAD
       ,SUBSTR (RPAD (CUSTOMERCODE, 9, 0), 3, 2) AS SUBSTR,
       REPLACE (RPAD (CUSTOMERCODE, 9, 0),
       SUBSTR (RPAD (CUSTOMERCODE, 9, 0), 3, 2),'#') AS REPLACE
  FROM KOPO_CUSTOMERDATA;


--------------------------------------------------------------------------------------------------------------------

select
--10�ڸ�
lpad(customercode,10,'0'),
--�� 4�ڸ�
substr(lpad(customercode,10,'0'),-4 ),
replace(
---     1.10�ڸ� ��ü ������
        lpad(customercode,10,'0'), 
---     2.���� 10�ڸ��� ������ 4��° ���� ���� ����   
        substr(lpad(customercode,10,'0'),-4 ) ,
--      3. 2���� 4�ڸ� ���ڸ� ��ü�� �Է±���
        '****'
        ) from kopo_customerdata;

select substr('000123456',6) from dual;
select replace('000123456','56','--') from dual;

select 
          first_number
        , second_number 
        ,(first_number/2) as secon_number
        ,(first_number/second_number) as avg
        ,round(first_number/second_number) as round_ex
--        �־��� ������ ���� ���� �� ū  ����
        ,ceil(first_number/second_number) as ceil_ex
--        �־��� ������ ���� ���� �� ���� ����
        ,floor(first_number/second_number) as floor_ex
--        mod , power �Է� ��ȣ�� ( , ��ǥ)
        ,mod(first_number,second_number) as mod_ex
        ,power(first_number,second_number) as power_ex
   from number_example;
   
   
   
--   round ( �ݿø���� ��, " �Ҽ��� n ��°�ڸ����� " �ݿø� )
create table RMSE_MAE_ST_JHJ as
 (
select 
        yearweek
        ,actual
        ,fcst
        ,round((1-abs(fcst-actual)/fcst),4 )*100 as accuracy

   from rmse_mae_example2);
   
select * from RMSE_MAE_ST_JHJ;   
   
select 
    sysdate
--    ���� ��¥�� �Ͽ����� �������� n���� ��
--   �� , �� , ȭ , �� , �� , �� , ��
    ,next_day(sysdate,1)
    ,last_day(sysdate)
    ,(TO_CHAR(SYSDATE+2,'YYYY MM DD') || 'DAY') AS REAL_NEXT_DAY
    from dual;
   
--��¥ -> ����
select to_char(sysdate, 'YYYYWW')   
    FROM DUAL;

--���� -> ��¥    
SELECT TO_DATE('060504') FROM DUAL;
