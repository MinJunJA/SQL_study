create table 국내도서
(
    국내도서_전체 varchar(255),
    소설 varchar(255) null,
    시_에세이 varchar(255) null,
    인문 varchar(255) null,
    요리 varchar(255) null,
    자기개발 varchar(255) null,
    청소년 varchar(255) null,
    primary key (국내도서_전체)
);

create table 서양도서
(
    서양도서_전체 varchar(255),
    문학 varchar(255) null,
    예술 varchar(255) null,
    인문 varchar(255) null,
    경제 varchar(255) null,
    과학 varchar(255) null,
    건축 varchar(255) null,
    생활 varchar(255) null,
    교재 varchar(255) null,
    primary key (서양도서_전체)
);

create table 교보문고
(
    메뉴 varchar(255),
    회원번호 int,
    이름 varchar(50),
    주소 varchar(255),
    전화번호 int
);


create table 일본도서
(
    일본도서_전체 varchar(255),
    잡지 varchar(255) null,
    엔터테인먼트 varchar(255) null,
    만화 varchar(255) null,
    애니 varchar(255) null,
    문학 varchar(255) null,
    라이트노벨 varchar(255) null,
    실용서 varchar(255) null,
    예술 varchar(255) null,
    primary key (일본도서_전체)
);