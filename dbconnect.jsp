<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCONNECT</title>
</head>
<body>
	<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			
			String sql = "select sysdate from dual";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				out.print(rs.getString(1));
			}
			
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
</body>
</html>