
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
D:\java202207\database\20220822_01����.sql
////////////////////////////////////////////////////////////////////////////////

�� [ �������� ]
    - sort ����
    - ���̺� ����
    - ������
    
////////////////////////////////////////////////////////////////////////////////



�� [ sort ���� ]
    - Ư����(keyfield)�� �������� ������� ���ġ.
    - �������� Ascending Sort ( ASC ) �����ϸ� �⺻��. [ 1->10  A->Z a->z ��->�� ]
    - �������� Decending Sort ( DESC )
    - ����) order by Į����1, Į����2, Į����3, ~~~
    

-- sungjuk���̺��� ��ȸ�Ͻÿ�.
select * from sungjuk;


-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸ�Ͻÿ�.
select uname
from sungjuk
order by uname asc; -- �������� ����

select uname
from sungjuk
order by uname ; -- asc ��������

select uname
from sungjuk
order by uname desc; -- �������� ����


--�������������� �����ؼ� ��ȸ�Ͻÿ�.
select uname, kor
from sungjuk
order by kor;


--1�� ���� : �������������� ����
--2�� ���� : ���������� ���ٸ� �̸��� �������� �������� ����
select uname, kor 
from sungjuk
order by kor, uname desc;

--1��(kor), 2��(eng), 3��(mat) ����
select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc;

////////////////////////////////////////////////////////////////////////////////

select * from sungjuk;

����) ��� 70�� ���� ���� �̸������� ��ȸ�Ͻÿ�.

-- ��� 70�� ������ ��ȸ
select uname, aver
from sungjuk
where aver<=70;

--�����ؼ�
select uname, aver
from sungjuk
where aver<=70
order by uname ;

select uname, aver
from sungjuk
order by uname
where aver>=70;  -- ���� ORA-00933   ��ä������ �ļ����� ����!
////////////////////////////////////////////////////////////////////////////////
  select * from sungjuk;
  

�� [ alter �� ] -- ���� ��� �����ϴ°�? ���� �߸��Ѱ�.
    - ���̺��� ���� ���� �� ����
1. �÷� �߰�
   ����) alter table table�� add (�÷��� ������Ÿ��);
   
--music Į�� �߰�
alter table sungjuk add(music int null);



2. �÷��� ����
   ����) alter table table�� rename column �����÷��� to �ٲ��÷���;
   
-- ����Į�� kor�� koreaĮ�������� �����Ͻÿ�.
alter table sungjuk rename column kor to korea;



3. �÷� ������ Ÿ�� ����
  ����) alter table table�� modify(�÷��� ������Ÿ��);
  
--music Į���� �ڷ����� varchar �����Ͻÿ�.
alter table sungjuk modify(music varchar(5));
select * from sungjuk;



4. �÷� ����
  ����)alter table table�� drop(�÷���);
  
  
--musicĮ���� �����Ͻÿ�
alter table sungjuk drop(music);
select * from sungjuk
  

----------------------------------------------------