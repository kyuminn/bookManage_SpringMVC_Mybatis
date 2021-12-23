	create table books(
		id number primary key,
		bookimagename varchar2(255) not null,
		isbn number unique,
		book_name varchar2(255) not null,
		writer varchar2(250) not null,
		publisher varchar2(255) not null,
		price number not null,
		content varchar2(2550) not null);
	
	create sequence book_seq start with 1 increment by 1 nocache noorder nocycle maxvalue 999999;