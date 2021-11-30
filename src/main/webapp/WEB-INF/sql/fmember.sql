----------------- footprint member table ------------------------
CREATE TABLE fmember(
id                             VARCHAR2(10)  NOT NULL  PRIMARY KEY,
passwd                         VARCHAR2(20)  NOT NULL,
mname                          VARCHAR2(20)  NOT NULL,
tel                            VARCHAR2(14)  NULL ,
email                          VARCHAR2(50)  NOT NULL UNIQUE,
zipcode                        VARCHAR2(7)      NULL ,
address1                       VARCHAR2(150)  NULL ,
address2                       VARCHAR2(50)  NULL ,
job                            VARCHAR2(20)  NOT NULL,
mdate                          DATE          NOT NULL,
fname                          VARCHAR2(50)  DEFAULT 'member.jpg'  NOT NULL,
point                          NUMBER        DEFAULT '1000' NOT NULL,
grade                          VARCHAR2(1)   DEFAULT 'H'  NOT NULL
);

COMMENT ON TABLE fmember is '회원';
COMMENT ON COLUMN fmember.id is '아이디';
COMMENT ON COLUMN fmember.passwd is '비밀번호';
COMMENT ON COLUMN fmember.mname is '성명';
COMMENT ON COLUMN fmember.tel is '전화번호';
COMMENT ON COLUMN fmember.email is '이메일';
COMMENT ON COLUMN fmember.zipcode is '우편번호';
COMMENT ON COLUMN fmember.address1 is '주소';
COMMENT ON COLUMN fmember.address2 is '상세주소';
COMMENT ON COLUMN fmember.job is '직업';
COMMENT ON COLUMN fmember.mdate is '가입일';
COMMENT ON COLUMN fmember.fname is '회원사진';
COMMENT ON COLUMN fmember.point is '포인트';
COMMENT ON COLUMN fmember.grade is '회원등급';

--create 
INSERT INTO fmember(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, point, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'member.jpg', 'H');

INSERT INTO fmember(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자1', '123-1234', 'email2@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'member.jpg', 'H');

--관리자 계정
INSERT INTO fmember(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, point, grade) 
VALUES('admin', '1234', '관리자', '02-1234-1234', 'admin@mail.com',  
'123-123','서울시 서초구','남부터미널' ,'A01', sysdate, 'member.jpg', '1000', 'A'); 

select * from fmember;

--user1 회원 정보 보기 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, point, grade 
FROM fmember  
WHERE id='user2';

--회원 정보 수정 
UPDATE fmember  
SET passwd='1234',
    tel='123-123', 
    email='email10',
    zipcode='TEST',  
    address1='수원', 
    address2='팔달구', 
    job='TEST'
WHERE id = 'user2';

--패스워드 변경
UPDATE fmember
SET passwd='1234'
WHERE id='';

--회원 사진 이미지의 수정
UPDATE fmember 
SET fname='member.jpg' 
WHERE id='user2'; 

--'user2' 회원 삭제 
DELETE FROM fmember WHERE id='user2';

--로그인 관련 SQL 
SELECT COUNT(id) as cnt 
FROM fmember 
WHERE id = 'user1' AND passwd = '1234'; 

--list
SELECT id, mname, tel, email, zipcode, address1, address2,
fname, point,  r
from(
    SELECT id, mname, tel, email, zipcode, address1, address2,
    fname, point, rownum r
    from(
        SELECT id, mname, tel, email, zipcode, address1, 
        address2, fname, point
        FROM fmember
        where mname like '%개%'
        ORDER BY mdate DESC 
    )
)where r >= 1 and r <= 5;
