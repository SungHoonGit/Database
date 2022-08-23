
파일->새로만들기->데이터베이스계층->데이터베이스 파일
D:\java202207\database\20220822_02시퀀스.sql
////////////////////////////////////////////////////////////////////////////////

일렬번호 부여가능. 한번 쓴 일렬번호는 발생시키 않음.
특정행을 지정하기 위해 일렬번호를 부여한다.

★ [ 자동으로 일렬번호 부여 ]

- Oracle Database : sequence 생성
- M*SQL  Database : identity 제약조건

////////////////////////////////////////////////////////////////////////////////

-- sungjuk 테이블 삭제
drop table sungjuk;
commit;

-- sungjuk 테이블 생성
create table sungjuk(
     sno   int          not null -- 일렬번호
    ,uname varchar(50)  not null
    ,kor   int          not null
    ,eng   int          not null
    ,mat   int          not null
    ,tot   int          
    ,aver  int          
    ,addr  varchar(50)           -- 주소
    ,wdate date               -- 등록일(년월일시분초)
);


////////////////////////////////////////////////////////////////////////////////

--행추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(1, '홍길동', 89,85,90, 'Seoul','2022-08-22'); -- 날짜 데이터는 문자열 형태로 추가한다.

select * from sungjuk;  -- 전체 행 조회
delete from sungjuk;    -- 전체 행 삭제
commit;                 -- 명령어 완료

////////////////////////////////////////////////////////////////////////////////

★ [ 시퀀스 Sequence ]
    - 일련번호 자동 생성
    - 시퀀스 생성 : create sequence 시퀀스명;
    - 시퀀스 삭제 : drop   sequence 시퀀스명;
    
    - 시퀀스 생성 형식) create sequence 시퀀스명
                        increment by 증가값 start with 시작값;

-- sungjjuk테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- sungjuk_seq 시퀀스 삭제
drop sequence sungjuk_seq;

-- 시퀀스를 이용한 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '홍길동', 89,85,90, 'Seoul','2022-08-22');

////////////////////////////////////////////////////////////////////////////////

★ [ sysdate 함수 ] - 시스템의 현재 날짜 정보
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '홍길동', 89,85,90, 'Seoul', sysdate);


////////////////////////////////////////////////////////////////////////////////

--문제) sno-2 행을 삭제하시오

delete from sungjuk where sno=2;
commit;