<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="bbs.*, java.util.* "%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />

<%//  String wname = request.getParameter("wname"); 랑    dto.setWname(wname); 합친 코드 */ %>
<%//  property 에서 '*'를 쓰면 모든 속성 된다.' */ %>


<% 
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	boolean pflag = dao.passCheck(map);
	boolean flag = false;
	if(pflag) {  //올바른 비밀번호
		
		flag = dao.delete(bbsno);  // 삭제
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
	<div class="well well-lg">
	<%
		if(!pflag) { //비번 잘못되었을 때
			out.print("잘못된 비밀번호 입니다.");
		} else if(flag){
			out.print("글 삭제 성공입니다.");
		} else {
			out.print("글 삭제 실패입니다.");
		}
	%>
	</div>
	
	<% if(!pflag) { %>
		<button class = 'btn' onclick="history.back()">다시시도</button>
	<% } %>
	<button class='btn' onclick="location.href='createForm.jsp'">다시등록</button>
	<button class='btn' onclick="location.href='list.jsp'">목록</button>
</div>

</body>
</html>