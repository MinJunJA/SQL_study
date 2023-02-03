use bookstore_test;

insert into 출판사
values (1,'연두출판', '심하진', '031-900-0000');

insert into 출판사 (출판사번호, 출판사명, 담당자, 전화번호)
values (2, '생능출판', '이승기', '031-955-7000');

insert into 출판사
values (3, '알에이치코리아', null, '02-6443-8000');

insert into 출판사
values (4, '위즈덤하우스', '', '031-936-4000');

update 출판사
set 담당자 = '이승기'
where 출판사번호 = 2;

select *
from 출판사;

delete from 출판사
where 출판사번호 = 1;

select *
from 출판사;

insert into 출판사 (출판사번호, 출판사명, 담당자, 전화번호)
values (1,'연두출판','심하진','031-906-8000');

update 출판사
set 담당자 = '한원석'
where 출판사번호 = 3;

update 출판사
set 담당자 = '김태영'
where 출판사번호 = 4;

insert into 출판사 (출판사번호, 출판사명)
value (5, '빅히트출판');

insert into 도서 (도서번호, 도서명, 평점, 출판사번호)
values (1, '데이터베이스의 이해', 9.5, 1);

insert into 도서
values (2, '데이터베이스 배움터', '홍의경', 27000, 8.8, 2);

insert into 도서
values (3, '사례로 배우는 데이터베이스 설계와 구축', '이종만', 18000, 8.5, 1);

insert into 도서
values (4, '데이터베이스 설계 및 구축', '오세종', 26000, 9.2, 1);

insert into 도서
values (5, '당신의 이냉을 어떻게 평가할 것인가', '크리스텐슨', 13000, 8.2, 3);

insert into 도서
values (6, '영어책 한 권 외워봤니?', '김민식', 14000, 7.9, 4);


insert into 회원
values (1, '송중기', '850919-1380623', '서울 강남', '연기, 독서', 65, '평생회원', 12300);

insert into 회원
values (2, '서현', '910628-2113717', '서울 용산', '춤, 연기', 45, '정회원', 6100);

insert into 회원
values (3, '송혜교', '811122-2313728', '서울 구로', '연기, 독서', 45, '비회원', 100);

insert into 회원
values (4, '보아', '861105-2821912', '경기 용인', '춤, 영어', 45, '정회원', 7500);

insert into 회원 (회원번호,회원명,주민등록번호)
values (5, '김연경', '880226-2357948');


insert into 주문
values ('20170101002', '2017-01-01', '서울 강남', '카드', 4);

insert into 주문
values ('20170116001', '2017-01-16', '서울 구로', '현금', 1);

insert into 주문
values ('20170201001', '2017-02-01', '서울 강남', '카드', 2);

insert into 주문
values ('20170220001', '2017-02-20', '대구 북구', '카드', 4);

insert into 주문
values ('20170302001', '2017-03-02', '서울 구로', '현금', 1);

insert into 주문
values ('20170406001', '2017-04-06', '서울 구로', '현금', 1);

insert into 주문
values ('20170521001', '2017-05-21', '서울 강남', '카드', 2);

insert into 주문
values ('20170521003', '2017-05-21', '충북 청주', '현금', 1);

insert into 주문도서
values ('20170101002', 1, 2, 6);

insert into 주문도서
values ('20170116001', 1, 1, 5);

insert into 주문도서
values ('20170201001', 1, 2, 2);

insert into 주문도서
values ('20170220001', 1, 1, 5);

insert into 주문도서
values ('20170302001', 1, 2, 6);

insert into 주문도서
values ('20170406001', 1, 2, 4);

insert into 주문도서
values ('20170521001', 1, 1, 3);

insert into 주문도서
values ('20170521003', 1, 6, 3);

insert into 주문도서
values ('20170521003', 2, 4, 5);

insert into 주문도서
values ('20170521003', 3, 1, 2);

use bookstore_test;


------------------------------------------------------------------------


use chapter_7;

create table 제품
(
    제품번호 char(3)      not null,
    설명   varchar(255) not null,
    가격   int,
    재고량  int,
    primary key (제품번호)
);

create table 고객
(
    고객번호 char(4)     not null,
    이름   varchar(20) not null,
    주소   varchar(50) not null,
    모바일  varchar(20),
    primary key (고객번호)
);

create table 주문
(
    주문번호 char(5) not null,
    납기일  date    not null,
    담당자  varchar(20),
    계약조건 varchar(50),
    고객번호 char(4),
    primary key (주문번호)
);

create table 주문내역
(
    제품번호 char(3) not null,
    주문번호 char(5) not null,
    수량 int ,check (수량 > 0),
    primary key (제품번호, 주문번호),
    foreign key (제품번호) references 제품(제품번호),
    foreign key (주문번호) references 주문(주문번호)
);

insert into 제품 values ('101', '오렌지', 1000, 500);
insert into 제품 values ('102', '복숭아', 2000, 250);
insert into 제품 values ('103', '수박', 5000, 50);
insert into 제품 values ('104', '레몬', 2000, 200);

insert into 고객(고객번호,이름,주소)
values ('c101', '최미선', '인천');

insert into 고객(고객번호,이름,주소)
values ('c102','이수경','서울');

insert into 고객(고객번호,이름,주소)
values ('c103','유인나', '서울');

insert into 고객(고객번호,이름,주소)
values ('c104','아이유','서울');

insert into 주문(주문번호,납기일,고객번호) values ('o1001','2017-07-10','c101');
insert into 주문(주문번호,납기일,고객번호) values ('o1002','2017-07-17','c102');
insert into 주문(주문번호,납기일,고객번호) values ('o1003','2017-07-17','c102');
insert into 주문(주문번호,납기일,고객번호) values ('o1004','2017-08-15','c104');
insert into 주문(주문번호,납기일,고객번호) values ('o1005','2017-08-15','c101');
insert into 주문(주문번호,납기일,고객번호) values ('o1006','2017-08-25','c101');

insert into 주문내역(제품번호,주문번호,수량) values ('101', 'o1001',10);
insert into 주문내역(제품번호,주문번호,수량) values ('101', 'o1002',100);
insert into 주문내역(제품번호,주문번호,수량) values ('103', 'o1002',50);
insert into 주문내역(제품번호,주문번호,수량) values ('101', 'o1003',50);
insert into 주문내역(제품번호,주문번호,수량) values ('102', 'o1003',1);
insert into 주문내역(제품번호,주문번호,수량) values ('104', 'o1003',30);
insert into 주문내역(제품번호,주문번호,수량) values ('101', 'o1004',200);
insert into 주문내역(제품번호,주문번호,수량) values ('102', 'o1005',1);
insert into 주문내역(제품번호,주문번호,수량) values ('104', 'o1006',80);