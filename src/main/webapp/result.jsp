<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
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
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
Statement stmt = con.createStatement();

String sql = "SELECT t.TEACHER_CODE, t.CLASS_NAME, t.TEACHER_NAME, SUM(c.TUITION) "+
			"FROM TBL_TEACHER_202201 t " +
			"JOIN TBL_CLASS_202201 c ON t.TEACHER_CODE=c.TEACHER_CODE "+
			"GROUP BY t.TEACHER_CODE, t.CLASS_NAME, t.TEACHER_NAME "+
			"ORDER BY t.TEACHER_CODE ASC";

ResultSet rs = stmt.executeQuery(sql);
%>
	<h3>강사매출현황</h3>
	<table>
		<tr>
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>총매출</td>
		</tr>
		<%
		DecimalFormat df = new DecimalFormat("###,###");
		while(rs.next()) {
			int num = rs.getInt(4);
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=df.format(num) %></td>
			</tr>
		<%} %>
	</table>
	
<%@include file="footer.jsp" %>
</body>
</html>