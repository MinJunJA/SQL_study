#movie 데이터베이스를 생성하시오

create database movie;

use movie;


create table 영화
(
    번호 int not null,
    이름 varchar(30) unique,
    개봉연도 int,
    매출액 int,
    관객수 int,
    평점 decimal(4,2),
    primary key (번호)
);

create table 배우
(
    번호 int not null,
    이름 varchar(30),
    출생 datetime,
    키 int,
    몸무게 int,
    배우자 varchar(30),
    primary key (번호)
);

create table 출연
(
    영화번호 int not null,
    배우번호 int not null,
    역할 int,
    역 varchar(30),
    foreign key (영화번호) references 영화(번호),
    foreign key (배우번호) references 배우(번호)
);

insert into 영화 (번호,이름,개봉연도,매출액,관객수,평점) values (1,'명량', 2014, 135748398910,17613682,8.49);
insert into 영화 (번호,이름,개봉연도,관객수,평점) values (2,'쉬리',1999,5820000,8.79);


#매출액 값이 커서 매출액이 안들어가서 int --> big int로 수정
alter table 영화 modify 매출액 bigint;

select *
from 영화;

insert into 배우(번호,이름,출생,키,몸무게) values (1,'최민식','1962-04-27',177,70);
insert into 배우(번호,이름,출생) values (2,'류승룡','1970-11-29');
insert into 배우(번호,이름,출생,키,몸무게,배우자) values (4,'한석규','1964-11-03',178,64,'임명주');
insert into 배우(번호,이름,출생,키,몸무게) values (5,'송강호','1967-01-17',180,80);
insert into 배우(번호,이름,키,몸무게,배우자) values (6,'이병헌',177,72,'이민정');
insert into 배우(번호,이름,키,몸무게) values (7,'한효주',172,48);
insert into 배우(번호,이름,출생,키,몸무게) values (8,'전지현','1981-10-30',174,52);
insert into 배우(번호,이름,출생,키,몸무게) values (10,'김혜수','1970-09-05',170,50);
insert into 배우(번호,이름,출생,키,몸무게,배우자) values (12,'차태현','1976-03-25',175,65,'최석은');
insert into 배우(번호,이름,키,배우자) values (15,'전도연',165,'강시규');
insert into 배우(번호,이름,키,몸무게,배우자) values (16,'장동건',182,68,'고소영');
insert into 배우(번호,이름,출생,키,몸무게,배우자) values (17,'심혜진','1967-01-16',169,51,'한상구');
insert into 배우(번호,이름,키,몸무게) values (18, '수애', 168, 46);
insert into 배우(번호,이름) values (19,'주진모');

select *
from (배우);




insert into 출연 (영화번호, 배우번호, 역할, 역)
values (1,1,1,'이순신'),
       (1,2,1,'구루지마'),
       (2,4,1,'유중원'),
       (2,1,1,'박무영'),
       (2,5,1,'이장길'),
       (3,6,1,'광해/하선'),
       (3,2,1,'허균'),
       (3,7,1,'중전'),
       (4,10,1,'팹시'),
       (4,8,1,'애니콜'),
       (4,19,2,'반장역'),
       (5,8,1,'그녀'),
       (5,12,1,'견우'),
       (6,5,1,'송욱석'),
       (7,15,1,'피아노 학원 강사,이신애'),
       (7,5,1,'카센터 사장,김종찬'),
       (8,16,1,'이진태'),
       (9,4,1,'막동'),
       (9,17,1,'미애'),
       (10,4,1,'수현'),
       (10,17,1,'선영'),
       (11,18,1,'시골 아낙,순이|가수,써니'),
       (11,19,1,'기타리스트,성찬 역');

select *
from 출연;


#평점이 9이상인 영화의 제목과 평점을 검색하라.

select 이름, 평점
from 영화
where 평점 >= 9;

#'쉬리'라는 이름을 가진 영화가 개봉된 연도를 검색하라.

select 개봉연도
from 영화
where 이름 like '%쉬리%';

#'왕'이라는 문자열이 포함된 이름을 가진 영화의 이름과 평점을 검색하라.

select 이름, 평점
from 영화
where 이름 like '%왕%';

#'왕'이라는 문자열이 포함된 이름을 가진 영화의 이름과 평점을 검색하되, 개봉연도를 기준으로 정렬하라.
select 이름,평점
from 영화
where 이름 like '%왕%'
order by 개봉연도;

#'그녀'라는 단어가 포함된 영화의 이름과 평점을 검색하라.
select 이름, 평점
from 영화
where 이름 like '%그녀%';

#번호가 1,2,3인 영화의 이름을 검색하라.

select 이름
from 영화
where 번호 in (1,2,3);

#이름이 '변호인'인 영화 번호를 검색하라.
select 번호
from 영화
where 이름 = '변호인';

#영화배우 '송강호'의 배우 번호를 검색하라.
select 번호
from 배우
where 이름 = '송강호';

#번호가 1인 영화에 출연한 배우의 이름을 검색하라.

select b.이름
from 영화 as a, 배우 as b, 출연 as c
where c.영화번호 = 1
and a.번호 = c.배우번호
and b.번호 = c.배우번호;

#이름이 '도둑들'인 영화에 출연한 배우의 이름을 검색하라.

select b.이름
from 영화 as a, 배우 as b, 출연 as c
where a.이름 = '도둑들'
and c.영화번호 = a.번호
and b.번호 = c.배우번호;


#영화배우 '송강호'가 출연한 영화 이름을 검색하라.

select a.이름
from 영화 as a, 배우 as b, 출연 as c
where b.이름 = '송강호'
and c.영화번호 = a.번호
and b.번호 = c.배우번호;

#2012년 개봉한 영화의 이름과 그 영화에 출연한 주연배우를 검색하라.

select a.이름, b.이름
from 영화 as a, 배우 as b, 출연 as c
where a.개봉연도 = 2012
and b.번호 = c.배우번호
and c.영화번호 = a.번호;

#'송강호'가 가장 바쁜해는 언제일까? 년도별 출연작품 수를 검색하라.

select a.개봉연도, count(c.배우번호) as 출연작품수
from 영화 as a, 배우 as b, 출연 as c
where b.이름 = '송강호'
and b.번호 = c.배우번호
and a.번호 = c.영화번호
group by 개봉연도;

#모든 영화에 따른 모든 주연 배우의 이름을 검색하라.

select a.이름, b.이름
from 영화 as a, 배우 as b, 출연 as c
where c.역할 = 1
and a.번호 = c.영화번호
and b.번호 = c.배우번호;

#2회 이상 주연으로 출연한 영화배우의 이름을 검색하라.

select b.이름
from 영화 as a, 배우 as b, 출연 as c
where c.역할 = 1
and a.번호 = c.영화번호
and b.번호 = c.배우번호
group by b.이름
having count(c.영화번호) >= 2;

#2012년 개봉한 영화의 이름과 출연배우 수를 출력하되, 출연배우 수를 기준으로 정렬하라.

select a.이름, count(c.배우번호) as '출연배우 수'
from 영화 as a, 출연 as c
where a.개봉연도 = 2012
and a.번호 = c.영화번호
group by a.이름
order by '출연배우 수';

#영화배우 '송강호'와 함께 출연한 배우들을 모두 검색하라.

SELECT b.이름
FROM 배우 b,출연 c
WHERE b.번호 = c.배우번호
  AND b.이름 != '송강호'
  AND c.영화번호 IN (SELECT c.영화번호
				FROM 출연 c,배우 b
				WHERE b.번호 = c.배우번호
				  AND b.이름 = '송강호');