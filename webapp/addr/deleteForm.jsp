<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ page import="addr.*" %>
<jsp:useBean id="dao" class="addr.AddrDAO" />
<% 
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	AddrDTO dto = dao.read(addressnum);

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
<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
<form class="form-horizontal" 
      action="deleteProc.jsp"
      method="post"
      >
  <input type="hidden" name="addressnum" value="<%=request.getParameter("addressnum") %>">
  <div class="form-group">
    <label class="control-label col-sm-2" for="name">이름</label>
    <div class="col-sm-6">
      <input type="text" name="name" id="name" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="handphone">전화번호</label>
    <div class="col-sm-6">
      <input type="text" name="handphone" id="handphone" class="form-control">
    </div>
  </div>
  
 <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구 할 수 없습니다</p>

   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 