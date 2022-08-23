
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
D:\java202207\database\20220822_04��������.sql
////////////////////////////////////////////////////////////////////////////////


�� [ �ڷ��� ]
1) ������
    - ������ varchar(5)   'SKY'   5ĭ�̿��� 3ĭ�� ������ ��� 
        ex) ���̵�, ��й�ȣ, �̸�, �ּ� ~~
    - ������ char(5)      'SKY  ' 5ĭ.  
        ex) �ֹι�ȣ, �����ȣ, ���¹�ȣ [������ ĭ��] 
    
    
2) ������
    - int ������ 


3) ��¥��
    - ����Ͻú���
    - ���б�ȣ - �� / ��ȣ�� ����Ѵ�.
    - ���ڿ�Ÿ������ �Է��Ѵ�.
    - date
    
////////////////////////////////////////////////////////////////////////////////


�� [ ���̺� �������� ]

1) primary key
    �⺻Ű. ���ϼ�
    where �������� �ɸ� �� �ִ� ��ǥ���� �÷��� ������ �� �ִ�.
    ��) �ֹι�ȣ, �ڵ�����ȣ, ���¹�ȣ, ���̵�, �̸��� ~~~
    �ߺ��� ������� ����.
    null�� ������� ����. (���� ������� ����. �ݵ�� ������ �Է��ؾ� ��.)
    
2) not null
    ���� ������� ����

3) check
    �Է��� ���� Ư�� ������ ���ϴ� ����
    
4) default
    ����ڰ� ���� �Է����� ������ �ش� Į���� ������ �⺻���� �ڵ����� �Է����ش�.
    
5) unique
    �ߺ��� ������ ������ unique �� ���!
    null�� �ѹ��� ���! 
    
6) foreign key
    �ܷ�Ű
    ���̺� �����ϴ� ��� �θ�� �ڽ� ���踦 ����
    

////////////////////////////////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
    sno     int          primary key                   -- �⺻Ű(���ϼ�)
    ,uname  varchar(50)  not null
    ,kor    int          check(kor between 0 and 100)  -- �������� 0~100���̸� �Է°���
    ,eng    int          check(eng between 0 and 100)  -- �������� 0~100���̸� �Է°���
    ,mat    int          check(mat between 0 and 100)  -- �������� 0~100���̸� �Է°���
    ,addr   varchar(20)  check(addr in('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot    int          default 0
    ,aver   int          default 0
    ,wdate  date         default sysdate               -- ���� ��¥ �Լ�
);

////////////////////////////////////////////////////////////////////////////////
   �� [ ���̺� �������� ���� �޼��� ]
   
-- primary key  ��������
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007327)�� ����˴ϴ�
-- SNO Į���� �⺻Ű(PK)�̹Ƿ� �ߺ��� ���� ������� ����.
insert into sungjuk(sno,uname) values(1, 'Ȧ�浿'); -- 2�� �������� �� ���� �߻� 



-- not null ��������
-- ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(1);           -- uname Į���� �ݵ�� ���� �Է��ؾ� ��


-- check ��������
-- ORA-02290: üũ ��������(SYSTEM.SYS_C007325)�� ����Ǿ����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);             -- ������ ������ 0~100���̸� ����


insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'incheon');    -- addrĮ���� 'Incheon' ��� ����.


--default ��������
--tot�� aver�� 0 �Է�, wdate�� ���糯¥�� �Էµ�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values (2, '����ȭ', 10, 20, 30, 'Seoul');

select * from sungjuk;



--Į�������� �������� ��ġ���� �ʴ� ���
--SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ� 00913. 00000 -  "too many values"

insert into sungjuk(sno, uname, kor, eng, mat)
values (2, '����ȭ', 10, 20, 30, 'Seoul');