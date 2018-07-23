-----------------------------------------------------

-- 테이블명 변경

RENAME kopo_product_volume to kopo_product_volume2;

-- 테이블 컬럼 이름 변경

ALTER TABLE kopo_product_volume
    RENAME COLUMN vol TO VOLUME;

-- 컬럼 속성 변경

ALTER TABLE kopo_product_volume
    MODIFY (VOLUME VARCHAR (20));
-- 숫자데이터에서 문자형으로 변경 불가. 
                               
 
 -- varchar(20)에서 varchar(10) 변경가능
ALTER TABLE kopo_product_volume
    MODIFY (PRODUCTGROUP VARCHAR (10));

-- 새로운 컬럼 추가
ALTER TABLE kopo_product_volume
    ADD (new_volume VARCHAR (10) DEFAULT 'XXX');

-- 컬럼삭제
ALTER TABLE kopo_product_volume
    DROP (new_volume);
-----------------------------------------------------