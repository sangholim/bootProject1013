create table user (
 userUid bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 id varchar(255) NOT NULL default '',
 pw varchar(255) NOT NULL default '',
 userName varchar(255) NOT NULL default '',
 active tinyint(2) default '1',
 addrPlace varchar(255) default '',
 mailNum varchar(255) default '',
 addrEmail varchar(255) NOT NULL default '',
 phoneNumber varchar(50) NOT NULL default '',
 gender varchar(2) NOT NULL default 'M',
 birthday varchar(50) NOT NULL default '',
 country varchar(50) default '',
 city varchar(50) default '',
 photoPath varchar(255) default '',
 createDate bigint(20) unsigned NOT NULL,
 modifyDate bigint(20) unsigned default '0',
 grantAuthLevel varchar(20) default 'user',
 PRIMARY KEY (userUid)
)


## 관리자 추가

INSERT INTO USER VALUES (NULL,'admin','1234','운영자','1','서울특별시 동대문구 용두동 천호대로 용두 탤리스 5-3','111-11','admin@naver.com',
						'010-1234-5678','M','19891127','KR','SEOUL','','1570164540000','0','admin');
						
## SAMPLE
INSERT INTO USER VALUES (NULL,'TEST','1234','TEST','1','TEST','111-11','admin@naver.com',
						'010-1234-5678','M','19891127','KR','SEOUL','','1570164540000','0','user');


## cafe 
create table cafe (
 cafeUid bigint(20) unsigned not null AUTO_INCREMENT,
 cafeName varchar(255) not null,
 cafeCategory varchar(255) not null,
 cafeDomTop text,
 cafeDomMid text,
 cafeDomBot text,
 PRIMARY KEY (cafeUid)
)


## user_relation
						
create table user_relation (
 userUid bigint(20) unsigned NOT NULL,
 cafeUid bigint(20) unsigned NOT NULL,
 cafeLevel varchar(20) NOT NULL,
 FOREIGN KEY (userUid) REFERENCES user (userUid),
 FOREIGN KEY (cafeUid) REFERENCES cafe (cafeUid)
)
