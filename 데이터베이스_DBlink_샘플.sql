select * from tabs;

-----------------------------------------------------------------------------------------------------------
-- 원격지의 oracle db에 접근하기 위한 데이터베이스 링크 생성
-----------------------------------------------------------------------------------------------------------

-- 1번. TNSNAME 활용 
CREATE DATABASE LINK new_poly_server
--db 링크명은 임의 지정.
CONNECT TO kopo
IDENTIFIED BY kopo
Using 'poly_server';
--Using '서버명'은  이미 오라클TNS에 등록된 서버 이름

------------------------------------------------------

-- 2번. 직접호출방식 활용
CREATE DATABASE LINK poly_server
CONNECT TO kopo
IDENTIFIED BY kopo
Using ' DESCRIPTION =
        (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.110.111)(PORT = 1521))
        (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SERVICE_NAME = orcl)
    )
  )' ;
  
  ------------------------------------------------------
  -- 생성된 데이터베이스 링크 확인방법
  SELECT * FROM ALL_DB_LINKS;
  
  -- 링크된 서버에서 데이터 불러오기
SELECT * FROM kopo_product_volume@poly_server;
SELECT * FROM kopo_channel_seasonality@poly_server;
  
  --기존 TNS명을 새로운 이름의 DB링크로 생성해, 데이터 출력
SELECT * FROM kopo_product_volume@new_poly_server;
   
