--1. KOPO2 서버에서 RMSE_MAE_EXAMPLE2에서 
--정확도 산출 1-ABS(예측값-실제값) / 예측값 쿼리 실행 후 
--RMSE_MAE_ST_[INITAIL] 테이블을 생성하세요

create table RMSE_MAE_ST_JHJ
as
(select 
    1-ABS(FCST-ACTUAL)/FCST ACCURACY
from RMSE_MAE_EXAMPLE2
);


--2. 날짜함수에서 날짜의 형식을 201822 와같이
--현재 주차 정보를 알기 위해 타입을 어떻게 변환해야하나요?
-- :문자열

--3. 위 질문에서 현재 날짜의 주차정보 
--(201822)를 얻기위해 사용하는 포맷타입은?
--  YYYYIW


--4 .KOPO2 서버에서 CUSTOMERDATA 테이블의 정렬을 
--CUSTID 시작 문자가 'B'->'A'->'C'->기타 순으로 오도록 하세요.

select a.*,

  case when substr(custid,0,1) = 'A'
    then 'B'
    when substr(custid,0,1) = 'B'
    then 'A'
    end as CUTID
from customerdata a
order by CUTID;


-- 추가 해설
-- 특정컬럼 데이터 앞의 문자만 확인해서 인덱스 주기, 정렬
select 
    case when data.index_col = 'A' then 1
    when data.index_col = 'B' then 0
    when data.index_col = 'C' then 2
    else 3 end as  PRIO
from
(
    select 
        A.*
        ,substr(CUSTID,1,1) as index_col
        from customerdata a
)
data
order by PRIO;


SELECT A.*, 
    decode(prediction_qty,0,1
                        ,0, '1'
                    , (1-abs(prediction_qty - real_qty)/prediction_qty)
                ) as NewColumn
FROM DT_RESULT_FINAL3 A;