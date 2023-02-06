use bookstore_test;

select 도서명,가격
from 도서;

select 도서명,가격
from 도서
where 가격 >= 15000;

select 회원번호, 회원명, 주민등록번호, 주소, 취미, 몸무게, 등급, 적립금
from 회원;

select 회원명, 등급, 주소
from 회원;

select 회원명 as 회원이름, 주소 as '현재 주소지'
from 회원;

select *
from 회원
where 회원번호 = 1;

alter table 회원
add 키 int;

select *
from 회원;

select *
from 회원 where 키 < 165;

select 회원명, 등급, 키
from 회원
where 등급 = '정회원' and
      키 >= 160;

select 회원명, 등급, 키
from 회원
where 등급 = '비회원' or
      키 >= 160;

select 회원명, 주소, 몸무게
from 회원
where 몸무게 between 40 and 50;

select 회원명, 주소, 몸무게
from 회원
where 몸무게 not between 40 and 50;

select 회원명, 등급
from 회원
where 등급 in ('평생회원', '정회원');

from 회원
select 회원명, 등급
where 등급 not in ('평생회원', '정회원');

select *
from 회원
where 회원명 like '송%';


select *
from 회원
where 회원명 like '김%';

select 회원명, 주소
from 회원;

select 회원명, 주소
from 회원
where 주소 is null;

select 회원명, 주소, 키, 몸무게
from 회원
where 몸무게 is not null
and 몸무게 > 0;

select *
from 회원
order by 회원명;

select *
from 회원
order by 키 desc ;

select *
from 회원
where 등급 = '비회원'
order by 키;

select 회원명, 키, 몸무게
from 회원
order by 몸무게;

select 회원명, 등급, 몸무게, 키
from 회원
order by 몸무게 desc, 키;

select 회원번호, 회원명, 주소
from 회원
order by 2;

select 회원번호, 회원명, 주소
from 회원
order by 회원명;

#'송혜교'회원과 등급이 동일한 회원들의 회원명, 등급, 주소를 검색하라.

select 회원명, 등급, 주소
from 회원
where 등급 = (select 등급
            from 회원
            where 회원명 = '송혜교');

#등급이 정회원인 회원들의 평균 키보다 작은 회원들의 회원명,등급,주소,키를 검색하라.

select 회원명,등급,주소,키
from 회원
where 키 <  (select avg(키)
            from 회원
            where 등급 = '정회원');


#'보아'회원과 등급이 같고, '보아'회원보다 키가 큰 회원의 회원명, 등급, 키, 몸무게를 검색하라.

select 회원명, 등급, 키, 몸무게
from 회원
where 등급 = (select 등급
            from 회원
            where 회원명 = '보아')
and 키 > (select avg(키)
    from 회원
    where 회원명 = '보아');

#몸무게가 45인 회원의 회원번호, 회원명, 주소, 몸무게를 검색하는 sql 명령문을 사용

select 회원번호, 회원명, 주소, 몸무게
from 회원
where 회원번호 in (select 회원번호
              from 회원
              where 몸무게 = 45);

#aggregate function(집단함수)

#count - 행의개수
#sum - 모든 행의 합계
#avg - 평균값
#max - 최대값
#min - 최소값

select count(*)
from 회원;

select count(*) as 회원수
from 회원;

#몸무게 정보가 있는 회원의 수를 검색하라

select count(몸무게) as '몸무게 정보가 있는 회원수'
from 회원;

#다른버전

select count(*)
from 회원
where 몸무게 is not null;

#도서 번호가 3인 도서의 평균 주문 수량은?

select avg(주문수량) as 평균주문수량
from 주문도서
where 도서번호 = 3;

select 도서번호, avg(주문수량) as 평균주문수량
from 주문도서
group by 도서번호;

select *
from 주문도서;

#전체회원을 몸무게별로 나누고, 같은 몸무게회원은 다시 등급별로 그룹핑하여, 몸무게와 등급별로 인원수, 평균 몸무게를 출력하여라.

select 몸무게, 등급, count(*) as 인원수 , avg(몸무게) as 평균몸무게
from 회원
group by 몸무게, 등급;

#누적주문 건수가 두 건 이상인 도서의 평균 주문 수량은?

select 도서번호, count(*) as 누적주문건수, avg(주문수량) as 평균주문수량
from 주문도서
group by 도서번호
having 누적주문건수 >=2;


############################################
#다른버전

select 도서번호, count(*) as 누적주문건수, avg(주문수량) as 평균주문수량
from 주문도서
group by 도서번호
having count(*) >=2;


#평균 주문 수량 내림차순

select 도서번호, count(*) as 누적주문건수, avg(주문수량) as 평균주문수량
from 주문도서
group by 도서번호
having count(*) >= 2
order by 평균주문수량 desc;