
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
D:\java202207\database\20220822_05group.sql
////////////////////////////////////////////////////////////////////////////////

�� [ ������ �׷�ȭ ]

--sungjuk_seq ������ ����
drop sequence sungjuk_seq;

--sungjuk_seq ������ ����
create sequence sungjuk_seq;

--sungjuk���̺� ����
drop table sungjuk;

--sungjuk���̺� ����
create table sungjuk (
    sno    int          primary key                  
   ,uname  varchar(50)  not null                         
   ,kor    int          check(kor between 0 and 100)                    
   ,eng    int          check(eng between 0 and 100)                    
   ,mat    int          check(mat between 0 and 100)
,addr   varchar(20)  check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int          default 0
   ,aver   int          default 0
   ,wdate  date         default sysdate              
);

--sungjuk���̺� �Է� ������
�� ���� D:\java202207\database\20220822_03�������̺�.sql

commit;
select count(*) from sungjuk;  -- ��ü ���ڵ� ����
select * from sungjuk;

////////////////////////////////////////////////////////////////////////////////


�� [ distinct ]
    - Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
    - ����) distinct Į����
    
select addr from sungjuk;
select addr from sungjuk order by addr;          -- asc ��������
select addr from sungjuk order by addr asc;      -- ��������
select addr from sungjuk order by addr desc;     -- ��������

select distinct addr from sungjuk;
select distinct (uname) from sungjuk;

////////////////////////////////////////////////////////////////////////////////

�� [ group by ]
    - Į���� ���� ���볢�� �׷�ȭ ��Ŵ
    - ����) group by Į��1, Į��2, Į��3, ~~~

-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr; -- distinct �� ����� ����

--  �̸��� ������ ���� �׷�ȭ��Ű�� �̸��� ��ȸ
select uname
from sungjuk
group by uname; -- distinct �� ����� ����

--ORA-00979: GROUP BY ǥ������ �ƴմϴ�.00979. 00000 -  "not a GROUP BY expression"
select addr, uname      -- �׷��Ű�� ���ü� �ִ� ���� 1���� ������ ���� ��ȸ
from sungjuk        
group by addr;          -- ����

select addr, uname from sungjuk order by addr;


select addr from sungjuk order by addr;

--��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�.
select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt -- Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt    -- as ��������
from sungjuk
group by addr;


--�ּҺ� �������� �����ؼ� ��ȸ
select addr, count(*) cnt 
from sungjuk
group by addr
order by addr;

--�ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*) cnt 
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) cnt       --�ؼ����� 3)
from sungjuk                    --�ؼ����� 1)
group by addr                   --�ؼ����� 2)
order by cnt desc;              --�ؼ����� 4)

////////////////////////////////////////////////////////////////////////////////



�� [ �����Լ� ]

--��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�.
select addr, count(*), max(kor), min(kor), sum(kor), floor(avg(kor)) -- ����, �ִ밪, �ּڰ�, �հ�, ���
from sungjuk 
group by addr;

--�ּҼ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), floor(avg(kor))
from sungjuk
group by addr
order by addr;


--round(��, 0) �Ҽ��� ���ϰ����� �ݿø��ϰ� �Ҽ����� ����.
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by addr;

--��������� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- Į���� �ο�
select addr
    , count(*) cnt
    , max(kor) max
    , min(kor) min
    , sum(kor) sum
    , round(avg(kor), 0) avg
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

--��3) ����(tot), ���(aver) ���Ͻÿ�
 
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select * from sungjuk

--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�

select addr, count(*) cnt
from sungjuk
where aver>=80
group by addr
order by cnt;


--�����
select addr, aver
from sungjuk
where aver>=80
order by aver desc;

SELECT addr, count(addr)    --4)
from sungjuk                --1)
where aver>=80              --2)
group by addr               --3)
order by count(*)           --5)



///////////////////////////////////////////////////////////2022-08-23///////////



�� [2���׷�]

--�ּҺ� ������ ��ȸ�Ͻÿ�
select addr, kor, eng, mat from sungjuk order by addr, kor;

--�ּҺ�(1��) �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)�� �׷�ȭ �ϱ�

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

-- ��������(1��) �������� (2��) ��������(3��) �׷�ȭ�ϱ�.
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;

////////////////////////////////////////////////////////////////////////////////


�� [having ������]
    - group by  �� ���� ����ϴ� ������
    - �׷�ȭ�� �ϰ� �� ���� �������� �߰�
    - ����) having ������
    
--�ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

-- �ּҺ� �ο����� 3�� ���� ��ȸ�Ͻÿ�.
select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- �ּҺ� �ο����� 3�̻��� ���� ��ȸ�Ͻÿ�.
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

--------------------------------------------------------------------------------


--��5) �ּҺ� ������հ��� 50�̻� ���� ��ȸ�Ͻÿ�
--    (��, ��հ��� �Ҽ������� �ݿø�)

select addr, floor(avg(kor)) koravg, count(*) --round(sum(kor)/count(*),0)
from sungjuk
group by addr
having avg(kor)>=50;

--�����
1) �ּҺ� ���������� ���� ��հ� ���ϱ�.
select addr, avg(kor)
from sungjuk
group by addr;

2) ������հ��� �ݿø��ϰ� �Ҽ����� ����
select addr, round(avg(kor),0)
from sungjuk
group by addr;

3) 2)������� ������հ��� 50�̻� ��ȸ�ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

4) 3)������� ������հ��� ������������ ��ȸ�ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

5) 4)������� ������հ� Į������ avg_kor�� �����ϱ�

select addr, round(avg(kor),0) avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

--��6) ���(aver)�� 70�̻� ���� ������� �ּҺ� �ο����� ������
--     �� �ο����� 2�̸� ���� �ο��� ������ ��ȸ�Ͻÿ�

select addr, count(*)
from sungjuk
where aver>70
group by addr
having count(*)<2;


--�����

1) ���(aver)���� 70�̻� �� ��ȸ
select *
from sungjuk
where aver>=70;

2) 1)�� ������� �ּҺ� �ο����� ���Ͻÿ�.
select addr, count(*)
from sungjuk
where aver>70
group by addr;

3) 3�� ������� �� �ο����� 2�̸� �� ��ȸ
select addr, count(*)
from sungjuk
where aver>70
group by addr
having count(*)<2;


4) 3)�� ����� �ο��� ������ ��ȸ.
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by cnt;        --order by count(*) �ᵵ ��
////////////////////////////////////////////////////////////////////////////////


�� [CASE WHEN ~ THEN END ����]

����)
     CASE WHEN ����1 THEN ���Ǹ����� ��1
          WHEN ����2 THEN ���Ǹ����� ��2
          WHEN ����3 THEN ���Ǹ����� ��3
             ...
          ELSE ��
     END ����÷���
     
-- �̸�, �ּҸ� 2��ȸ�Ͻÿ�
select uname, addr from sungjuk;

-- �̸�, �ּҸ� ��ȸ�Ͻÿ�. (��, �ּҴ� �ѱ۷� �ٲ㼭 ��ȸ)

select uname, addr, case when addr='Seoul' then '����'
                         when addr='Jeju'  then '����'
                         when addr='Busan' then '�λ�'
                         when addr='Suwon' then '����'
                    end as juso
from sungjuk;

--��7)�̸�, ����, ������ ��ȸ�Ͻÿ�
      ���� : �������� 90�̻� 'A����'
                      80�̻� 'B����'
                      70�̻� 'C����'
                      60�̻� 'D����'
                      ������ 'F����'
                      
select uname, kor,  case when kor>=90 then 'A����'
                         when kor>=80 and kor<90 then 'B����'
                         when kor>=70 and kor<80 then 'C����'
                         when kor>=60 and kor<70 then 'D����'
                         when kor<60 then 'F����'
                    end as score
from sungjuk
order by score;

-- �����

1)
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as grade
from sungjuk;

2)
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk;

3) between ~ and ������
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk;

4) �������������� �����ϱ�
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk
order by ��������;

