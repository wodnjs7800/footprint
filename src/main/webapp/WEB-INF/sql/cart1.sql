drop table cart1;

--CREATE TABLE cart1(
--    cartno NUMBER(10) NOT NULL  PRIMARY KEY,
--    id VARCHAR2(10) NOT NULL,
--    foodno NUMBER(10) null,
--    travelno NUMBER(10) null,
--    opt char(1) NOT NULL
--);
CREATE TABLE cart1(
    cartno NUMBER(10) NOT NULL  PRIMARY KEY,
    id VARCHAR2(10) NOT NULL,
    no NUMBER(10) null,
    opt char(1) NOT NULL
);
alter table cart1 add constraint cart1_travelno_fk
foreign key(travelno) references travel(travelno);

alter table cart1 add constraint cart1_foodno_fk
foreign key(foodno) references food(foodno);

delete from cart1;

INSERT INTO cart1(cartno, id, no, opt)
VALUES((select nvl(max(cartno),0)+1 from cart1), 'user1', 1, 'f');

INSERT INTO cart1(cartno, id, no, opt)
VALUES((select nvl(max(cartno),0)+1 from cart1), 'user1', 1, 't');



--SELECT c.cartno, c.id, f.foodname, f.fname, f.foodno
--FROM cart1 c INNER JOIN food f
--ON c.foodno = f.foodno
--where c.id = 'user1';
--
--SELECT c.cartno, c.id, t.travelname, t.fname, t.travelno
--FROM cart1 c INNER JOIN travel t
--ON c.travelno = t.travelno
--where c.id = 'user1';
SELECT cartno,no, id, foodname, ffname, foodno,
      travelname, tfname, travelno, opt,  r
from(
        SELECT cartno,no, id, foodname, ffname, foodno,
                travelname, tfname, travelno, opt, rownum r
        from (
                SELECT cartno, no,c.id id, foodname, f.fname ffname, foodno,
                travelname, t.fname tfname, travelno, opt
                FROM cart1 c INNER JOIN food f
                ON c.no = f.foodno
                JOIN travel t
                ON c.no = t.travelno
                where c.id = 'user1'
        )
)
where r >= 1 and r <= 8;
select * from cart1;

SELECT count(*)
FROM cart1 c INNER JOIN food f
ON c.no = f.foodno
JOIN travel t
ON c.no = t.travelno
where c.id = 'user1';

-- 