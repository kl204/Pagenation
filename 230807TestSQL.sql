drop table simple_board;
create table simple_board(
	seq integer primary key auto_increment,
	title varchar(100) not null,
	content varchar(1000) not null,
	writer varchar(20) not null, -- id
	read_count integer default 0,
	create_date datetime not null,
	attatch_password varchar(10),
	attatch_data varchar(100)
);

drop table comment_table;
create table comment_table(
	seq integer primary key auto_increment,
	writer varchar(20) not null,
	content varchar(1000) not null,
	comment_like integer default '0',
    comment_hate integer default '0',
    board_seq integer ,
    comment_seq integer 
);

-- 댓글 쿼리 
select * from comment_table;

insert into comment_table(writer, content) values("작성자1","내용이다앙");


SELECT seq FROM simple_board WHERE (title LIKE concat('%', IF("방명"="", null, "방명") ,'%') OR  content LIKE CONCAT('%', IF(""="", null, ""), '%') OR writer LIKE CONCAT('%',IF(""="", null, ""), '%'));

SELECT * FROM simple_board WHERE seq in (SELECT seq FROM simple_board WHERE (title LIKE concat('%', IF("방명"="", null, "방명") ,'%') OR  content LIKE CONCAT('%', IF(""="", null, ""), '%') OR writer LIKE CONCAT('%',IF(""="", null, ""), '%'))) LIMIT 2 OFFSET 0;

SELECT * FROM simple_board WHERE title LIKE concat('%', IF("방명"="", null, "방명") ,'%') OR  content LIKE CONCAT('%', IF(""="", null, ""), '%') OR writer LIKE CONCAT('%',IF(""="", null, ""), '%');

SELECT * from simple_board where seq = 12 LIMIT 2 OFFSET 0;

select * from simple_board where seq = 2;

select * from simple_board;

-- ////// 방명록 쿼리 ///////
-- 1. 전체 방명록 리스트
select * from simple_board;
-- 2. 특정 방명록
select * from simple_board where seq = 1;
-- 3. 방명록 등록
insert into simple_board(title, content, writer, read_count, create_date, attatch_password, attatch_data) values("방명록1","내용","작성자1",4,now(),"1234","12323.png");
-- 4. 방명록 삭제
delete from simple_board where seq= 1;
-- 5. 방명록 조회
SELECT * FROM simple_board WHERE title LIKE "%2%"  OR content LIKE "% %" OR writer LIKE "% %";

SELECT * FROM simple_board WHERE (title LIKE CONCAT('%', IFNULL(null, ' '), '%') OR  content LIKE CONCAT('%', IFNULL(null, ' '), '%') OR writer LIKE CONCAT('%', IFNULL(null, ' '), '%'));

-- 6. 조회수 업데이트
update simple_board set read_count = (read_count + 1) where seq = 1;