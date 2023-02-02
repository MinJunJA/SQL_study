use bookstore_test;


create table 출판사
(출판사번호 int           not null
,출판사명  varchar(30)   not null
,담당자   varchar(30)
,전화번호  varchar(15)
,primary key(출판사번호)
);

create table 도서
(도서번호 int not null
,도서명 varchar(50) not null
,저자 varchar(30)
,가격 int
,평점 decimal(4,1)
,출판사번호 int
,primary key(도서번호)
,foreign key(출판사번호) references 출판사(출판사번호)
);

create table 회원
(회원번호 int not null
,회원명 varchar(30) not null
,주민등록번호 char(14) unique
,주소 varchar(100)
,취미 varchar(50)
,몸무게 int
,등급 char(10) default '비회원'
,적립금 int default 0
,primary key(회원번호)
);

create table 주문
(
    주문번호 char(11) not null,
    주문일자 date     not null,
    배송지  varchar(100),
    결재방법 varchar(10) check (결재방법 in ('카드', '현금')),#check는 제약조건이라고 이해하면 될 듯.
    회원번호 int      not null,
    primary key (주문번호),
    foreign key (회원번호) references 회원 (회원번호)
);

create table 주문도서
(주문번호 char(11) not null
,일련번호 int not null
,주문수량 int not null
,도서번호 int not null
,primary key(주문번호,일련번호)
,foreign key(주문번호) references 주문(주문번호)
,foreign key (도서번호) references 도서(도서번호)
);





create table 제품
(제품번호 char(3) not null
,설명 varchar(255) not null
,가격 int
,재고량 int
,primary key (제품번호)
);

create table 고객
(고객번호 char(4) not null
,이름 varchar(20) not null
,주소 varchar(50)
,primary key (고객번호)
);

create table 주문
(주문번호 char(5) not null
,납기일 date not null
,담당자 varchar(20)
,계약조건 varchar(50)
,고객번호 char(4)
,primary key(주문번호)
);

create table 주문내역
(제품번호 char(3) not null
,주문번호 char(5) not null
,수량 int
,primary key(제품번호, 주문번호)
,foreign key (제품번호) references 제품(제품번호)
,foreign key (주문번호) references 주문(주문번호)
);


alter table 고객
add 집전화 varchar(20),
add 모바일 varchar(20);


alter table 고객
drop column 집전화;

alter table 주문내역
drop column 수량;

