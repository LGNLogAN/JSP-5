<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자율좌석 예약</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">

	function ccc(){
		if(document.frm2.empno.value.length == 0){
			alert("사원번호가 입력되지 않았습니다.");
			frm2.empno.focus();
			return false;
		}
		success();
	}
	
	function success(){
		alert("처리 중...");
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>좌석예약조회</h1>
		<form name="frm2" action="action2.jsp">
		<table border=1>
		
			<tr>
				<td>사원번호를 입력하시오</td>
				<td><input type="text" name="empno"></td>
			</tr>
			
			<tr>
				<td colspan=2;>
					<div class="InputAlign">
						<input type="submit" value="좌석예약조회" onclick = "return ccc()">
						<input type="submit" value="홈으로" onclick = "window.location.href='index.jsp'; return false;">
					</div>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>