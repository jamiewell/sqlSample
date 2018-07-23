SELECT * FROM DBA_FILE_SPACES;

--테이블 스페이스 생성
CREATE TABLESPACE TABLE_HYO
    DATAFILE 'C:\ORACLE\DATA\tb_hyo.dbf' SIZE 1024M
    AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
    SEGMENT SPACE MANAGEMENT AUTO;

SELECT * FROM DBA_TABLESPACES;

--테이블 생성
CREATE TABLE KOPO_ST_HYO(
PARAM_NAME  VARCHAR(20),
PARAM_VALUE VARCHAR(20)
);

--테이블 조회
SELECT PARAM_NAME, PARAM_VALUE FROM KOPO_ST_HYO;

--특정 문자열을 포함하는 테이블 조회
SELECT * FROM TABS
WHERE TABLE_NAME  LIKE '%HYO%' ;
