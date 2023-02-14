select mem_id as '회원아이디', sum(price*amount) as '총구매금액'
from buy
group by mem_id
having sum(price*amount) > 1000;


#복습
# select 열이름
# from 테이블_이름
# where 조건식
# group by 열이름
# having 조건식
# order by 열 이름
# limit 숫자

#입력,삭제,수정하는 기능을 제공하는 insert,update,delete

create table hongong1
(
    toy_id int,
    toy_name char(4),
    age int
);

insert into hongong1 (toy_id, toy_name, age)
values (1,'우디',25);

insert into hongong1 (toy_id, toy_name) values (2,'버즈');

insert into hongong1 (toy_name, age, toy_id) values ('제시',20,3);


#auto_increment - 1부터 증가하는 값을 입력해준다, auto_increment로 지정하는 열은 꼭 primary key로 지정해주어야 한다.
create table hongong2
(
    toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);

insert into hongong2 values (null,'보핍',25),
                            (null,'슬링키',22),
                            (null,'렉스',21);

select *
from hongong2

alter table hongong2 auto_increment = 100;
insert into hongong2 values (null,'재남',35);
select *
from hongong2;

#@@auto_increment_increment 예제

create table hongong3 (
    toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);

alter table hongong3 auto_increment = 1000;
set @@auto_increment_increment = 3;    #-->증가값을 3으로 지정한다.

insert into hongong3 values (null,'토마스',20),
                            (null,'제임스',23),
                            (null,'고든',25);

select *
from hongong3;


#무신사 스토어 DB설계

create table musinsa_mem
(
    num int primary key,
    id varchar(50) not null ,
    i_name varchar(50) not null ,
    nickname varchar(50) not null ,
    e_mail varchar(50),
    phone int not null
)

create table 상의
(
    전체 varchar(20) not null
    니트_스웨터 varchar(20) not null,
    후드티셔츠 varchar(20) not null,
    맨투맨_스웨트셔츠 varchar(20) not null,
    긴소매_티셔츠 varchar(20) not null,
    셔츠_블라우스 varchar(20) not null,
    반소매_티셔츠 varchar(20) not null,
    기타상의 varchar(20) not null,
    primary key (전체)
);


create table 아우터
(
    전체 varchar(20) not null,
    후드집업 varchar(20) not null,
    환절기코트 varchar(20) not null,
    겨울싱글코트 varchar(20) not null,
    블루종_MA1 varchar(20) not null,
    롱패딩_롱헤비아우터 varchar(20) not null,
    베스트 varchar(20) not null,
    기타아우터 varchar(20) not null,
    primary key (전체)
);

create table 바지
(
    전체 varchar(20) not null,
    데님팬츠 varchar(20) not null,
    숏팬츠 varchar(20) not null,
    코튼팬츠 varchar(20) not null,
    레깅스 varchar(20) not null,
    기타바지 varchar(20) NOT NULL,
    primary key (전체)
);

create table 신발
(
    전체 varchar(20) not null,
    구두 varchar(20) not null,
    로퍼 varchar(20) not null,
    슬리퍼 varchar(20) not null,
    부츠 varchar(20) not null,
    primary key (전체)
);

