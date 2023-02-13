#이름이 있는 동물의 아이디
#문제 설명
#동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.


SELECT animal_id
from animal_ins
where name is not null;

-----------------------------------------------------------------------------------------------------

# NULL 처리하기
# 문제 설명
# 입양 게시판에 동물 정보를 게시하려 합니다. 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요.
# 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.

SELECT animal_type, ifnull(name,'No name') as name, sex_upon_intake
from animal_ins;

-----------------------------------------------------------------------------------------------------

#나이 정보가 없는 회원 수 구하기
#문제 설명
# USER_INFO 테이블에서 나이 정보가 없는 회원이 몇 명인지 출력하는 SQL문을 작성해주세요. 이때 컬럼명은 USERS로 지정해주세요.

SELECT count(user_id) as users
from user_info
where age is null;



-----------------------------------------------------------------------------------------------------



#조건에 맞는 도서와 저자 리스트 출력하기
# '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 출판일을 기준으로 오름차순 정렬해주세요.

SELECT book.book_id, author.author_name,
date_format(published_date, "%Y-%m-%d") as PUBLISHED_DATE
from book
inner join author
on book.author_id = author.author_id
where book.category = '경제'
order by published_date;


#이름이 없는 동물의 아이디
#동물 보호소에 들어온 동물 중, 이름이 없는 채로 들어온 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.

SELECT animal_id
from animal_ins
where name is null;