create table user (
 userUid bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 id varchar(255) NOT NULL default '',
 pw varchar(255) NOT NULL default '',
 userName varchar(255) NOT NULL default '',
 active tinyint(2) default '1',
 addrPlace varchar(255) NOT NULL default '',
 mailNum varchar(255) NOT NULL default '',
 addrEmail varchar(255) NOT NULL default '',
 phoneNumber varchar(50) NOT NULL default '',
 country varchar(50) NOT NULL default '',
 city varchar(50) NOT NULL default '',
 photoPath varchar(255) NOT NULL default '',
 createDate bigint(20) unsigned NOT NULL,
 modifyDate bigint(20) unsigned NOT NULL default '0',
 grantAuthLevel varchar(20) NOT NULL default 'user',
 PRIMARY KEY (userUid)
)


## 관리자 추가

INSERT INTO USER VALUES ('0','admin','1234','운영자','1','서울특별시 동대문구 용두동 천호대로 용두 탤리스 5-3','111-11','admin@naver.com',
						'010-1234-5678','KR','SEOUL','','1570164540000','0','admin');
						
## SAMPLE
INSERT INTO USER VALUES (NULL,'TEST','1234','TEST','1','TEST','111-11','admin@naver.com',
						'010-1234-5678','KR','SEOUL','','1570164540000','0','user');
