#in() 여러 문자 중 하나에 포함되는지 비교할때 in을 쓴다.

select mem_name, addr
from member
where addr in ('경기','전남','경남');

#like
select *
from member
where mem_name like '우%';

#이때 조건은 제일 앞 글자가 '우'이고 그 뒤는 무엇이든 허용한다는 의미

#언더바(_)

select *
from member
where mem_name like '__핑크';

#이때 조건은 앞의 두 글자는 상관없고 뒤가 '핑크'인 회원을 검색

#서브쿼리

select mem_id, height from member
where height > (select height from member
                              where mem_name = '에이핑크');

select mem_id, mem_name, debut_date
from member
order by debut_date;


#출력의 개수를 제한:limit

select *
from member
limit 3;

#debut_date를 기준으로 빠른 3

select *
from member
order by debut_date
limit 3;

#중복된 결과를 제거 : distinct

select distinct addr
from member;