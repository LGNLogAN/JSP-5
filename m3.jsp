<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자율좌석예약</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h1>부서별 근무일수 집계</h1>
		<table border=1>
			<tr>
				<td>사원번호</td>
				<td>이름</td>
				<td>부서명</td>
				<td>근무일수</td>
			</tr>
			<%
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					
					String sql = " select empno , empname , case deptcode when '10' then '영업부' when '20' then '총무팀' when '30' then '구매팀' end as deptcode1 , " +
								 " position " +
								 " from tbl_emp_2023 ";
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()){
						out.print("<tr><td>" + rs.getString("empno"));
						out.print("</td><td>" + rs.getString("empname"));
						out.print("</td><td>" + rs.getString("deptcode1"));
						out.print("</td><td>" + rs.getString("position") + "</td></td>");
					}
					
					stmt.close();
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>