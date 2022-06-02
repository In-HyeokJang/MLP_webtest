<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="addr.*,java.util.*" %> 
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="addr.AddrDAO" />
<jsp:useBean id="dto" class="addr.AddrDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	Map map = new HashMap();
	map.put("addressnum", dto.getAddressnum());
	
	boolean flag = dao.create(dto);
%>

 
<!DOCTYPE html> 

<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
	<div class="well well-Lg">
	<%
		if(flag){
			out.print("글 수정 성공");
		}else{
			out.print("글 수정 실패");
		}
	%>
	</div>
	<button class='btn' onclick="location.href='createForm.jsp'">다시등록</button>
	<button class='btn' onclick="location.href='list.jsp'">목록</button>
</div>
</body> 
</html> 