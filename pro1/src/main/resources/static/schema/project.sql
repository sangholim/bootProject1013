create table user (
 userUid bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 id varchar(255) NOT NULL default '' unique,
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
 userNickName varchar(255) default '',
 PRIMARY KEY (userUid)
)

ALTER TABLE user ADD COLUMN  userNickName varchar(255) default '';


## 관리자 추가

INSERT INTO USER VALUES (NULL,'admin','1234','운영자','1','서울특별시 동대문구 용두동 천호대로 용두 탤리스 5-3','111-11','admin@naver.com',
						'010-1234-5678','M','19891127','KR','SEOUL','','1570164540000','0','admin');
						
## SAMPLE
INSERT INTO USER VALUES (NULL,'TEST','1234','TEST','1','TEST','111-11','admin@naver.com',
						'010-1234-5678','M','19891127','KR','SEOUL','','1570164540000','0','user');


## cafe 
create table cafe (
 uid bigint(20) unsigned not null AUTO_INCREMENT,
 name nvarchar(255) not null default '',
 url nvarchar(255) not null default '',
 usePrivate tinyint(1) unsigned default 1,
 joinType tinyint(1) unsigned default 1,
 useNickname tinyint(1) unsigned default 1,
 showMember tinyint(1) unsigned default 0,
 title_mainSort tinyint(2) default -1,
 title_subSort varchar(10) default -1,
 region_mainSort tinyint(2) default -1,
 region_subSort varchar(10) default -1,
 keywordList nvarchar(255) default '',
 icon nvarchar(255) default '',
 visitCnt bigint(20) unsigned not null default '0',
 writingCnt bigint(20) unsigned not null default '0',
 memberCnt bigint(20) unsigned not null default '0',
 `desc` bigint(20) unsigned not null default '0',
 `useShortCut` tinyint(2) unsigned not null default '0',
 `createDate` bigint(20) unsigned NOT NULL,
 PRIMARY KEY (uid)
)

## table column 변경

ALTER TABLE cafe ADD COLUMN  visitCnt bigint(20) unsigned not null default '0';
ALTER TABLE cafe ADD COLUMN  writingCnt bigint(20) unsigned not null default '0';
ALTER TABLE cafe ADD COLUMN  memberCnt bigint(20) unsigned not null default '0';
ALTER TABLE cafe ADD COLUMN `desc` nvarchar(255) default '';
ALTER TABLE cafe ADD COLUMN `useShortCut` tinyint(2) default 0 not null;
ALTER TABLE cafe ADD COLUMN  `createDate` bigint(20) unsigned NOT NULL;
ALTER TABLE cafe MODIFY  COLUMN `region_subSort` varchar(10) default 0 not null;
ALTER TABLE cafe MODIFY  COLUMN `title_subSort` varchar(10) default 0 not null;
ALTER TABLE cafe MODIFY  COLUMN `useShortCut` varchar(10) default '0';
ALTER TABLE cafe DROP COLUMN `cafeFav`;


## cafe 샘플 테이블 하나 만들기
INSERT INTO cafe VALUES (NULL,'TEST_CAFE','test','1','1','1','0','1',
						'1','1','1','','');
INSERT INTO cafe VALUES ('TEST_CAFE2','t2t2t','1','1','1','0','1',
						'1','1','1','0','0','0','0','0','0','0');

## 유저가 카페 가입하거나 생성시 이용되는 테이블
						
create table user_cafe (
 userUid bigint(20) unsigned NOT NULL,
 cafeUid bigint(20) unsigned NOT NULL,
 cafeLevel varchar(20) NOT NULL,
 cafeFav tinyInt(1) default 0,
 cafeOfficial tinyInt(1) default 0,
 cafeNicName varchar(20) default '',
 FOREIGN KEY (userUid) REFERENCES user (userUid),
 FOREIGN KEY (cafeUid) REFERENCES cafe (uid)
)


ALTER TABLE user_cafe ADD COLUMN `cafeFav` tinyint(1) default 0;
ALTER TABLE user_cafe ADD COLUMN `cafeOfficial` tinyint(1) default 0;
ALTER TABLE user_cafe ADD COLUMN `cafeNicName` varchar(20) default '';

/*
    userRole 추가
    -2 탈퇴
    -1 가입중
    0 새싹맴버
    1  일반멤버
    2 성실멤버
    3 열심
    4 우수
    5 감사
    6 카페 운영자
    7 카페 매니저

 */
ALTER TABLE user_cafe ADD COLUMN `userRole` tinyint(3) default 0;



## 유저가 카페 가입하거나 생성
INSERT INTO user_cafe VALUES ('21','1','0');


## cafeBoard 게시판 schema

create table userCafeBoard (
	boardUid bigint(20) unsigned NOT NULL,
	userUid bigint(20) unsigned NOT NULL,
	cafeUid bigint(20) unsigned NOT NULL,
	subject varchar(255) NOT NULL,
	content text NOT NULL default '',
	writer varchar(255) NOT NULL,
	addfile varchar(255) NOT NULL,
	createDate bigint(20) unsigned NOT NULL,
	modifiedDate bigint(20) unsigned NOT NULL,
	viewCnt bigint(20) unsigned NOT NULL  default 0,
	PRIMARY KEY (boardUid),
	FOREIGN KEY (userUid) REFERENCES user_cafe (userUid),
	FOREIGN KEY (cafeUid) REFERENCES user_cafe (cafeUid)
)


ALTER TABLE usercafeboard MODIFY COLUMN `boardUid` bigInt(20) auto_increment;
ALTER TABLE usercafeboard ADD COLUMN `viewCnt` bigint(20) unsigned default 0;

