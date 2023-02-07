select 회원.회원번호, 회원.회원명, 주문.주문일자, 주문.배송지
from 회원, 주문
where 회원.회원번호 = 주문.회원번호
order by 회원.회원번호;

#조인에서 테이블 이름의 별명 사용

select m.회원번호, m.회원명, o.주문일자, o.배송지
from 회원 AS m, 주문 AS o
where m.회원번호 = o.회원번호
order by m.회원번호;

#출판사별 도서 목록 정보인 출판사 이름, 책 이름을 출력하라.

select p.출판사명 AS '출판사 이름', b.도서명 AS '책이름'
from 출판사 AS p, 도서 AS b
where p.출판사번호 = b.출판사번호
order by b.출판사번호;


#회원별 주문일자 목록 정보인 회원 이름, 주문일자를 출력하라.

select m.회원명 AS '회원 이름', o.주문일자
from 회원 AS m, 주문 AS o
where m.회원번호 = o.회원번호
order by m.회원번호;

#'영어'라는 문구가 포함된 도서의 도서번호, 도서명, 해당 출판사명을 출력하라.
select b.도서번호, b.도서명, p.출판사명
from 도서 AS b, 출판사 AS p
where p.출판사번호 = b.출판사번호
and b.도서명 LIKE '%영어%';

#가격이 25000원 이상인 도서의 도서번호, 도서명, 해당 출판사 이름을 출력하라.

select b.도서번호, b.도서명, p.출판사명
from 도서 AS b, 출판사 AS p
where p.출판사번호 = b.출판사번호
and b.가격 >= 25000;

#nation이라는 데이터베이스를 생성하라

create database nation;

use nation;

create table 국가
(
    이름 varchar(60) not null,
    영문이름 varchar(60),
    지역 varchar(60),
    인구 decimal(11),
    gdp decimal(14),
    primary key (이름)
);

#데이터 입력
insert into 국가
values('대한민국', 'Republic of Korea', '아시아', 47470969, 625700000000),
      ('일본', 'Japan', '아시아', 126549976, 29500000000),
      ('중국', 'China', '아시아', 1261832482, 480000000000),
      ('베트남', 'Vietnam', '동남아시아',78773873, 14310000000),
      ('사우디아라비아', 'Saudi Arabia', '중동', 22023506, 1910000000),
      ('아랍에미리트', 'United Arab Emirates', '중동', 2369153, 41500000000),
      ('영국', 'United Kingdom', '유럽', 59511464, 12900000000),
      ('프랑스', 'France', '유럽', 59329691, 137300000000),
      ('독일', 'Germany', '유럽', 82797408, 186400000000),
      ('스페인','Spain', '유럽', 39996671, 677500000000),
      ('이탈리아','Italy', '유럽', 57634327, 12120000000),
      ('그리스', 'Greece', '유럽', 10601527, 149200000000),
      ('러시아', 'Russia', '유럽', 14601176, 620300000000),
      ('미국', 'United States of America', '북아메리카', 31281092, 9255000000000),
      ('캐나다', 'Canada', '북아메리카', 31281092, 722300000000),
      ('파나마', 'Panama', '중앙아메리카', 2808268, 21000000000),
      ('페루', 'Peru', '남아메리카', 27012899, 116000000000);

select *
from 국가;

#지역 이름을 한번만 출력하라
select distinct 지역
from 국가;

#인구가 2억명 이상인 국가의 이름을 검색하라.

select 이름
from 국가
where 인구 >= 200000000;

#미국 인구를 잘못적음
update 국가 set 인구 = 275562673
where 이름 = '미국';

#인구가 2억 이상인 국가의 이름과 1인당 gdp를 검색하라.

select 이름, gdp / 인구 as '1인당 gdp'
from 국가
where 인구 >= 200000000;

#'중동'지역에 위치하고 있는 국가의 이름과 백만명당 인구를 검색하되, 결과값이
#정수가 아니면 반올림하라.

select 이름, round(인구 / 1000000)as '백만명당 인구'
from 국가
where 지역 = '중동';

#'프랑스', '독일', '이탈리아'의 국가 이름과 인구를 검색하라.

select 이름, 인구
from 국가
where 이름 in ('프랑스', '독일', '이탈리아');

#'United'라는 영문이 포함된 국가의 한글명과 영문명을 검색하라.

select 이름, 영문이름
from 국가
where 영문이름 Like '%United%';

#테이블에 저장된 국가들의 인구 합계를 검색하라

select sum(인구) as '총인구'
from 국가;

#각 지역에 속한 국가수를 지역과 함께 검색하라.

select 지역, count(지역) as '국가수'
from 국가
group by 지역;

#천만명 이상 인구를 가진 지역별 국가수를 검색하라.
select 지역, count(지역) as '국가수'
from 국가
where 인구 >= 10000000
group by 지역;


#전체 인구가 1억 이상인 지역을 검색하라.
select 지역
from 국가
where 인구 >= 100000000
group by 지역;

#인구가 '러시아'보다 많은 국가의 이름을 검색하라.

select 이름
from 국가
where 인구 > (select 인구
             from 국가
             where 이름 = '러시아');


#'그리스'와 '러시아'가 속한 지역에 속하는 국가의 모든 열을 검색하라
select *
from 국가
where 지역 = (select 지역
            from 국가
            where 이름 = '러시아')
and 지역 = (select 지역
          from 국가
          where 이름 = '그리스');


#1인당 GDP가 'United Kingdom'보다 많은 유럽 국가의 이름을 검색하라
select 이름
from 국가
where 지역 = '유렵'
and gdp / 인구 > (select gdp/인구
                  from 국가
                  where 영문이름 = '%United Kingdom%');


#인구가 사우디아라비아보다 많고 캐나다보다는 적은 국가의 이름을 검색하라
select 이름
from 국가
where 인구 > (select 인구
            from 국가
            where 이름 = '사우디아라비아')
and
    인구 < (select 인구
          from 국가
          where 이름 = '캐나다');


#music 데이터베이스 생성

create database music;

use music;

create table 앨범
(
    앨범번호 int not null,
    타이틀 varchar(30) not null,
    아티스트 varchar(30),
    가격 int,
    발매일 datetime,
    배급 varchar(30),
    별점 decimal(4,1),
    primary key (앨범번호)
);

create table 곡
(
    앨범번호 int not null,
    디스크 int not null,
    곡번호 int not null,
    곡명 varchar(50),
    구분 varchar(10),
    foreign key (앨범번호) references 앨범(앨범번호)
);

insert into 앨범
values (1, '조용필', '조용필', 11500, '1984-10-01', '벅스', 9.8),
       (2, '사랑하기 때문에', '유재하', 10400, '1987-08-20', 'KingPin', 9.7),
       (3, 'Break Up 2 Make Up', '지코(ZICO)', 700, '2016-01-25', 'CJ E&M MUSIC', 7.6),
       (4, '도깨비 OST Part 8', '정준일', 500, '2017-01-01', 'CJ E&M MUSIC', 9.5),
       (5, '도깨비 OST Part 9', '에일리', 600, '2017-01-07', 'CJ E&M MUSIC', 8);
insert into 곡(앨범번호, 디스크, 곡번호, 곡명)
    values
        (1,1,1,'돌아와요 부산항에'),
        (1,1,9,'해변의 여인'),
        (1,1,11,'옛 일'),
        (1,1,12,'서러워 말아요'),
        (1,1,15,'생각이 나네'),
        (2,1,1,'우리들의 사랑'),
        (2,1,2,'그대 내 품에'),
        (2,1,9,'사랑하기 때문에'),
        (3,1,1,'너는 나 나는 너'),
        (3,1,2,'사랑이었다(Feat.루나 of f(x)'),
        (4,1,1,'첫 눈');

insert into 곡(앨범번호, 디스크, 곡번호, 곡명, 구분)
values (4,1,2,'첫눈', 'Inst.'),
       (5,1,1,'첫눈처럼 너에게 가겠다','원곡'),
       (5,1,2,'첫눈처럼 너에게 가겠다', 'Inst.');

select *
from 곡;


#'해변의 여인'이라는 노래를 담고 있는 타이틀과 아티스트를 검색하라.
select a.타이틀, a.아티스트
from 앨범 AS a, 곡 AS b
where a.앨범번호 = b.앨범번호
and b.곡명 = '해변의 여인';

#'그대내품에'라는 노래를 부른 아티스트를 검색하라.

select a.아티스트
from 앨범 AS a, 곡 AS b
where a.앨범번호 = b.앨범번호
and b.곡명 = '그대 내 품에';

#'Break Up 2 Make Up'이라는 이름을 가지고 있는 앨범에 수록된 노래를 모두 검색하라.

select b.곡명
from 앨범 AS a, 곡 AS b
where a.앨범번호 = b.앨범번호
and a.타이틀 = 'Break Up 2 Make Up';

#각 앨범에 수록된 타이틀별 수록곡의 개수를 검색하라.

select a.타이틀, count(b.곡번호) as '수록곡 수'
from 앨범 AS a, 곡 AS b
where a.앨범번호 = b.앨범번호
group by a.타이틀;

#'사랑'이라는 단어가 포함된 곡명을 가진 앨범의 타이틀별 수록곡의 개수를 검색하라.

select a.타이틀, count(b.곡번호) as '수록곡 수'
from 앨범 AS a, 곡 AS b
where a.앨범번호 = b.앨범번호
and 곡명 like '%사랑%'
group by 타이틀;

#타이틀과 곡명이 동일한 앨범의 노래 이름을 검색하라

select b.곡명
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and a.타이틀 = b.곡명;


#수정사항
update 곡 set 곡명 = '첫 눈'
where 앨범번호 = 4
and 곡번호 = 2;

#동일한 곡명이 2개 이상 앨범에 존재하는 경우, 해당 곡명과 수록 곡의 개수를 검색하라.
select 곡명, count(앨범번호) as '수록곡 수'
from 곡
group by 곡명
having count(곡명) >=2;