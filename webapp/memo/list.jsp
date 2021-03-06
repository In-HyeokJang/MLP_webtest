<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*, memo.MemoDTO, utility.*" %> 
<jsp:useBean id="dao" class="memo.MemoDAO" />

<%
//검색관련--------------
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total"))word = "";


//페이징 관련---------------
int nowPage = 1;
if(request.getParameter("nowPage") != null){
nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage = 10;

int sno = ((nowPage -1) * recordPerPage);
int eno = recordPerPage;

Map map = new HashMap<String,String>();
map.put("col",col);
map.put("word",word);
map.put("sno",sno);
map.put("eno",eno);

	List<MemoDTO> list = dao.list(map);
	int total = dao.total(map);
	String paging = Utility.paging(total,nowPage, recordPerPage, col, word);
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type ="text/javascript">
  	function read(memono){
  		let url = "read.jsp?memono="+memono;
  		location.href=url;
  	}
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">메모 목록</h1>
<form action="list.jsp" class='form-inline'>
  <div class="form-group">
   <select class='form-control' name='col'>
   	<option value="total" <%if(col.equals("total")) out.print("selected");%>>전체출력</option>
   	<option value="title" <%if(col.equals("title")) out.print("selected");%>>제목</option>
  	<option value="wname" <%if(col.equals("wname")) out.print("selected");%>>작성자</option>
  	<option value="title_content" <%if(col.equals("title_content")) out.print("selected");%>>제목+내용</option>
   </select>	
 </div>
 <div class="form-group">
  <input type='text' class='form-control' placeholder='Enter 검색어' name='word' value="<%=word%>">
</div>
 <button class='btn btn-default'>검색</button>
 <%-- 다시 등록으로 되돌아가게 만들기 --%>
<button class='btn btn-default' type='button' onclick="location.href='createForm.jsp'">등록</button> 
</form>
<table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
	</thead>
	<tbody>
	<% if(list.size() == 0){ %>
		<tr><td colspan ="7">등록된 글이 없습니다.</td></tr>
	<%} else{
		for(int i=0; i<list.size(); i++){
			MemoDTO dto = list.get(i);
	%>
	
	<tr>
			<td><%=dto.getMemono() %></td>
			<td>
				<%
					for(int j=0; j<dto.getIndent(); j++){
						out.print("&nbsp;&nbsp;");
					}// 들여쓰기 코드
				       if(dto.getIndent()>0)
				           // out.print("[답변]");
				               out.print("<img src='../images/re.jpg' >"); // re 이미지 넣는 코드
				%>
			<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
			<% if(Utility.compareDay(dto.getWdate())) {%>
				<img src="../images/new.gif">
				<%} %>
	
		</td>
		<td><%=dto.getWname()%></td> 
		<td><%=dto.getWdate() %></td>
		<td><%=dto.getGrpno() %></td>
		<td><%=dto.getIndent() %></td>
		<td><%=dto.getAnsnum() %></td>
	</tr>
<%		}
	}
	%>

	</tbody>
</table>
<div>
<%=paging %>
</div>
</div>
</body> 
</html> 