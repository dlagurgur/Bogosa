SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS User_general;




/* Create Tables */

CREATE TABLE User_general
(
	user_id varchar(20) NOT NULL,
	user_pw varchar(20) NOT NULL,
	user_name varchar(10) NOT NULL,
	user_phone varchar(20) NOT NULL,
	user_addr varchar(30),
	user_addr2 varchar(20) NOT NULL,
	user_email varchar(30) NOT NULL,
	user_corp int(5) NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (user_id),
	UNIQUE (user_email)
);



