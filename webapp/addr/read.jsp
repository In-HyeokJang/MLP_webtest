<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="addr.*" %>
<jsp:useBean id="dao" class="addr.AddrDAO"/>
<%
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	AddrDTO dto = dao.read(addressnum); // 한건의 레코드(데이터) 조회
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	function update(addressnum){//수정페이지로 이동
  		let url = 'updateForm.jsp?addressnum='+addressnum;
  		location.href = url;
  	}
  	function del(addressnum){// 삭제 페이지로 이동
  		//alert(bbsno);
  		let url = 'deleteForm.jsp?bbsno='+bbsno;
  		location.href = url;
  	}

  </script>
  
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1>주소록</h1>
<div class="panel panel-default">
	<div class="panel-heading">이름</div>
	<div class="panel-body"><%=dto.getName() %></div>
	<div class="panel-heading">전화번호</div>
	<div class="panel-body"><%=dto.getHandphone() %></div>
	<div class="panel-heading">우편번호</div>
	<div class="panel-body"><%=dto.getZipcode() %></div>
	<div class="panel-heading">주소</div>
	<div class="panel-body"><%=dto.getAddress() %></div>
	<div class="panel-heading">상세주소</div>
	<div class="panel-body"><%=dto.getAddress2( )%></div> <div>
	<button onclick="location.href='createForm.jsp'">등록</button>
	<button onclick="update('<%=addressnum%>')">수정</button>
	<button onclick="del('<%=addressnum %>')">삭제</button>
	<button onclick="location.href='list.jsp'">목록</button>

</div>
   </div>
 </div>


</body> 
</html> 