<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자율좌석 예약</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	
		<%
			
			String empno = request.getParameter("empno");
			
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				
				String sql = " select te.empno , te.empname ," + 
							 " substr(tr.resvdate,1,4)||'년'||substr(tr.resvdate,5,2)||'월'||substr(tr.resvdate,7,2)||'일' as date1," + 
							 " ts.seatno ,ts.office , ts.callno " +
							 " from tbl_emp_2023 te , tbl_seat_2023 ts , tbl_resv_2023 tr " +
							 " where te.empno = tr.empno and ts.seatno = tr.seatno and tr.empno = '"+empno+"'";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs.next()){
					%>
					<h1>사원번호 : <%= request.getParameter("empno")%>님의 좌석예약조회</h1>
					<table border=1>
					<%
					do{
						out.print("<tr><td>"+ rs.getString("empno"));
						out.print("</td><td>"+ rs.getString("empname"));
						out.print("</td><td>"+ rs.getString("date1"));
						out.print("</td><td>"+ rs.getString("seatno"));
						out.print("</td><td>"+ rs.getString("office"));
						out.print("</td><td>"+ rs.getString("callno") + "</td></tr>");
					}while(rs.next());
					
					%>
					</table>
					<div class="InputAlign" style="margin-top : 10px;">
						<button onclick="window.location.href='index.jsp'">돌아가기</button>
					</div>
					<%
					
				}else{
					%>
					<h1>좌석예약정보가 존재하지 않습니다 !</h1>
					<div class="InputAlign" style="margin-top : 10px;">
						<button onclick="window.location.href='index.jsp'">돌아가기</button>
					</div>
					<%
				}
				
				stmt.close();
				con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}

		%>		
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>