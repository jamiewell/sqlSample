--1. KOPO2 �������� RMSE_MAE_EXAMPLE2���� 
--��Ȯ�� ���� 1-ABS(������-������) / ������ ���� ���� �� 
--RMSE_MAE_ST_[INITAIL] ���̺��� �����ϼ���

create table RMSE_MAE_ST_JHJ
as
(select 
    1-ABS(FCST-ACTUAL)/FCST ACCURACY
from RMSE_MAE_EXAMPLE2
);


--2. ��¥�Լ����� ��¥�� ������ 201822 �Ͱ���
--���� ���� ������ �˱� ���� Ÿ���� ��� ��ȯ�ؾ��ϳ���?
-- :���ڿ�

--3. �� �������� ���� ��¥�� �������� 
--(201822)�� ������� ����ϴ� ����Ÿ����?
--  YYYYIW


--4 .KOPO2 �������� CUSTOMERDATA ���̺��� ������ 
--CUSTID ���� ���ڰ� 'B'->'A'->'C'->��Ÿ ������ ������ �ϼ���.

select a.*,

  case when substr(custid,0,1) = 'A'
    then 'B'
    when substr(custid,0,1) = 'B'
    then 'A'
    end as CUTID
from customerdata a
order by CUTID;


-- �߰� �ؼ�
-- Ư���÷� ������ ���� ���ڸ� Ȯ���ؼ� �ε��� �ֱ�, ����
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