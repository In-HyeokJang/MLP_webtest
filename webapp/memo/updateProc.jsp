<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="memo.*, java.util.* "%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	Map map = new HashMap();
	map.put("memono", dto.getMemono());
	map.put("passwd", dto.getPasswd());
	boolean pflag = dao.passCheck(map);
	boolean flag = false;
	if(pflag){
		flag = dao.update(dto);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class="container">
	<div class="well well-Lg">
	<%
		if(!pflag){
			out.print("잘못된 비밀번호 입니다.");
		}
		else if(flag){
			out.print("글 수정 성공");
		}else{
			out.print(" 글 수정 실패 ");
		}
	%>
	</div>
	<% if(!pflag) { %>
		<button class = 'btn' onclick ="history.back()">다시시도</button>
	<% } %>
	<button class="btn" onclick="location.href='createForm.jsp'">다시 등록</button>
	<button class="btn"onclick="location.href='list.jsp'">목록</button>
</div>

</body>
</html>