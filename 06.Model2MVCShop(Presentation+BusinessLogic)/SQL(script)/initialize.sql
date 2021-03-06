
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;
DROP TABLE wishlist;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no		 	  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	  INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_wishlist_wish_no	  INCREMENT BY 1 START WITH 10000;




CREATE TABLE users ( 
	user_id 		  	  VARCHAR2(20)	  NOT NULL,
	user_name 	    VARCHAR2(50)	  NOT NULL,
	password 		    VARCHAR2(10)	  NOT NULL,
	role 			    		VARCHAR2(5) 		    DEFAULT 'user',
	ssn 			    		VARCHAR2(13),
	cell_phone 	    	VARCHAR2(14),
	addr 		  	  	VARCHAR2(100),
	email 			    	VARCHAR2(50),
	reg_date 	    	DATE,
	add_path			  VARCHAR2(20),
	PRIMARY KEY (user_id)
);


CREATE TABLE product ( 
	prod_no 				  		NUMBER 				NOT NULL,
	prod_name 		  		VARCHAR2(100) 	NOT NULL,
	prod_detail 		  		VARCHAR2(200),
	manufacture_day		  VARCHAR2(200),
	price 				  			NUMBER(20),
	image_file 			  		VARCHAR2(100),
	reg_date 			  	  	DATE,
	QUANTITY 			    	NUMBER 		  		NOT NULL,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 				  	NUMBER 			NOT NULL,
	prod_no 				  	NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 			  	VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option	  	VARCHAR(3),
	receiver_name 	  	VARCHAR2(20),
	receiver_phone		  VARCHAR2(14),
	demailaddr 			  VARCHAR2(100),
	dlvy_request 		  	VARCHAR2(100),
	tran_status_code  	VARCHAR(3),
	order_data 		  	DATE,
	dlvy_date 		  	  	DATE,
	purchaseqt             NUMBER NOT NULL,
	PRIMARY KEY(tran_no)
);

CREATE TABLE wishlist(
	wish_no				  NUMBER 			  	  NOT NULL,
	prod_no 		   	number(16) 		      NOT NULL REFERENCES     product(prod_no),
	user_id				  VARCHAR2(20)	    NOT NULL REFERENCES     users(user_id),
	PRIMARY KEY(wish_no)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '?????? ??????', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, 'site'); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, 'site');
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','???? ?????? ?????? ??????','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'??????','?????? ??????~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'??????','???? ?????? ????','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'????????','?????? ???? ??????????. ?????? ?????? ?????? ??.??','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'??????','??????','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'???????? 2G','sens ?????? 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'????','?????? ??????????','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'????????','??????','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),10);


commit;
