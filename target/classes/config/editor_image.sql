create table editor_image(
 	id number,
 	content_type varchar2(50),
 	file_name varchar2(300),
	file_path varchar2(300),
	reg_date date,
	save_file_name varchar2(300),
 	img_size number
);

select * from editor_image;

create sequence imageUP_seq
start with 1
increment by 1
nocache
nocycle;

drop sequence imageUP_seq;

drop table editor_image;