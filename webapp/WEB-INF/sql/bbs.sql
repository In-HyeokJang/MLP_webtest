use webtest;
drop table if exists bbs;
CREATE TABLE bbs ( 
  bbsno     int NOT NULL auto_increment primary key,   -- 글 일련 번호
  wname     VARCHAR(20)      NOT NULL,   -- 글쓴이 
  title     VARCHAR(100)     NOT NULL,   -- 제목(*) 
  content   VARCHAR(4000)    NOT NULL,   -- 글 내용 
  passwd    VARCHAR(15)      NOT NULL,   -- 비밀 번호 
  viewcnt   int              DEFAULT 0,  -- 조회수, 기본값 사용 
  wdate     DATE             NOT NULL,   -- 등록 날짜,  
  grpno     int              DEFAULT 0,  -- 부모글 번호 
  indent    int              DEFAULT 0,  -- 답변여부,답변의 깊이
  ansnum    int              DEFAULT 0  -- 답변 순서 
);   
