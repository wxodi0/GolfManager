<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h3>Data base 연동 샘플</h3>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		if(con!=null) {
			out.println("Database Connect : ["+"<b>success</b>]<br>");
		}else {
			out.println("Database Connect : ["+"<b>fail</b>]<br>");
		}
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT teacher_code from tbl_teacher_202201");
		while(rs.next()){
			out.println("Today date:" + rs.getString(1) + "<hr>");
		}
		stmt.close();
		con.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
	<%@include file="footer.jsp" %>
</body>
</html>