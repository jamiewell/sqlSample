
-------------------------------------
--CASE ���ǹ�
-------------------------------------
--        ������ ��ȸ�� �÷����� ������ ���� ������ ��� �����Ͽ� ��ȸ.
--          lower (�ҹ���) upper (�빮��)
select 
        A.*,
       case when lower(A.gender)  = 'not availabe'
            then 0
            when A.gender = 'Male'
            then 1
            else 2 end as sort_order
from kopo_customerdata A
order by sort_order;   


-- CASE WHEN ���ǹ����� null �� ������ ó��
SELECT 
    A.*
    ,CASE WHEN A.yearweek IS NULL
         THEN 0  
    END    
    from kopo_product_volume A
    order by productgroup;

 
-- CASE WHEN ���ǹ����� Ư�� ������ �� ��ȸ
SELECT *
FROM 
            (SELECT CASE
                   WHEN TOTAL_AMOUNT > 100000
                   THEN
                       10000
                   WHEN TOTAL_AMOUNT > 1000 AND TOTAL_AMOUNT < 100000
                   THEN
                       1000
                   ELSE
                       0000
               END
                AS TOTAL_AMOUNT
            FROM KOPO_CUSTOMERDATA A)
WHERE 1 = 1 AND TOTAL_AMOUNT = 1000;
 
 
-- CASE WHEN ���ǹ�����  ���� ����
SELECT
    CUSTOMERCODE,
    CASE WHEN TOTAL_AMOUNT > 100000
    THEN 'HIGH'
    WHEN TOTAL_AMOUNT > 1000 AND TOTAL_AMOUNT < 100000
    THEN 'AMID'
    ELSE 'BELOW'
    END AS TOTAL_AMOUNT
FROM KOPO_CUSTOMERDATA A;

-- ���� ���� �÷� ����
SELECT 
    sort_order
FROM (SELECT A.*,
              DECODE (A.GENDER,  'Male', 1,  'Female', 2,  'non')  AS SORT_ORDER
            FROM KOPO_CUSTOMERDATA A)
WHERE 1 = 1 AND sort_order = 1;



-------------------------------------
-- DECODE �Լ�
--------------------------------------
select * FROM DT_RESULT_FINAL3;


--��Ȯ�� ����: �������� 0�� ��� 0 ó��, 0.5�̸� 'NOPE',  
SELECT 
    A.*, 
  decode(PREDICTION,0,0
                ,0.5, 'nope'
                ,(1-ABS(PREDICTION - QTY)/PREDICTION)
  ) as ACCURACY  
FROM DT_RESULT_FINAL3 A;
