<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="qnaboard.*"%>
<%
/*
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	*/
	List boardList = (List) request.getAttribute("qnaboarlist");//일단 너만 받아봄
	QnaBean board = (QnaBean) request.getAttribute("qnabean");
	/*
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
	*/
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		

		
		
		<!--[if IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<scirpt src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<title>언제나 Terra Hotel</title>
		<style>
			.jumbotron {margin-bottom: 0;}
			/* 메뉴바 css */
			.affix { top: 0; width: 100%; }
			.affix + .jumbotron { padding-top: 70px; }		
			.navbar { border-radius: 0; z-index: 1000; width: 100%; background-color: #aabbff; }
			/* 메뉴바 축소할 때 css*/
			.navbar-toggle { background: #aaaaee; }
			.icon-bar { background: #fff; }
			
			.test{ text-align: center; }
		</style>
		
		<script type="text/javascript">
			function pagemove(str) {
				if(str=="1"){ location.href="consumer/login.html" }
				else if(str=="2"){ location.href="consumer/signup.jsp" }
			}
			function logout(){
				var con = confirm("접속을 종료하시겠습니까");
				if(con == true){
				location.replace("consumer/userlogout.jsp");
				}else{}
			}
		</script>
		<!--  이 부분 체크
		<script type="text/javascript">
		/*
function button_check(){
	//alert("로그인이 필요합니다.");	
	var id = '<%=(String)session.getAttribute("user_id")%>';
	<%=board.getQ_pw()%>
		//System.out.println(id);	
	//String id = null;
	//String id =null;	
	// request에서 id 파라미터를 가져온다
	//
	if(id==null) {
		// id가 Null 이거나 없을 경우
		alert("로그인이 필요합니다.");
		location.href="consumer/login.html" 
	}	else {	
	location.href="qnaboard/qna_board_write.jsp"
	//location.href="/AdminQnaBoardDeleteAction.ro"
	}
}
		*/
		</script>
		-->
		
		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	
	<div class="table-responsive">
	<div class="container">
	<h2>QNA 수정게시판</h2>
	<form action="AdminQnaBoardModifyAction.ro" method="post" name="modifyform">
	<input type="hidden" name="q_num" value="<%=board.getQ_num()%>">
		<input type="hidden" name="q_id" value="<%=board.getQ_id()%>">
		<input type="hidden" name="q_pw" value="<%=board.getQ_pw()%>">
		<table class="table table-border">
		<tr>
		<td>제 목</td> <td><input name="q_subject" size="50" maxlength="100"
					value="<%=board.getQ_subject()%>"> </td>
		</tr>
		<tr>
		<td>내 용</td>
				<td>
				<textarea name="q_content" cols="60" rows="15">
				<%=board.getQ_content()%></textarea>
				</td>
				
			</tr>
			<tr>
			<tr>
						<td>비밀번호</td>
						<td><input type="password" name="q_pw2" size="8">8자 이하 입력</td>
					</tr>		
		</table>			
	<input type="submit" name="modify" value="수 정" >
	<input type="submit" name="back" value="뒤 로" onclick="javascript:history.go(-1)">
	</form>	
	</div>
	</div>
</body>
</html>