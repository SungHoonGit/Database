파일->새로만들기->데이터베이스계층->데이터베이스 파일
D:\java202207\database\2022089_01SQL기초.sql
////////////////////////////////////////////////////////////////////////////////

[sungjuk 테이블 삭제]
drop table sungjuk;

[sungjuk 테이블 생성]
create table sungjuk(
    uname varchar(50) not null  --빈값을 허용하지 않음.
                                --영문자 50글자 이내에서 입력.
    ,kor int          not null
    ,eng int          not null
    ,mat int          not null
    ,tot int          null      -- 빈값 허용 (생략 가능)
    ,aver int                   
    
);


[샘플 데이터 행추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);

////////////////////////////////////////////////////////////////////////////////


[전체 레코드 조회]
select uname, kor, eng, mat, tot, aver from sungjuk;


[전체 행갯수 조회]
select count (*) from sungjuk;


[select 조회 및 검색]
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk;      --전체 모든 컬럼 조회


[as]  -- 칼럼명을 임시 변경
select kor as 국어, eng as 영어, mat as 수학 
from sungjuk;   -- 임시 한글 칼럼명은 일시적으로 분석해야 하는 경우만 추천!

-- as는 생략가능.
select kor korea, eng english, mat mate
from sungjuk;


[count 함수] - 행 갯수 조회
select count(uname) from sungjuk;
select count(kor) from sungjuk;
select count(eng) as cnt_eng from sungjuk;
select count(mat) 수학갯수 from sungjuk;    --임시 칼럼명으로 한글 가능.

select count(tot) from sungjuk; -- 0
select count(aver) from sungjuk; --0


--sungjuk 테이블의 전체 행의 갯수
select count(*) as 전체행갯수 from sungjuk;
select count(*)  전체행갯수 from sungjuk;
////////////////////////////////////////////////////////////////////////////////


[명령어 완료와 취소]
- insert, update, delete 명령어를 사용하는 경우, 명령어 취소와 명령어 완료를 선택할 수 있다.
- commit    : 명령어 완료.
- rollback  : 명령어 취소.


※ SQL Developer툴에서 자동커밋 설정해 놓을 수 있다
   도구->환경설정->데이터베이스->객체뷰어->자동커밋설정
   
delete from sungjuk;  -- 전체 레코드 삭제
select * from sungjuk;

rollback;
select * from sungjuk;