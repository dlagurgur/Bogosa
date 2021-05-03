SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Order_history;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS User_general;




/* Create Tables */

CREATE TABLE Order_history
(
	order_num int NOT NULL AUTO_INCREMENT,
	order_date  timestamp,
	product_id int NOT NULL,
	user_id varchar(20) NOT NULL,
	PRIMARY KEY (order_num)
);


CREATE TABLE product
(
	product_id int NOT NULL AUTO_INCREMENT,
	product_name varchar(25) NOT NULL,
	product_price int NOT NULL,
	product_image varchar(300),
	product_category int NOT NULL,
	product_detail varchar(5000) NOT NULL,
	user_id varchar(20) NOT NULL,
	PRIMARY KEY (product_id),
	UNIQUE (product_id)
);


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



/* Create Foreign Keys */

ALTER TABLE Order_history
	ADD FOREIGN KEY (product_id)
	REFERENCES product (product_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Order_history
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE product
	ADD FOREIGN KEY (user_id)
	REFERENCES User_general (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



