<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="memo.*" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
int memono = Integer.parseInt(request.getParameter("memono"));
MemoDTO dto = dao.read(memono);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <style>
  #red{
  	color: red;
  }
  </style>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">메모 삭제</h1>
<form class="form-horizontal" 
      action="deleteProc.jsp"
      method="post"
      >
 <input type = "hidden" name="memono" value="<%=request.getParameter("memono") %>">
  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control" value="<%=dto.getWname() %>">
    </div>
  </div>
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구 할 수 없습니다.</p>

  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button class="btn" onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 