<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자율좌석 예약</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	function aaa(){
		if(document.frm.resvno.value.length == 0){
			alert("에약번호가 입력되지 않았습니다.");
			frm.resvno.focus();
			return false;
		}
		if(document.frm.empno.value.length == 0){
			alert("사원번호가 입력되지 않았습니다.");
			frm.empno.focus();
			return false;
		}
		if(document.frm.resvdate.value.length == 0){
			alert("근무일자가 입력되지 않았습니다.");
			frm.resvdate.focus();
			return false;
		}
		if(document.frm.seatno.value.length == 0){
			alert("좌석번호가 입력되지 않았습니다.");
			frm.seatno.focus();
			return false;
		}
		success();
		return true;
	}
	
	function success(){
		alert("좌석예약정보가 등록되었습니다.");
		return ture;
	}
	
	function bbb(){
		alert("정보를 지우고 처음부터 다시 입력합니다 !");
		frm.resvno.focus();
		return false
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>근무좌석예약</h1>
		<form name="frm" action="action.jsp">
			<table border=1>
				<tr>
					<td><b>예약번호</b></td>
					<td><input type="text" name='resvno'>예) 20211001</td>
				</tr>
				
				<tr>
					<td><b>사원번호</b></td>
					<td><input type="text" name='empno'>예) 1001</td>
				</tr>
				
				<tr>
					<td><b>근무일자</b></td>
					<td><input type="text" name='resvdate'>예) 20211004</td>
				</tr>
				
				<tr>
					<td><b>좌석번호</b></td>
					<td><input type="text" name='seatno'>예) S001 ~ S009</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="InputAlign">
							<input type='submit' value="등록" onclick='return aaa()'>
							<input type='reset' value="다시쓰기" onclick='return bbb()'>
						</div>
					</td>
				</tr>
				
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>