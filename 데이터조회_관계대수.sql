select * from tabs;
select * from kopo_product_volume;
select * from KOPO_CHANNEL_RESULT_A01;
select * from KOPO_CHANNEL_RESULT_A02;
select * from kopo_product_volume_a01;
select * from kopo_product_volume_a02;

--������ ��ҹ��� �����ϱ� ���ڿ��� Ȧ����ǥ���
select * from kopo_product_volume
    where 1=1
    and yearweek >= 201601
    and productgroup = 'ST0001';
 

-- ctrl + e �ڽ�Ʈ Ȯ��
-- union => ���̺��� ���  �Ӽ���  ��ġ�� ������ �ߺ�ó�� �߻� - cost ���
--union all  => ���̺��� �ߺ� �Ӽ��� �����ϰ� ��ħ
  
select REGIONID, PRODUCTGROUP, YEARWEEK, VOLUME
from kopo_product_volume_a01
 union all
select REGIONID, PRODUCTGROUP, YEARWEEK, VOLUME
 from kopo_product_volume_a02;

select REGIONID, PRODUCTGROUP, YEARWEEK, qty
    from  KOPO_CHANNEL_RESULT_A01
union 
select REGIONID, PRODUCTGROUP, YEARWEEK, qty
    from KOPO_CHANNEL_RESULT_A02;
    
select *  from  KOPO_CHANNEL_RESULT_A01
union all
select *  from KOPO_CHANNEL_RESULT_A02;    
  

--�Ӽ�,�÷� ������ �÷������� ���ƾ� ���Ͼ��� ����. 
select * from kopo_product_volume_a01    
    union all
 select * from kopo_product_volume_a02;      





