
---------------------------------------------------------------------------------
--주어진 문자열에서 왼쪽으로 특정 문자를 채움

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
-- 로우에 있는 문자열 데이터에 공백이 포함되어 있을때

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
--10자리
lpad(customercode,10,'0'),
--뒤 4자리
substr(lpad(customercode,10,'0'),-4 ),
replace(
---     1.10자리 전체 데이터
        lpad(customercode,10,'0'), 
---     2.위의 10자리에 끝에서 4번째 까지 숫자 추출   
        substr(lpad(customercode,10,'0'),-4 ) ,
--      3. 2번의 4자리 숫자를 대체할 입력글자
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
--        주어진 숫자의 가장 근접 한 큰  정수
        ,ceil(first_number/second_number) as ceil_ex
--        주어진 숫자의 가장 근접 한 작은 정수
        ,floor(first_number/second_number) as floor_ex
--        mod , power 입력 기호는 ( , 쉼표)
        ,mod(first_number,second_number) as mod_ex
        ,power(first_number,second_number) as power_ex
   from number_example;
   
   
   
--   round ( 반올림대상 값, " 소수점 n 번째자리까지 " 반올림 )
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
--    기준 날짜의 일요일을 기준으로 n번재 날
--   일 , 월 , 화 , 수 , 목 , 금 , 토
    ,next_day(sysdate,1)
    ,last_day(sysdate)
    ,(TO_CHAR(SYSDATE+2,'YYYY MM DD') || 'DAY') AS REAL_NEXT_DAY
    from dual;
   
--날짜 -> 문자
select to_char(sysdate, 'YYYYWW')   
    FROM DUAL;

--문자 -> 날짜    
SELECT TO_DATE('060504') FROM DUAL;
