create table 유저
(회원번호 int not null
,아이디  varchar(50) not null
,이름   varchar(50) not null
,전화번호 int not null
);

create table 친구
(이름 Varchar(50) not null
,아이디 varchar(50) not null
,회원번호 int not null
,전화번호 int not null
);

create table 대화내용
(
    이름   Varchar(50) not null,
    아이디  varchar(50) not null,
    회원번호 int         not null,
    대화내용 text
);