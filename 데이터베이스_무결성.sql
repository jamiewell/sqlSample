select * from tabs;

select * from KOPO_PRODUCT_VOLUME_FOREIGN;

select * from KOPO_EVENT_INFO_FOREIGN;



select * from tabs
where 1=1
and table_name like '%KOPO%';

-- drop table KOPO_EVENT_INFO_FOREIGN;
-- delete from tableName where columnName = data


CREATE TABLE KOPO_PRODUCT_VOLUME
(
    REGIONID        VARCHAR (20),
    PRODUCTGROUP    VARCHAR (20),
    YEARWEEK        VARCHAR (20),
    VOLUME          NUMBER NOT NULL,
    CONSTRAINT pk_KOPO_PRODUCT_VOLUME PRIMARY KEY
        (REGIONID, PRODUCTGROUP, YEARWEEK)
);


INSERT INTO KOPO_PRODUCT_VOLUME
     VALUES ('regionid',
             'prodcutgroup',
             '201702',
             'string');
 

INSERT INTO KOPO_PRODUCT_VOLUME
     VALUES (200,
             'productgroup',
             '201712',
             NULL);


 
INSERT INTO kopo_product_volume
     VALUES ('A01',
             'ST0001',
             '201503',
             20);


UPDATE KOPO_PRODUCT_VOLUME
    SET YEARWEEK = '201513'
    WHERE 1=1
    AND YEARWEEK = '201512'
    AND PRODUCTGROUP = 'ST0001';

-- DESCRIPTION OF TABLE
DESC kopo_product_volume;




desc kopo_product_volume_foreign;
desc kopo_event_info_foreign;



--부모 테이블 생성,  기본키는 EVENTID
CREATE TABLE kopo_event_info_foreign
(
    eventid            VARCHAR2 (20),
    eventperiod        VARCHAR2 (20),
    PROMOTION_RATIO    NUMBER,
    CONSTRAINT pk_kopo_event_info_foreign PRIMARY KEY (eventid)
);


--자식 테이블생성, 외래키는 부모테이블의 EVENTID
create table KOPO_PRODUCT_VOLUME_FOREIGN
(
    REGIONID     varchar(20),
    PRODUCTGROUP varchar(20),
    YEARWEEK     varchar(20),
    VOLUME       number,
    EVENTID        varchar(20)
,constraint pk_kopo_product_volume_foreign primary key (regionid,productgroup,yearweek)
,constraint fk_kopo_product_volume_foreign foreign key (eventid) references kopo_event_info_foreign(eventid)
--on delete cascade
--on delete set null
);

 
--자식테이블의 NULL값 아닌 데이터 조회
SELECT *
  FROM KOPO_PRODUCT_VOLUME_FOREIGN
 WHERE 1 = 1 AND EVENTID IS NOT NULL;


SELECT * FROM KOPO_EVENT_INFO_FOREIGN;



ALTER TABLE kopo_product_volume_foreign
    ENABLE CONSTRAINT fk_kopo_product_volume_foreign;

insert into kopo_product_volume_foreign
    values('A01','ST0002','201501',50,'EVTEST');
    
delete from kopo_event_info_foreign
    where eventid = 'EV00001';
       
select * from kopo_product_volume_foreign
    where eventid = 'EV00001';

