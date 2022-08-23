
파일->새로만들기->데이터베이스계층->데이터베이스 파일
D:\java202207\database\20220819_03where.sql
////////////////////////////////////////////////////////////////////////////////

도구 - 환경설정 - 코드편집기 - 행여백 - 행번호표시 
    체크하면 워크시트에 계속 행번호가 떠있습니다.


★ [where 조건설]

　- 조건을 만족하는 행들에 대해서
　- 조건에 만족하는 레코드만 대상으로 조회(select), 수정(update), 삭제(delete)하기 위해서. [insert 에서는 안쓰인다.]
 
 select * from sungjuk;
 
 -------------------------------------------
--문1) 국어점수가 50점이상 행을 조회하시오
select uname, kor
from sungjuk
where kor>=50;

--문2) 영어 점수가 50점미만 행을 조회하시오
select uname, eng
from sungjuk
where eng<50;

--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select uname, kor, eng, mat
from sungjuk
where uname='대한민국'; -- 좌우가 서로 같다.

--문4) 이름이 '대한민국' 아닌 행을 조회하시오
select uname, kor, eng, mat
from sungjuk
where uname != '대한민국'; -- 좌우가 서로 같다.

select uname, kor, eng, mat
from sungjuk
where uname <> '대한민국'; -- 좌우가 서로 같다.

--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오

select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오

select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat<40;

--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오

select uname, kor
from sungjuk
where kor>=80 and kor<90;

--문8) 이름이 '무궁화', '봉선화'를 조회하시오

select uname, kor, eng, mat
from sungjuk
where uname='무궁화' or uname='봉선화';

////////////////////////////////////////////////////////////////////////////////

★ [between A and B] 연산자 - A부터 B까지

-- 문제 7) 국어 점수가 80~89점 사이 행을 조회하시오.

select uname, kor
from sungjuk
where  kor between 80 and 89;

////////////////////////////////////////////////////////////////////////////////


★ [in] 연산자 - 목록에서 찾기

-- 이름이 '무궁화',  '봉선화' 를 조회하시오.

select uname, kor, eng, mat
from sungjuk
where uname in ('무궁화', '봉선화');

-- 국어점수 10, 30, 50점을 조회하시오

select uname, kor
from sungjuk
where kor in (10, 20, 30);


////////////////////////////////////////////////////////////////////////////////

--문9) 국, 영, 수 모두 100점 아닌 행을 조회하시오.

select uname, kor, eng, mat
from sungjuk
where kor !=100 or eng !=100 or mat !=100; 

select uname, kor, eng, mat
from sungjuk
where not (kor=100 and eng=100 and mat=100);


////////////////////////////////////////////////////////////////////////////////


★ [LIKE 연산자]    

- 문자열 데이터에서 비슷한 유형을 검색할 때

    -  % 글자갯수와 상관없음
    -  _ 글자갯수까지 일치해야 함 [ 강사님 피셜 써본적 없음.]
    
select uname
from sungjuk
where uname = '대한민국';

--문1) 이름에서 '홍'으로 시작하는 이름을 조회하시오

select uname
from sungjuk
where uname like '홍%';

--문2) 이름에서 '화'로 끝나는 이름을 조회하시오

select uname
from sungjuk
where uname like '%화';

--문3) 이름에 '나'글자 있는 이름을 조회하시오

select uname
from sungjuk
where uname like '%나%';


--문4) 두글자 이름에서 '화'로 끝나는 이름을 조회하시오

select uname
from sungjuk
where uname like '_화';

--문5) 이름 세글자 중에서 가운데 글자가 '나' 있는 행을 조회하시오

select uname
from sungjuk
where uname like '_나_';


--문6) 제목+내용을 선택하고 검색어가 '파스타' 일때

where subject like '%파스타%' or content like '%파스타%';

--문7) 국어 점수가 50점이상인 행에 대해서 총점 (tot)과 평균 (aver) 을 구하시오


update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select uname, kor, tot, aver
from sungjuk
where kor > 50;

------------------------------------------------------------
select * from sungjuk where kor>=50;

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor >= 50;

select * from sungjuk;

////////////////////////////////////////////////////////////////////////////////

★ [NULL] - 비어있는 값

-- 총점의 갯수를 구하시오.
select count(tot) from sungjuk;     -- null값은 카운트 되지 않음.

-- 총점에 NULL이 있는 행의 갯수를 구하시오.
select count(*) from sungjuk where tot=null; --null값 확인 못함. 0

select count(*) from sungjuk where tot is null; --null값 확인 5


-- 평균에 비어있지 않은 행의 갯수를 구하시오.
select count(*) from sungjuk where aver is not null;


--문8) 비어있는 총점과 평균을 모두 구하시오.

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

select * from sungjuk;

commit;








