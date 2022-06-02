<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="memo.*" %>
 <jsp:useBean id="dao" class="memo.MemoDAO" />
 <%
 	int memono = Integer.parseInt(request.getParameter("memono"));
 	dao.upViewcnt(memono);// 조회수 증가
 	MemoDTO dto = dao.read(memono);
 %>
 
<!DOCTYPE html>
<html>
<head>
 <title>homepage</title>
<meta charset="UTF-8">
<script type="text/javascript">
  	function update(memono){// 수정 페이지로 이동
  		
  		let url = 'updateForm.jsp?memono='+memono;
  		location.href = url;
  	}
  	function del(memono){// 삭제 페이지로 이동
  		
  		let url = 'deleteForm.jsp?memono='+memono;
  		location.href = url;
  	}
  	function reply(memono){ // 답변 페이지로 이동
  		
  		let url = 'replyForm.jsp?memono='+memono;
  		location.href = url;
  	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page= "/menu/top.jsp" />
<div class="container">
<h1>메모 조회</h1>
<div class="panel panel-default">
	<div class="panel-heading">작성자</div>
	<div class="panel-body"><%=dto.getWname() %></div>
	<div class="panel-heading">제목</div>
	<div class="panel-body"><%=dto.getTitle() %></div>
	<div class="panel-heading">내용</div>
	<div class="panel-body" style='height:170px'><%=dto.getContent() %></div>
	<div class="panel-heading">조회수</div>
	<div class="panel-body"><%=dto.getViewcnt() %></div>
	<div class="panel-heading">등록일</div>
	<div class="panel-body"><%=dto.getWdate() %></div>

</div>
<div>
	<button onclick="location.href='createForm.jsp'">등록</button>
	<button onclick="update('<%=memono%>')">수정</button>
	<button onclick="del('<%=memono%>')">삭제</button>
	<button onclick="reply('<%=memono%>')">답변</button>
	<button onclick="location.href='list.jsp'">목록</button>
</div>
</div>
</body>
</html>