select * from tabs;

-----------------------------------------------------------------------------------------------------------
-- �������� oracle db�� �����ϱ� ���� �����ͺ��̽� ��ũ ����
-----------------------------------------------------------------------------------------------------------

-- 1��. TNSNAME Ȱ�� 
CREATE DATABASE LINK new_poly_server
--db ��ũ���� ���� ����.
CONNECT TO kopo
IDENTIFIED BY kopo
Using 'poly_server';
--Using '������'��  �̹� ����ŬTNS�� ��ϵ� ���� �̸�

------------------------------------------------------

-- 2��. ����ȣ���� Ȱ��
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
  -- ������ �����ͺ��̽� ��ũ Ȯ�ι��
  SELECT * FROM ALL_DB_LINKS;
  
  -- ��ũ�� �������� ������ �ҷ�����
SELECT * FROM kopo_product_volume@poly_server;
SELECT * FROM kopo_channel_seasonality@poly_server;
  
  --���� TNS���� ���ο� �̸��� DB��ũ�� ������, ������ ���
SELECT * FROM kopo_product_volume@new_poly_server;
   
