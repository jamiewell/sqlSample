-----------------------------------------------------

-- ���̺�� ����

RENAME kopo_product_volume to kopo_product_volume2;

-- ���̺� �÷� �̸� ����

ALTER TABLE kopo_product_volume
    RENAME COLUMN vol TO VOLUME;

-- �÷� �Ӽ� ����

ALTER TABLE kopo_product_volume
    MODIFY (VOLUME VARCHAR (20));
-- ���ڵ����Ϳ��� ���������� ���� �Ұ�. 
                               
 
 -- varchar(20)���� varchar(10) ���氡��
ALTER TABLE kopo_product_volume
    MODIFY (PRODUCTGROUP VARCHAR (10));

-- ���ο� �÷� �߰�
ALTER TABLE kopo_product_volume
    ADD (new_volume VARCHAR (10) DEFAULT 'XXX');

-- �÷�����
ALTER TABLE kopo_product_volume
    DROP (new_volume);
-----------------------------------------------------