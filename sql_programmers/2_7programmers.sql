#조건에 맞는 회원수 구하기

# USER_INFO 테이블에서 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원이 몇 명인지 출력하는 SQL문을 작성해주세요.


# 예를 들어 USER_INFO 테이블이 다음과 같다면
# USER_ID	GENDER	AGE	JOINED
# 1	1	26	2021-10-05
# 2	0	NULL	2021-11-25
# 3	1	22	2021-11-30
# 4	0	31	2021-12-03
# 5	0	28	2021-12-16
# 6	1	24	2022-01-03
# 7	1	NULL	2022-01-09
# 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원은 USER_ID 가 1, 3, 5 인 회원들 이므로, 다음과 같이 결과가 나와야 합니다.
# USERS
# 3


-- 코드를 입력하세요
select count(user_id) as USERS
from user_info
where year(joined) = 2021
and age between 20 and 29;

----------------------------------------------------------------------------------------------------------

#상위 n개 레코드

#동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.

# 예시
# 예를 들어 ANIMAL_INS 테이블이 다음과 같다면
# ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
# A399552	Dog	2013-10-14 15:38:00	Normal	Jack	Neutered Male
# A379998	Dog	2013-10-23 11:42:00	Normal	Disciple	Intact Male
# A370852	Dog	2013-11-03 15:04:00	Normal	Katie	Spayed Female
# A403564	Dog	2013-11-18 17:03:00	Normal	Anna	Spayed Female
# 이 중 가장 보호소에 먼저 들어온 동물은 Jack입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
# NAME
# Jack
# ※ 보호소에 가장 먼저 들어온 동물은 한 마리인 경우만 테스트 케이스로 주어집니다.

select name
from animal_ins
order by datetime limit 1;


-----------------------------------------------------------------------------------------------------

#가격이 제일 비싼 식품의 정보 출력하기

#FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드, 식품분류, 식품 가격을 조회하는 SQL문을 작성해주세요.

SELECT *
from food_product
where price = (select max(price)
              from food_product);

